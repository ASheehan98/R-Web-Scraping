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
         textInput("model","Vehicle Model","Enter Model"),
         textInput("zip", "Zip Code", "Enter Zipcode")
      ),
      
      mainPanel(
         verbatimTextOutput("distPlot"),
         verbatimTextOutput("url")
      )
   )
)

server <- function(input, output) {
   
   output$distPlot <- renderPrint({
     make = input$make
     model = input$model
     zip = input$zip
     finalurl = paste0(firsturl,make,plus,model,secondurl,make,thirdurl,model,fourthurl,zip,fifthurl)
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
   output$url <- renderPrint({
     make = input$make
     model = input$model
     zip = input$zip
     finalurl = paste0(firsturl,make,plus,model,secondurl,make,thirdurl,model,fourthurl,zip,fifthurl)
     finalurl
     

     
   })
}

shinyApp(ui = ui, server = server)

