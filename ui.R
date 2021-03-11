
library(shiny)
library(shinythemes)
library(readxl)
library(ggplot2)
data3 <- read_excel("data3.xlsx")

sexdata <- read_excel("sexdata.xlsx")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    theme = shinytheme("lumen"),
    # Application title
    titlePanel("Industrial Statistics"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("var2","Demographic Charactaristics",choices =names(sexdata[,2:4])),
            selectInput("var1","Socioeconomic Charactaristics",choices =names(data3[,2:6]))
            
            
            # varSelectInput("var1", "Variable:", data3)
            
            
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("Plot"),
            plotOutput("plot1")
        )
    )
))
