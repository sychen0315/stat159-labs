library(shiny)

advertising <- read.csv("Advertising.csv", sep = ",", row.names = 1)

ui <- fluidPage(
  headerPanel('Scatterplots of Sales VS. different advertising channels'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', colnames(advertising)[1:3]),
    selectInput('ycol', 'Y Variable', colnames(advertising)[4])
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

server <- function(input, output) {
  selectedData <- reactive({
    advertising[,c(input$xcol,input$ycol)]
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         pch = 20, cex = 3)
  })
  
}

shinyApp(ui = ui, server = server)
