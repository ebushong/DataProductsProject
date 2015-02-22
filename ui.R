#### Data Products Project ui.R ####
## EBushong

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Ozone Level Predictor"),
    sidebarPanel(
        sliderInput("rad", 
                    "Solar Radiation (langleys)", 
                    value = 185, 
                    min = 5, 
                    max = 350, 
                    step = 5),
        sliderInput("temp", 
                    "Temperature (degrees F)", 
                    value = 78,
                    min = 55,
                    max = 100,
                    step = 1),
        sliderInput("wind", 
                    "Wind Speed (mph)",
                    value = 10,
                    min = 1,
                    max = 25,
                    step = 0.5)
        ),
    mainPanel(
        h3("Documentation"),
        p("This app will predict the ozone level in New York City based on the 
          values for three variables that are provided by the user. These variables 
          are Solar Radiation, Temperature, and Wind Speed.  Use the sliders in the 
          side panel to set values for these variables.  A machine learning algorithm 
          will then be used to predict the ozone level, which will be provded below."),
        br(),
        h4("Input Data"),
        h5("Solar Radiation:"),
        verbatimTextOutput("radValue"),
        h5("Temperature:"),
        verbatimTextOutput("tempValue"),
        h5("Wind Speed:"),
        verbatimTextOutput("windValue"),
        br(),
        h4("The predicted ozone level (in ppb) is:", style = "color:red"),
        verbatimTextOutput("prediction")
    )
))
