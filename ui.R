#
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
        titlePanel("Median Earnings in 2017, Source: US Census Bureau"),
        
        # Sidebar layout with input and output definitions ----
        sidebarLayout(
                
                # Sidebar panel for inputs ----
                sidebarPanel(
                        
                        # Input: Select the data type ----
                        radioButtons("mydata", "Data type:",
                                     c("Median earnings" = "Median.Overall",
                                       "Median female earnings" = "Median.Female",
                                       "Median male earnings" = "Median.Male",
                                       "Women's earnings as a percentage of male's earnings" = "Percentage"))
                        
                        
                        
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

       





