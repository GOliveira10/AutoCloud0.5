library(shiny)

shinyServer(function(input, output, session) {
        
        terms <- reactive({
                # Change when the update button is pressed
                
                input$update
                isolate({
                        withProgress({
                                setProgress(message = "Processing corpus...")
                                makeCloud(input$selection)
                        })
                })
        })
        
        # Make the same wordcloud each time given the same parameters
        wordcloud_rep <- repeatable(wordcloud)
        
        output$cloud <- renderPlot({
                v <- terms()
                wordcloud_rep(names(v), v, scale=c(4,0.5),
                              min.freq = input$freq, max.words=input$max,
                              colors=brewer.pal(5, "Paired"))
        })
})