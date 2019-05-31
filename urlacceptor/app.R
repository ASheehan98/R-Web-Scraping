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
         textInput("zip", "Zip Code", "Enter Zipcode"),
         selectInput("length", "Select Result Amount", c("25","50","100","200")),
         submitButton("Update Listing")
      ),
      
      mainPanel(
        verbatimTextOutput("flirt"),
        verbatimTextOutput("distPlot2"),
         verbatimTextOutput("url"),
        plotOutput("plot")
        
      )
   )
)

server <- function(input, output) {
  
  output$flirt <- renderPrint({
    if(input$make == "Honda" & input$model == "Civic") {
      print("Hey, that's Brianna's Car!")
    }
  })
  
  
  
  
  output$distPlot2 <- renderPrint({
    make = input$make
    model = input$modle
    zip = input$zip
    page = input$length
    url1 = "https://www.ebay.com/sch/Cars-Trucks/6001/i.html?_from=R40&_nkw="
    plus = "+"
    url2 = "&rt=nc&LH_BIN=1&UF_single_selection=Make%3A"
    url3 = "%2CModel%3A"
    url4 = "&UF_context=finderType%3AVEHICLE_FINDER&_sacat=6001&_stpos="
    url5 = "&_fspt=1&_ipg="
    #https://www.ebay.com/sch/Cars-Trucks/6001/i.html?_from=R40&_nkw=Honda+Civic&rt=nc&LH_BIN=1&UF_single_selection=Make%3AHonda%
    #2CModel%3ACivic&UF_context=finderType%3AVEHICLE_FINDER&_sacat=6001&_stpos=60441&_fspt=1&_ipg=100
    finalurl = paste0(url1,make,plus,model,url2,make,url3,model,url4,url5)
    
    
    
    if(input$length == "25") {
      resultlength = "25"
      urlfinal = paste0(finalurl,resultlength)
      page1 = read_html(urlfinal)
      listing1 = gettitle(page1)
      adjlisting1 = listing1[-c(1)]
      price1 = pricefunc(page1)
      masterdf = data.frame("Listing" = adjlisting1, "Price" = price1)
    }
    

    if(input$length == "50") {
      resultlength = "50"
      urlfinal = paste0(url1,make,plus,model,url2,make,url3,model,url4,url5,resultlength)
      page1 = read_html(urlfinal)
      listing1 = gettitle(page1)
      adjlisting1 = listing1[-c(1)]
      price1 = pricefunc(page1)
      masterdf = data.frame("Listing" = adjlisting1, "Price" = price1)
    }
    if(input$length == "100") {
      resultlength = "100"
      urlfinal = paste0(url1,make,plus,model,url2,make,url3,model,url4,url5,resultlength)
      page1 = read_html(urlfinal)
      listing1 = gettitle(page1)
      adjlisting1 = listing1[-c(1)]
      price1 = pricefunc(page1)
      masterdf = data.frame("Listing" = adjlisting1, "Price" = price1)
    }
    if(input$length == "200") {
      resultlength = "200"
      urlfinal = paste0(url1,make,plus,model,url2,make,url3,model,url4,url5,resultlength)
      page1 = read_html(urlfinal)
      listing1 = gettitle(page1)
      adjlisting1 = listing1[-c(1)]
      price1 = pricefunc(page1)
      masterdf = data.frame("Listing" = adjlisting1, "Price" = price1)
    }
    
    
    
    
    
    
masterdf
   })
  
  
  
  
   
  
   output$url <- renderPrint({
     make = input$make
     model = input$model
     zip = input$zip
     url1 = "https://www.ebay.com/sch/Cars-Trucks/6001/i.html?_from=R40&_nkw="
     plus = "+"
     url2 = "&rt=nc&LH_BIN=1&UF_single_selection=Make%3A"
     url3 = "%2CModel%3A"
     url4 = "&UF_context=finderType%3AVEHICLE_FINDER&_sacat=6001&_stpos="
     url5 = "&_fspt=1&_ipg=100"
     urlfinal = paste0(url1,make,plus,model,url2,make,url3,model,url4,zip,url5)
     html = read_html(urlfinal)
     listy = gettitle(html)
     listy
  
     

     
   })
}

shinyApp(ui = ui, server = server)

