#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer <- function(input, output) {
        
        
                
                # Reactive expression to generate the requested map ----
                # This is called whenever the inputs change. The output functions
                # defined below then use the value computed from this expression
                d <- reactive({
                        mydata <- switch(input$mydata,
                                         Median.Overall = mydata$`Median earnings`,
                                         Median.Female = mydata$`Median female earnings`,
                                         Median.Male = mydata$`Median male earnings`,
                                         Percentage = mydata$`Women's earnings as a percentage of men's earnings`,
                                         Percentage)
                        
                        
                })
                
               
                
                output$plot <- renderPlot({
                        
                        mydata <- input$mydata
                        
                        library(readr)
                        library(plotly)
                        library(dplyr)
                        library(tidyverse)
                        library(DT)
                        
                        
                    
                        
                      mydata <- read_csv("https://github.com/darimchik/Developing-data-products-course-project/blob/master/mydata.csv")
                        
                      hist(d(),
                             col = "#75AADB", border = "white")
                })
                
                # Generate a summary of the data ----
                output$summary <- renderPrint({
                        summary(d())
                })
                
                output$table <- DT::renderDataTable({mydata
                                  })
                
                output$documentation <- renderText({
                        "This Shiny app contains information on Median US Earnings in 2017, including 4 data types

                        Overall Median Earnings
                        Female Median Earnings
                        Male Median Earnings
                        Women-to-men Median Earnings
                        
Choose which data type you would like to see by clicking on one the the choice buttons. 
A histogram plot and a summary will be produced for each data type. 
Table tab contains information on median earnings by state. 
You can rank states by clicking on the corresponding column." 
                        
                })
}