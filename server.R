library(shiny)

calcFTP <- function(minFTP) minFTP * 0.95

calcWpKG <- function(minFTP, weight) (minFTP * 0.95 / weight)

createTable <- function(minFTP) {
    ftp <- minFTP * 0.95
    Training.Zone <- c("Level 1 Active Recovery = < 55% of LT",
                       "Level 2 Endurance = 56-75% of LT",
                       "Level 3 Tempo = 76-90% of LT",
                       "Level 4 Lactate Threshold = 91-105% of LT",
                       "Level 5 VO2 Max = 106-120% of LT",
                       "Level 6 Anaerobic Capacity = 121-150% of LT",
                       "Level 7 Neuromuscular Power = maximum effort")
    Lower.Wattage <- c(0,
                       0.56*ftp,
                       0.76*ftp,
                       0.91*ftp,
                       1.06*ftp,
                       1.21*ftp,
                       1.51*ftp
                       )
    Upper.Wattage <- c(0.55*ftp,
                       0.75*ftp,
                       0.90*ftp,
                       1.05*ftp,
                       1.20*ftp,
                       1.5*ftp,
                       9999
                       )
    df = data.frame(Training.Zone, Lower.Wattage, Upper.Wattage)
    df
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Expression that generates a histogram. The expression is
    # wrapped in a call to renderPlot to indicate that:
    #
    #  1) It is "reactive" and therefore should re-execute automatically
    #     when inputs change

    output$FTP <- renderPrint({calcFTP(input$minFTP)})
    output$WpKG <- renderPrint({calcWpKG(input$minFTP, input$weight)})
    output$view <- renderTable({
                                createTable(input$minFTP)
                                })
})
    