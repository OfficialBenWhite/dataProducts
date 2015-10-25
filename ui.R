library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Fitness Testing to Establish Your Functional Threshold Power (FTP) and Fitness Levels"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("minFTP",
                        "20 minute test average wattage (W)",
                        step = 1,
                        min = 0,
                        max = 600,
                        value = 300),
            numericInput("weight",
                         "Weight (KG)",
                         step = 0.5,
                         min = 0,
                         max = 200,
                         value = 75)
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Summary", 
                                    h4('What is FTP?'),
                                    p('First, let\'s talk about fitness testing. This is a bit of a buzz
                                        word these days with more and more people turning on to getting feedback 
                                        on their training effort with a heart rate monitor and/or watt meter 
                                        and tailoring training programs to their own unique fitness levels.
                                        With a fit test, we\'re trying to establish a wattage number that 
                                       corresponds to our lactate threshold and gives us a functional threshold power number. 
                                       Think of lactate threshold as the point at which your body can no longer run on just oxygen alone and you start to dig into your glycogen reserves. Lactic acid begins accumulating in your blood stream faster than it can be flushed out and you\'re beginning to go anaerobic.'), 
                                    h4('Establishing FTP'),
                                    p('If for instance you\'ve ridden your time trial effort and after 20 minutes your average wattage measured with your Kinetic Power Computer was 245 watts, 
                                        you\'ll multiply that by .95 to get your FTP. \n(245 x .95 = 233 watts)'),
                                    h4('Calculating Training Zones'),
                                    p('To determine each of the 7 levels, you need to take a percentage of the FTP number you determine.'),

                         tags$ol(
                             tags$li("Level 1 Active Recovery = < 55% of LT"),
                             tags$li("Level 2 Endurance = 56-75% of LT"),
                            tags$li("Level 3 Tempo = 76-90% of LT"),
                             tags$li("Level 4 Lactate Threshold = 91-105% of LT"),
                            tags$li("Level 5 VO2 Max = 106-120% of LT"),
                             tags$li("Level 6 Anaerobic Capacity = 121-150% of LT"),
                            tags$li("Level 7 Neuromuscular Power = maximum effort")
                         )
                                        ),
                tabPanel("How To Use", p("Enter in your 20 minute threshold test results on the left. Then
                                         switch to the output tab to see your resulting training levels and power to weight ratio.")),
                tabPanel("Results", 
                         h4('Your FTP'),
                         verbatimTextOutput("FTP"),
                         h4('Your Watts per KG'),
                         verbatimTextOutput("WpKG"),
                         h4('Levels'),
                         tableOutput("view"))
            )
            
        )
    )
))