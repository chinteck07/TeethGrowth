library(shiny)
library(DT)
library(datasets)
shinyUI(navbarPage("",
                   
                   tabPanel("Tooth Growth Comparison Orange Juice (OJ) vs. Ascorbic Acid(VC) Apps", 
                            
                            mainPanel( 
                                    
                                    fluidRow(
                                            
                                            
                                            
                                            radioButtons("radio", label = h3("Select daily dose level of Vitamin C:"), choices = (unique(ToothGrowth$dose)), selected = NULL )
                                            
                                    ),
                                    
                                    
                                    fluidRow(
                                            
                                            div(column(6,
                                                       
                                                       plotOutput("tooth_plot", height="400")) 
                                            ),   
                                            
                                            
                                            
                                            div( style="width:155%;",column(6,                                
                                                                            DT::dataTableOutput("Tooth_Growth"), style = "font-size:100%" )
                                            )                     
                                            
                                    ),
                                    
                                    fluidRow(
                                            tabsetPanel(
                                                    
                                                    tabPanel(
                                                            h4('Prediction Tooth Growth', align ="center",style = "color:blue"),
                                                            h4('Daily dose level of Vitamin C selected(mg)'),
                                                            verbatimTextOutput("inputValue"),
                                                            
                                                            h4('Estimated Tooth Growth by OJ vs. VC)'),
                                                            verbatimTextOutput("outputVC")
                                                            
                                                            
                                                            
                                                    ),
                                                    
                                                    tabPanel(
                                                            h4('About This Shiny App', align ="center",style = "color:blue"),
                                                            htmlOutput("readme")
                                                            
                                                            
                                                    )
                                            )
                                    )
                            )
                   )            
                   
))