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
ui = basicPage(
  numericInput("num", label = "Make changes", value = 1),
  submitButton("Update View", icon("refresh")),
  helpText("When you click the button above, you should see",
           "the output below update to reflect the value you",
           "entered at the top:"),
  verbatimTextOutput("value")
)
server = function(input, output) {
  
  # submit buttons do not have a value of their own,
  # they control when the app accesses values of other widgets.
  # input$num is the value of the number widget.
  output$value <- renderPrint({ input$num })
}

# Run the application 
shinyApp(ui = ui, server = server)

