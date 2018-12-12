library(shiny)
library(xtable)
source("functions.R")

ui <- fluidPage(
  
  headerPanel("Experience Budget"),
  
  sidebarPanel(
    numericInput("num_characters", "Number of Characters", 4, min = 1, step = 1),
    numericInput("party_level", "Party Level", 1, min = 1, max = 20, step = 1)
  ),
  
  mainPanel(
    tableOutput("budget_table"),
    tableOutput("threshold_table")
  )
)

server <- function(input, output) {
  xp_thresholds <- read.csv("xp_thresholds.csv")
  xp_thresholds_table <- xtable(xp_thresholds, label = "XP Thresholds By Level")
  output$threshold_table <- renderTable(
    xp_thresholds_table,
    striped = TRUE,
    bordered = TRUE
  )
  
  
  easy_budget <- reactiveVal()
  easy_column <- reactiveVal() #c(xp_thresholds[input$party_level] * input$num_characters) )
  medium_column <- reactiveVal()
  hard_column <- reactiveVal()
  deadly_column <- reactiveVal()
  
  
  output$budget_table <- renderTable(
    data.frame(
      number_of_monsters = c(
        "1",
        "2",
        "3-6",
        "7-10",
        "11-14",
        "15+"
      ),
      easy = c(
        xp_thresholds$easy[input$party_level] * input$num_characters / get_encounter_multiplier(1),
        xp_thresholds$easy[input$party_level] * input$num_characters / get_encounter_multiplier(2),
        xp_thresholds$easy[input$party_level] * input$num_characters / get_encounter_multiplier(3),
        xp_thresholds$easy[input$party_level] * input$num_characters / get_encounter_multiplier(7),
        xp_thresholds$easy[input$party_level] * input$num_characters / get_encounter_multiplier(11),
        xp_thresholds$easy[input$party_level] * input$num_characters / get_encounter_multiplier(15)
      ),
      medium = c(
        xp_thresholds$medium[input$party_level] * input$num_characters / get_encounter_multiplier(1),
        xp_thresholds$medium[input$party_level] * input$num_characters / get_encounter_multiplier(2),
        xp_thresholds$medium[input$party_level] * input$num_characters / get_encounter_multiplier(3),
        xp_thresholds$medium[input$party_level] * input$num_characters / get_encounter_multiplier(7),
        xp_thresholds$medium[input$party_level] * input$num_characters / get_encounter_multiplier(11),
        xp_thresholds$medium[input$party_level] * input$num_characters / get_encounter_multiplier(15)
      ),
      hard = c(
        xp_thresholds$hard[input$party_level] * input$num_characters / get_encounter_multiplier(1),
        xp_thresholds$hard[input$party_level] * input$num_characters / get_encounter_multiplier(2),
        xp_thresholds$hard[input$party_level] * input$num_characters / get_encounter_multiplier(3),
        xp_thresholds$hard[input$party_level] * input$num_characters / get_encounter_multiplier(7),
        xp_thresholds$hard[input$party_level] * input$num_characters / get_encounter_multiplier(11),
        xp_thresholds$hard[input$party_level] * input$num_characters / get_encounter_multiplier(15)
      ),
      deadly = c(
        xp_thresholds$deadly[input$party_level] * input$num_characters / get_encounter_multiplier(1),
        xp_thresholds$deadly[input$party_level] * input$num_characters / get_encounter_multiplier(2),
        xp_thresholds$deadly[input$party_level] * input$num_characters / get_encounter_multiplier(3),
        xp_thresholds$deadly[input$party_level] * input$num_characters / get_encounter_multiplier(7),
        xp_thresholds$deadly[input$party_level] * input$num_characters / get_encounter_multiplier(11),
        xp_thresholds$deadly[input$party_level] * input$num_characters / get_encounter_multiplier(15)
      )
    ),
    striped = TRUE,
    bordered = TRUE
  )
}

shinyApp(ui, server)