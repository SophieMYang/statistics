modNavbarMenuUI <- function(id) {
    ns <- NS(id)

    navbarMenu('Wip' #
                ,tabPanel('Wip Panel'
                          ,sidebarLayout(
                              sidebarPanel(fluidRow(column(3,numericInput(ns("mean"), "Mean"   , 0, min = -100, max = 100))
                                                    ,column(3,numericInput(ns("mu") , "Std Dev", 1, min = 0, max = 100))
                                                    ,column(6,'blank')
                              )
                              ,fluidRow(column(3,numericInput(ns("samples"), "Samples",25, min = 0, max = 10000))
                                        ,column(3,numericInput(ns("sample_size"), "Size", 100, min = 1, max = 10000))
                                        ,column(6,'blank')
                              )
                              ,fluidRow(column(12,numericInput(ns('seed'),'Seed Value',1234,min=1,max=5000)))
                              ) # sidebarPanel
                              ,mainPanel(tabsetPanel( tabPanel(ns('Wip_Tab1')

                                                               ,'WIP Main Panel'
                                                               ,plotOutput(na("pop.dist"))
                              )

                              ) # tabsetPanel

                              ) # mainPanel
                          ) # sidebarLayout
                ) # tabPanel
    ) # navbarMenu

}

modNavbarMenu <- function (input, output, session) {
    output$pop.dist <- renderPlot ({
        dat<-data.frame(x=c(-3*input$mu + input$mean,3*input$mu + input$mean))
        ggplot(dat,aes(x))+stat_function(fun=dnorm,n=input$sample_size,args=list(mean=input$mean,sd=input$mu))+
            scale_y_continuous(breaks=NULL)
    })
}

