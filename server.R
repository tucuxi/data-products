library(shiny)
library(ggplot2)
data(mtcars)

lm <- lm(mpg ~ wt + factor(cyl), data = mtcars)
grid <- with(mtcars, expand.grid(
  wt = seq(min(wt), max(wt), length = 20),
  cyl = cyl))
grid$mpg <- predict(lm, grid)
fig <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + geom_line(data = grid, color = "blue") +
  facet_wrap(~ cyl) + xlab("Weight (1000 lbs)") + ylab("MPG") 

shinyServer(  
  function(input, output) {
    output$mpg <- renderText({
      predict(lm, data.frame(cyl = input$cyl, wt = input$wt / 1000))
    })
    output$fig <- renderPlot(print(fig))
  }
)