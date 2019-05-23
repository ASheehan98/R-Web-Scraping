#
#

library(shiny)

ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         textInput("make","make","Enter Make"),
         textInput("model","model","Enter Model")
      ),
      
      mainPanel(
         textOutput("distPlot")
      )
   )
)

server <- function(input, output) {
   
   output$distPlot <- renderPrint({
     make = input$make
     model = input$model
     finalurl = paste0(firsturl,make,plus,model,secondurl,make,thirdurl,model,fourthurl)
     print(finalurl)

   })
}

shinyApp(ui = ui, server = server)

