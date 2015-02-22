#### Data Products Project server.R ####
## EBushong

library(shiny)
library(ElemStatLearn)
library(gam)
library(caret)
library(RcppEigen)
data(ozone)

#### Training GAM Prediction Model using Caret ####
ctrl <- trainControl(method = "cv")
grid <- data.frame("df" = 1:6)
set.seed(100)
ozone_GAM <- train(ozone ~ ., 
                   method = "gamSpline", 
                   preProcess = c("center", "scale"), 
                   data = ozone, 
                   trControl = ctrl, 
                   tuneGrid = grid)

#### Shiny Server Function ####
shinyServer(
    function(input, output){
        output$radValue <- renderPrint({input$rad})
        output$tempValue <- renderPrint({input$temp})
        output$windValue <- renderPrint({input$wind})
        x <- reactive({data.frame("radiation" = input$rad, "temperature" = input$temp, "wind" = input$wind)})
        output$prediction <- renderPrint({round(predict(ozone_GAM, newdata = x()))})
    }
)