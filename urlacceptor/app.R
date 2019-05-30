#
#

library(shiny)

ui <- fluidPage(
   
   # Application title
   titlePanel("Car Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         textInput("make","Vehicle Make","Enter Make"),
         textInput("model","Vehicle Model","Enter Model")
      ),
      
      mainPanel(
         verbatimTextOutput("distPlot")
      )
   )
)

server <- function(input, output) {
   
   output$distPlot <- renderPrint({
     make = input$make
     model = input$model
     finalurl = paste0(firsturl,make,plus,model,secondurl,make,thirdurl,model,fourthurl)
     cardat = read_html(finalurl)
     carpric = cardat %>%
       html_nodes(".s-item__price")%>%
       html_text()
     adjusted = priceadjust(carpric)
     gettitle = function(x) {
       x %>%
         html_nodes(".s-item__title")%>%
         html_text()
     }
     listing = gettitle(cardat)
     finallisting = data.frame("Listing" = listing, "Price" = adjusted)
     finallisting

   })
}

shinyApp(ui = ui, server = server)

