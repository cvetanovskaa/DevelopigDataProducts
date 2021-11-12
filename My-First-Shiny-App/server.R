library(shiny)
library(datasets)

shinyServer(function(input, output) {
    dn <- reactive({ input$department_number })
    param_choice <- reactive({ input$param })

    # render a pairs plot that displays relationships between all
    # parameters, using as many rows as the user denotes in their slider
    output$pairsPlot <- renderPlot({
        plot(attitude[1:dn(),])
    })
    
    output$paramPlot <- renderPlot({
        # if the user hasn't chosen a param, we don't display the second plot
        if(!(param_choice() == '--')) {
            # we convert the name to lowercase because the columns in the dataset
            # are in lowercase
            column_name <- tolower(param_choice())
            plot(
                attitude[1:dn(),][[column_name]], 
                ylab=param_choice(), 
                main=paste("Score for ", param_choice(), " accross ", dn(), " departments")
            )
        }
    })

})
