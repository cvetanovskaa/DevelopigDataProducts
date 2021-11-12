library(shiny)

shinyUI(fluidPage(
    titlePanel("The Chatterjee–Price Attitude Data"),
    p('From a survey of the clerical employees of a large financial organization,
      the data are aggregated from the questionnaires of the approximately 35 
      employees for each of 30 (randomly selected) departments. The numbers give 
      the percent proportion of favourable responses to seven questions in each
      department.'),
    p('Data & description from https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/attitude.html'),
    
    sidebarLayout(
        sidebarPanel(
            # Add a slider input so that the user can choose the amount of 
            # department responses to be included in the plots 
            sliderInput("department_number",
                        "Number of departments:",
                        min = 1,
                        max = 30,
                        value = 1),
            
            # Add a dropdown input so that the user can which parameters
            # they'd like to see in an individual plot
            selectInput(
                "param", 
                "Choose a parameter you want to explore more in depth:",
                list('--', 'Rating', 'Complaints', 'Privileges', 'Learning', 'Raises', 'Critical', 'Advance')
            )
        ),

        mainPanel(
            plotOutput("pairsPlot"),
            plotOutput("paramPlot"),
        )
    )
))
