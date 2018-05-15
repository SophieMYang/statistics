##https://gist.github.com/wch/4211337
library(dplyr)
library(here)
library(ggplot2)
library(reshape2)
library(shiny)
library(smyStats)

# input variables    | description
#--------------------|-------------------------------------------
# choose_dataset     | dataset name
# choose_columns     | columns selected from dataset
# sample_size_table  | number of rows to present in Sample Data
# sample_size_plot   | number of rows to plot from dataset.

# reactive variables | description
#--------------------|-------------------------------------------
# dataset            | dataset contents of user selected dataset
# dataset_toc        | dataset table of contents
# dataset_cd         | dataset column descriptions from dataset_toc
# dataset.sample     | dataset

data_sets <- list.files(here('data'))


shinyServer(function(input, output) {
# begin reactive definitions
    # get user selected dataset
    dataset <- reactive ({
        # If missing input, return to avoid error later in function
        if(is.null(input$dataset)) {
            return()
        }
        # Get the data set
        dataset <- loadRData(here('data',input$dataset))
        dataset
    })

    # Get the dataset metadata table of contents, toc.
    dataset_toc <- reactive({
        # If missing input, return to avoid error later in function
        if(is.null(input$dataset)) {
            return()
        }

        dat <- dataset()
        distinct_values <- dat %>% summarise_all(funs(n_distinct(.)))
        distinct_values <- melt(distinct_values)[,2]
        na_values       <- dat %>% summarise_all(funs(sum(is.na(.))))
        na_values       <- melt(na_values)[,2]
        DataTypes       <- unlist(lapply(dat[1,],class))
        # Get the data set table of contents
        toc_file <- gsub('.rdata','_toc.rmd',input$dataset,ignore.case=TRUE)

        if (file.exists(here('RMD',toc_file))) {
            toc_df   <- read.delim(here('RMD',toc_file),header=TRUE,sep ='|',as.is=TRUE)
            toc_df   <- toc_df %>%
                filter(!grepl('-',Column))  # remove header separator associated with rmd table
        } else { # Build a default dataset_toc.rmd file
            Seq         <- 1:length(dat)
            Column      <- colnames(dat)
            Description <- paste0(Column,':no-desc',sep='')
            mxSeq_len         <- max(unlist(lapply(as.character(Seq),nchar)),nchar('Seq'))
            mxColumn_len      <- max(unlist(lapply(as.character(Seq),nchar)),nchar('Column'))
            mxDescription_len <- max(unlist(lapply(Description,nchar)),nchar('Description'))
            toc_df <- as.data.frame(cbind(Seq,Column,Description))
            # Add RMD table header seperator dashes, write will add the | separators
            Seq         <- c('Seq',str_pad('-',mxSeq_len,side='right',pad='-'),Seq)
            Column      <- c('Column',str_pad('-',mxColumn_len,side='right',pad='-'),Column)
            Description <- c('Description',str_pad('-',mxDescription_len,side='right',pad='-'),Description)
            write(rbind(Seq,Column,Description)
                  ,file=here('RMD',gsub('.rdata','_toc.rmd',input$dataset,ignore.case=TRUE))
                  ,ncol=3,sep="|")
        }
        toc_df <- cbind(toc_df,DataTypes,Distinct=distinct_values,NAs=na_values)
        toc_df
    })

    # Get the dataset metadata column names and descriptions from table of contents, cd.
    dataset_col_desc <- reactive({
        # If missing input, return to avoid error later in function
        if(is.null(input$dataset)) {
            return()
        }
        toc_df <- dataset_toc()
        cd <- toc_df %>%
            # remove header separator associated with rmd table
            filter(!grepl('-',Column)) %>%
            mutate(cd=paste0(Seq,': ',Description,'==>',Column)) %>%
            select(cd)
        cd
    })

    sample.dataset <- reactive({
        # randomly draw input$samples of input$sample_size from a normal distribution with mean=input$meand and sd = input$mu
        data <-as.data.frame(t(sapply(1:input$samples
                                      ,function(x) rnorm(n=input$sample_size
                                                         ,mean=input$mean
                                                         ,sd=input$mu)
                                      )
                               )
                             )

        d <- as.data.frame(cbind( observation = seq(1:input$samples)
                                 ,obs_mean     = apply(data, 1, mean)
                                 ,obs_sd       = apply(data, 1, sd)
                                 ,data
                                 ))
        return(d)
    })

# end reactive definitions#####################################################



  # Drop-down dataset selection box
  output$choose_dataset <- renderUI({
    selectInput("dataset", "Data set", as.list(data_sets))
  })
  # Drop-down choose columns selection box
  output$choose_columns <- renderUI({
    # # If missing input, return to avoid error later in function
    # if(is.null(input$dataset))
    #   return()
    #
    # # Get the data set with the appropriate name
    # dat <- loadRData(here('data',input$dataset))

    dat <- dataset()
    colnames <- names(dat)
    coldesc  <- dataset_col_desc()

    # Select One or more columns
    selectInput(inputId  = 'columns'
               ,label    = 'Choose columns'
#               ,choices  =  colnames
               ,choices  =  coldesc
               ,multiple = TRUE
               # ,selectize= FALSE
               # ,size     = 30
               )
  }
  )

  output$result <- renderText({
      paste("You chose", input$state)
  })

  # Output the MetaData
  output$MetaData <- DT::renderDataTable({
      DT::datatable( dataset_toc()
                    ,rownames=FALSE
                    ,filter='top'
                    ,options = list(autoWidth = TRUE)
                    )})

  # Output Sample data
  output$SampleData <- renderTable({
    dat <- dataset()
    column_wo_desc <- gsub('.*==>','',input$columns)
    if (is.null(input$columns) || !(column_wo_desc %in% names(dat)))
      return()
    # Keep the selected columns
    dat <- dat[, column_wo_desc, drop = FALSE]

    # Return first 20 rows
    head(dat, input$sample_size_table)
  })

    output$pop.dist <- renderPlot ({
        dat<-data.frame(x=c(-3*input$mu + input$mean,3*input$mu + input$mean))
        ggplot(dat,aes(x))+stat_function(fun=dnorm,n=input$sample_size,args=list(mean=input$mean,sd=input$mu))+
            scale_y_continuous(breaks=NULL)
    })

    output$sample.dist <- renderPlot({
        # d <- as.data.frame(cbind(x = seq(1:input$samples)
        #                         ,mean = apply(sample.dataset(), 1, mean)
        #                         ,sd = apply(sample.dataset(), 1, sd)
        #                         )
        #                   )
        # d_mean <- mean(d[1:input$samples,'mean'])
        # d_sd   <-   sd(d[1:input$samples,'sd'])
        # ggplot(d[1:input$samples,],aes(x)) +
        #     geom_point(aes(y=mean,color='mean')) +
        #     geom_point(aes(y=sd,color='sd'))+
        #     geom_hline(yintercept=input$mean) +
        #     geom_hline(yintercept=input$mu) +
        #     geom_hline(yintercept=d_mean,color='blue') +
        #     geom_hline(yintercept=d_sd,color='green')

        d_mean_of_means <- mean(sample.dataset()[,'obs_mean'])
        d_sd_of_means   <- mean(sample.dataset()[,'obs_sd'])
        ggplot(sample.dataset(),aes(observation)) +
#            geom_histogram(mapping=obs_mean,data=sample.dataset(),binwidth=.01) +
            geom_point(aes(y=obs_mean,color='obs_mean')) +
            geom_point(aes(y=obs_sd  ,color='obs_sd')) +
            geom_hline(yintercept=input$mean) +
            geom_hline(yintercept=input$mu) +
            geom_hline(yintercept=d_mean_of_means,color='blue') +
            geom_hline(yintercept=d_sd_of_means,color='green') +
            ylab('Mean of Means\nSD of Means') +
            labs(title = paste0(input$samples,' Random Samples of Size ',input$sample_size
                       ,' Drawn From a Normal Population With Mean ',input$mean,' and SD ',input$mu
                       ,'\nMean of Means =',format(d_mean_of_means,digits=4,nsmall=2),' (blue)'
                       ,' SD of the means =',format(d_sd_of_means,digits=4,nsmall=2),' (green)'))

    })

    output$pop.table <- renderTable ({
        sample.dataset()
    })



  # Output Plot Decsion Tree
  output$PlottingDecisionTree <- renderImage({
      filename <- normalizePath(here('images','PlottingDecisionTree.PNG'))
      list(src=filename)
      }
      ,deleteFile = FALSE
      )
  # Output Plot Decsion Tree
  output$Research <- renderImage({
      filename <- normalizePath(here('images','Research.PNG'))
      list(src=filename)
  }
  ,deleteFile = FALSE
  )

  # Menu:ID:Output=Documentation:Statistical Tests:Statistical_Test_FlowCharts.html
  output$Statistical_Test_FlowCharts <- renderUI({
      includeHTML(here('html','Statistical_Test_FlowCharts.html'))
  })

  # Menu:ID:Output=Development:OS3_Issues:OS3-Issues.html
  output$OS3_Issues <- renderUI({
      includeHTML(here('html','OS3_Issues.html'))
  })

  # Menu:ID:Output=Development:
  output$rmd_file <- renderUI({
      includeMarkdown(here('rmd','Statistical_Test_FlowCharts.Rmd'))
  })

})
