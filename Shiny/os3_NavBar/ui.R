# ,navbarMenu('Wip' #
#             ,tabPanel('Wip Panel'
#                       ,sidebarLayout(
#                           sidebarPanel('Wip SideBar')
#                           ,mainPanel(tabsetPanel( tabPanel('Wip Tab1'
#                                                           ,plotOutput ("Wip_Plot1")
#                                                           ,tableOutput('Wip_tbl1')
#                                                           )
#                                                 , tabPanel('Wip Tab2'
#                                                           ,plotOutput ("Wip_Plot3")
#                                                           ,tableOutput('Wip_tbl2')
#                                                           )
#                           ) # tabsetPanel
#                           ,'WIP Main Panel'
#                           ) # mainPanel
#                       ) # sidebarLayout
#             ) # tabPanel
# ) # navbarMenu


library(shinycssloaders)
navbarPage("OS3"
           ,navbarMenu('EDA'
                       , tabPanel("Get Data"
                                  ,sidebarLayout(
                                      sidebarPanel( withSpinner(uiOutput("choose_dataset"),type=4)
                                                    ,uiOutput("choose_columns")
                                                    ,numericInput("sample_size_table", label = "Table Sample Size", value = 10)
                                                    ,numericInput("sample_size_plot" , label = "Plot Sample Size" , value = 200)
                                      )
                                      , mainPanel(
                                          tabsetPanel(
                                              tabPanel('SampleData', tableOutput("SampleData"))
                                              ,tabPanel('Metadata',withSpinner(DT::dataTableOutput("MetaData")))
                                          ) #end of tabsetPanel
                                      ) #end of mainPanel
                                  ) #end of sidebarPanel
                       ) #end of tabPanel-Get Data
           ) # navbarMenu EDA
           ,navbarMenu('Inference' #
                       ,tabPanel('Sampling Variability'
                                 ,sidebarLayout(
                                     sidebarPanel('Sampling SideBar')
                                     ,mainPanel(tabsetPanel(tabPanel('Sampling Tab1',tableOutput('Sampling_Out1'))
                                                            ,tabPanel('Sampling Tab2',tableOutput('Sampling_Out2'))
                                                            ) # tabsetPanel
                                     ,'Inference Main Panel'
                                     ) # mainPanel
                                 ) # sidebarLayout
                       ) # tabPanel
                       ,tabPanel('Central Limit Theorem'
                                 ,sidebarLayout(
                                     sidebarPanel('CLT SideBar')
                                     ,mainPanel(tabsetPanel(tabPanel('CLT Tab1',tableOutput('CLT_OUT1'))
                                                            ,tabPanel('CLT Tab2',tableOutput('CLT_Out2'))
                                                            ) # tabsetPanel
                                                ,'https://gallery.shinyapps.io/CLT_mean'
                                                ) # mainPanel
                                     ) # sidebarLayout
                       ) # tabPanel
           ) # navbarMenu

           ,navbarMenu('Decision Trees' # Display PNG Files
                       ,tabPanel('Plotting Data      ',withSpinner(plotOutput('PlottingDecisionTree')))
                       ,tabPanel('Statistical Methods',withSpinner(plotOutput('Research')))
           )
           # Display HTML documents.
           #    RMD documents with with diagrammeR graphs converted to HTML do not display the graphs
           #    Work around: Save graph as PNG and add link to RMD document, generate HTML.
           ,navbarMenu('Documentation'
                       ,tabPanel('Statistical Tests',withSpinner(htmlOutput('Statistical_Test_FlowCharts')))
           )
           ,navbarMenu('Development'
                       ,tabPanel('Issues-Open',withSpinner(htmlOutput('OS3_Issues')))
                       ,'----'
                       ,'Coding Issue Examples'
                       ,tabPanel('RMD r blocks not hidden', htmlOutput("rmd_file"))
                       #,tabPanel('RMD r blocks not hidden', includeMarkdown(here('rmd','Statistical_Test_FlowCharts.Rmd')))
                       ,"tabPanel('Statistical Tests',includeHTML(here('html','Statistical_Test_FlowCharts.html'))) HANGS"
           )
           ,navbarMenu('Wip' #
                       ,tabPanel('Wip Panel'
                                 ,sidebarLayout(
                                     sidebarPanel(fluidRow(column(3,numericInput("mean", "Mean"   , 0, min = -100, max = 100))
                                                          ,column(3,numericInput("mu"  , "Std Dev", 1, min = 0, max = 100))
                                                          ,column(6,'blank')
                                                          )
                                                 ,fluidRow(column(3,numericInput("samples", "Samples",25, min = 0, max = 10000))
                                                          ,column(3,numericInput("sample_size", "Size", 100, min = 1, max = 10000))
                                                          ,column(6,'blank')
                                                          )
                                                 ,fluidRow(column(12,numericInput('seed','Seed Value',1234,min=1,max=5000)))
                                                ) # sidebarPanel
                                     ,mainPanel(tabsetPanel( tabPanel('Wip Tab1'
                                                                     ,'WIP Main Panel'
                                                                     ,plotOutput("pop.dist")
                                                                     )
                                                            ,tabPanel('Wip Tab2',tableOutput('Wip_Out2'))
                                                            ) # tabsetPanel

                                                ) # mainPanel
                                 ) # sidebarLayout
                       ) # tabPanel
           ) # navbarMenu
) #end of navbarPage
