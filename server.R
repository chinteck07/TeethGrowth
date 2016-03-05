library(shiny)
library(DT)
library(ggplot2)
library(datasets)

shinyServer(function(input, output) {
        output$inputValue <- renderPrint({input$radio})
     
     
        myplot <- function(dat) {        
                boxplot(len~supp,data = dat, col = c("red", "blue"), 
                        main = "Tooth Growth", xlab ="Suppliment", ylab = "length in mm")
        }
   
       tsummary <-function(dat1){
             t1<- t.test(len~supp, paired=F, var.equal=F, data=dat1)
             t1[5]
       }
       
       getPage<-function() {
               return(includeHTML("Note.html"))
       }
       output$readme<-renderUI({getPage()})
        
        
        output$Tooth_Growth <- DT::renderDataTable(rownames = FALSE,options= list(pageLength=5, autoWidth = TRUE,columnDefs = list(list(width = '500px', targets = "repair"))),selection = 'single',{
                data <- ToothGrowth     
                if (input$radio != "All"){
                        data <- data[data$dose == input$radio,]
                        output$tooth_plot<- renderPlot(width="auto" ,height="auto"   , {
                                myplot(data)
                                
                        }) 
                        output$outputVC<-renderPrint(tsummary(data))
                }
                
                
                if (input$radio == "All"){
                        output$tooth_plot<- renderPlot(width="auto" ,height="auto"  , {
                                myplot(ToothGrowth)
                        }) 
                        
                        
                }
                data
                
        })
        
})