library(shiny)

shinyServer(function(input, output) {
  
  fit <- reactive({
    dep <- as.numeric(input$dep)
    ind <- as.numeric(input$ind)
    lm(swiss[[dep]]~swiss[[ind]])
  })
  
  reg <- reactive({
    round(fit()$coefficients,4)
    })
  
  R2 <- reactive({
    round(summary(fit())$r.squared,4)
  })
  
  output$plot <- renderPlot({
    dep <- as.numeric(input$dep)
    ind <- as.numeric(input$ind)
    plot(swiss[[ind]], swiss[[dep]], col="blue", pch=16,
         xlab=names(swiss)[ind], ylab=names(swiss)[dep])
    grid()
    if(input$regress==1){
      abline(fit(), col="red")
    }
  })
  
  output$text1 <- renderText({
    if(input$ind==input$dep){
      "The dependent and independent variables should be different!"
    }
  })
  
  output$text2 <- renderUI({
    if(input$regress==1)
      HTML(paste("Linear regression coefficients: ",
                  paste("Intercept =", reg()[1], ", Slope =", reg()[2]),
                  paste("R-squared =", R2()), 
                 sep="<br/>"))
  })

})
