# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(tidyverse)
library(shiny)
library(DT)
# Define UI for Gender Pay Gap app ----

shinyUI <- fluidPage(
    
    # App title ----
    titlePanel("Arrests in US states per 100,000 residents in 1973"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Input: Select the data type ----
            radioButtons("USArrests", "Arrest type:",
                         c("Murder" = "Murder",
                           "Assault" = "Assault",
                           "Rape" = "Rape"))
            
            
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Tabset w/ plot, and table ----
            tabsetPanel(type = "tabs",
                        tabPanel("Plot", plotOutput("plot")),
                        tabPanel("Summary", verbatimTextOutput("summary")),
                        tabPanel("Table", DT::dataTableOutput("table")),
                        tabPanel("Documentation", verbatimTextOutput("documentation")))
        )
        
    )
)







