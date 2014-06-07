shinyUI(
  pageWithSidebar(
    headerPanel("Miles Per Gallon Predictor"),
    sidebarPanel(
      h3("Car Specification"),
      radioButtons("cyl", "Cylinders", c("4" = 4, "6" = 6, "8" = 8)),
      sliderInput("wt", "Weight (lbs)", 1500, 5000, 1500, step = 100)
    ),
    mainPanel(
      h3("Observations (1973-1974 Models)"),
      plotOutput("fig"),
      h3("Predicted MPG"),
      textOutput("mpg")
    )
  )
)