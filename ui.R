shinyUI(
  pageWithSidebar(
    headerPanel("Miles Per Gallon Predictor"),
    sidebarPanel(
      p(paste("Enter the number of cylinders and the weight of the car",
              "to compute a prediction of the car's MPG consumption.")),
      radioButtons("cyl", "Cylinders", c("4", "6", "8")),
      sliderInput("wt", "Weight (lbs)", 1500, 5000, 1500, step = 100)
    ),
    mainPanel(
      h3("Observations and Linear Model"),
      p(paste("The figure shows a linear model built from observations of",
              "1973-1974 cars. The blue cross highlights the predicted",
              "MPG value corresponding to the number of cylinders",
              "and weight you specifed on the left. Additionally, the",
              "MPG value is displayed below the figure.")),
      plotOutput("fig"),
      h3("Predicted MPG"),
      textOutput("mpg")
    )
  )
)