ui <- fluidPage(
  headerPanel("Experience Budget"),
  sidebarPanel(
    numericInput("num_characters", "Number of Characters", 4, step = 1),
    numericInput("party_level", "Party Level", 1, step = 1)
  ),
  mainPanel()
)

server <- function(input, output) {
  
}

shinyApp(ui, server)