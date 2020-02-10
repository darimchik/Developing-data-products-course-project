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
        mydata <- switch(input$USArrests,
                         Murder = USArrests$`Murder`,
                         Assault = USArrests$`Assault`,
                         Rape = USArrests$`Rape`,
                         Murder)
        
        
    })
    
    
    
    output$plot <- renderPlot({
        
        USArrests <- input$USArrests
        
        library(readr)
        library(plotly)
        library(dplyr)
        library(tidyverse)
        library(DT)
        
        
        
        
        USArrests <- USArrests
        
        hist(d(),
             col = "#75AADB", border = "white", main="Arrests in US states in 1973")
    })
    
    # Generate a summary of the data ----
    output$summary <- renderPrint({
        summary(d())
    })
    
    output$table <- DT::renderDataTable({USArrests
    })
    
    output$documentation <- renderText({
        "USArrests contains statistics, in arrests per 100,000 residents for assault, murder, 
        and rape in each of the 50 US states in 1973. 
        Also given is the percent of the population living in urban areas.
                        
        Choose which arrest type you would like to see by clicking on one the the choice buttons. 
        A histogram plot and a summary will be produced for each arrest type. 
        Table tab contains information on arrests by state. 
        You can rank states by clicking on the corresponding column." 
        
    })
}