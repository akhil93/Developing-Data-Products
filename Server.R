library(shiny)
library(datasets)

shinyServer(function(input, output) {
  Text <- reactive({
    x<-length(input$checkbox)
    if (x==0)
      {"Select a predictor"}
    else if(x==1)
      {paste(input$checkbox[1])}
    else if(x==2)
      {paste(input$checkbox[1],"+",input$checkbox[2])}
  })
  
  modelText <- reactive(paste("mpg ~", Text()))
  output$predictors <-renderText({Text()})
  output$model <- renderText({
    if (length(input$checkbox)==0)
      {"Select a predictor"}
    else{modelText()}
  })
  
  output$prediction <- renderText({
    if (length(input$checkbox)==0)
      {"Select a predictor"}
    else{
      fit<-lm(as.formula(modelText()),data=mtcars)
      c<-input$cyl
      h<-input$hp
      df<-data.frame(cyl=c,hp=h)
      predict(fit,df) }
  })
})