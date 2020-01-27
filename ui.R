#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# This is the user interface for the shiny app to determine diamond price based on factors such as carat, cut, color, and clarity a Shiny web application. You can

library(shiny)
library(ggplot2)

# load data
data("diamonds")

# Define UI for the application
shinyUI(fluidPage(titlePanel("Diamonds - Cost depends on Carat, Cut, Color, and Clarity"),
                  
                  # Sidebar with a slider input for number of variables
                  sidebarLayout(sidebarPanel(h4("Choose Diamond Factors"),
                                             selectInput("cut", "Cut", (sort(unique(diamonds$cut), decreasing = T))),
                                             selectInput("color", "Color", (sort(unique(diamonds$color)))),
                                             selectInput("clarity", "Clarity", (sort(unique(diamonds$clarity), decreasing = T))),
                                             sliderInput("lm", "Carat",
                                                         min = min(diamonds$carat), max = max(diamonds$carat),
                                                         value = max(diamonds$carat) / 2, step = 0.1),
                                             h4("Predicted Price"), verbatimTextOutput("predict"), width = 4,
                                             h4('User guide'),
                                             h5('1. Choose your desired parameters of the diamond'),
                                             h6('a. Cut is a categorical parameters that shows how perferct the cut is. The ideal is the best, to fair be the worst'),
                                             h6('b. Color of the diamond can be colorless to yellow-ish. D is the best and larger letter, more color in the diamond'),
                                             h6('c. Calarity indicates purity of the diamond, the less objects it contains the better diamond it is. IF being the best and I1 is the worst among the list'),
                                             h6('d. You can slide the bar in carat section to set the weight of diamon you desire to quote the price for.'),
                                             h5('2. The predicted price is in the predicted price tag'),
                                             h5('3. Right hand panel show the relation between price and carot givent the cut, color and clarity being set.')),
                                           
                                
                                # Show a plot of the carat/price relationship
                                mainPanel("Price/Carat Relationship", plotOutput("distPlot"))
                  )))