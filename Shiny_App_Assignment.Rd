library(shiny)
ui <- fluidPage(
  textInput("name", "What's your name?"), 
  textOutput("greeting")
)
server <- function(input, output, session) {
  output$greeting <- renderText({paste0("Top of the morning, ", input$name, "!")})
}
shinyApp(ui, server)