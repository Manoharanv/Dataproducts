# server.R
library(datasets)
library(shiny)
state<<-data.frame(state.x77)

shinyServer(
function(input, output) {

output$text1 <- renderTable({
state[which(rownames(state)==input$var),]
})

output$text2 <- renderTable({
   summary(state[input$var1])
 })

#make dynamic slider
    output$slider <-renderUI({

    sliderInput("inSlider", "Slider", min=input$min_val,        max=input$max_val, value=0)

  })

  output$values <- renderTable({
    state[which((state[,input$var1]>=input$min_val) & 
                (state[,input$var1]<=input$max_val)),]
  })
 })
