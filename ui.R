shinyUI(
        fluidPage(theme = "bootstrap.css",
               
                titlePanel("Word Cloud"),
                tags$style(type="text/css",
                           ".shiny-output-error { visibility: hidden; }",
                           ".shiny-output-error:before { visibility: hidden; }"
                ),
                
                sidebarLayout(
                        sidebarPanel(position="right",
                                #######
                                
                                fileInput("selection", "Choose a text:"),
                                h6("To begin, select any .txt file from your computer and hit the Update button"),
                                
                                
                                actionButton("update", "Update"),
                                hr(),
                                sliderInput("freq",
                                            "Minimum Frequency:",
                                            min = 1,  max = 50, value = 15),
                                sliderInput("max",
                                            "Maximum Number of Words:",
                                            min = 1,  max = 300,  value = 100),
                                em("Grant Oliveira, 2015", align="right")
                        ),
                        
                        # Show Word Cloud
                        mainPanel(
                                plotOutput("cloud")
                        )
                )
        )
)