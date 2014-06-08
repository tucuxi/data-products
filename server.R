library(shiny)
library(ggplot2)
data(mtcars)

lm <- lm(mpg ~ wt + factor(cyl), data = mtcars)
fig <- ggplot(mtcars, aes(wt, mpg)) + geom_point() + facet_wrap(~ cyl) +
  xlab("Weight (1000 lbs)") + ylab("MPG")

shinyServer(  
  function(input, output) {
    output$mpg <- renderText({
      predict(lm, data.frame(cyl = input$cyl, wt = input$wt / 1000))
    })
    output$fig <- renderPlot(print(fig))
  }
)