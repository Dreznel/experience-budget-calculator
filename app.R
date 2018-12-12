ui<- pageWithSidebar(
  headerPanel("Experience Budget"),
  sidebarPanel(),
  mainPanel()
)

server <- function(input, output) {
  
}

shinyApp(ui, server)