library(shiny)
library(xtable)
source("functions.R")

ui <- fluidPage(
  
  headerPanel("Experience Budget"),
  
  sidebarPanel(
    numericInput("num_characters", "Number of Characters", 4, step = 1),
    numericInput("party_level", "Party Level", 1, step = 1)
  ),
  
  mainPanel(
    tableOutput("budget_table")
  )
)

server <- function(input, output) {
  xp_thresholds <- read.csv("xp_thresholds.csv")
  xp_thresholds_table <- xtable(xp_thresholds, label = "XP Thresholds By Level")
  output$budget_table <- renderTable(
    xp_thresholds_table,
    striped = TRUE,
    bordered = TRUE
  )
}

shinyApp(ui, server)