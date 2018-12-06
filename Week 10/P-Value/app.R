#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("P-Value Calculation from Z-Score"),
   
   numericInput("zscore", "Z-Score", value = 1), 
   
   selectInput("tails", 'Number of tails', choices = c('2 tailed', 'Lower Tailed', 'Upper Tailed')),
   mainPanel(textOutput("pval"))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
output$pval = renderText({
  if(input$tails == 'Lower Tailed'){
    pVal <- pnorm(input$zscore,lower.tail=TRUE)
  }
  else 
    if(input$tails == 'Upper Tailed'){
        pVal <- pnorm(input$zscore,lower.tail=FALSE)
      }
    else pVal <- 2*pnorm(abs(input$zscore),lower.tail=FALSE)  #two-tailed

    paste("The p-value for a ",input$tails," test with z* = ", input$zscore," is: ",round(pVal,digits=4),".",sep="")
      })
}

# Run the application 
shinyApp(ui = ui, server = server)

