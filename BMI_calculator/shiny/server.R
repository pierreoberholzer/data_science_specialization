# Importing package and data

library(shiny)
library(ggplot2)
library(scales)
data <- read.csv("data-text.csv")
country <- as.character(unique(data$Country))
country <- sort(country)

# Data processing

data_mean <- aggregate(Numeric~Country, data = data, FUN = "mean")
data_MF <- aggregate(Numeric~Country+Sex, data = data, FUN = "mean")
data_M <- data_MF[data_MF$Sex == "Male",]
data_F <- data_MF[data_MF$Sex == "Female",]

Country_ord <-factor(data_mean$Country, levels=data_mean[order(data_mean$Numeric), "Country"])

Country_ord_M <-factor(data_M$Country, levels=data_mean[order(data_mean$Numeric), "Country"])
Country_ord_F <-factor(data_F$Country, levels=data_mean[order(data_mean$Numeric), "Country"])

# Functions

BMI_calc <- function(wt,ht) {
  ht <- ht/100 # Conversion from [cm] to [m]
  wt/(ht^2)
}

# Server application

shinyServer(function(input, output) {
      
  output$BMI <- renderPrint({BMI_calc(input$Weight,input$Height)})

  output$Plot <- renderPlot({
    
    ind <- which(levels(Country_ord_M)==country[as.numeric(input$Country)])
    
    if(input$Zoom == "Full range"){range = c(1,185)}
    if(input$Zoom == "Zoom on my country"){range = c(ind-(input$obs/2),ind+(input$obs/2))}
    
    par(oma <- c(2,10,10,2), mar = c(4,8,3,1))
    
    plot(Country_ord,data_mean$Numeric, type = "n", pch = "-", xlim = range, ylab = expression("BMI [" ~ kg/m^{2} ~ "]"))
    lines(Country_ord,data_F$Numeric,col=alpha("blue",1), type = "h", lwd=8)
    points(Country_ord,data_M$Numeric,col=alpha("grey",0.5), type = "h", lwd=8)
    
    # Highlighting my BMI
    
    abline(BMI_calc(input$Weight,input$Height),0, lwd = 2, col = "green")
    #text(x = ind -10, y = (1.1*BMI_calc(input$Weight,input$Height-0.15*ind)),labels = "My BMI", pos = 3)
    #text(x = range[2], y = BMI_calc(input$Weight,input$Height)+0.5, labels = "My BMI", pos = 2, col = "green", bg = "white")
    legend(x = range[2]-0.15*(range[2]-range[1]), y = BMI_calc(input$Weight,input$Height)+0.55, legend = "My BMI", box.col = "green", text.col = "green", border = "green",adj=c(0.18,0.5))
    
    # Highlighting my country
    
    abline(v = ind, lwd = 2, col = "red")
    
    xtext <- ind
    if (ind > 170) {posx = 2; xtext = ind-25}
    if (ind < 50) {posx = 4}
    else {posx = 2}
    
    
    text(pos = posx, x = xtext, y = 31,labels = country[as.numeric(input$Country)], col = "red")
    #mtext(at = (0.08 + (ind/(range[2]-range[1]))),pos = 2, side = 3, x = ind, line = -1.5,outer = TRUE ,text = country[as.numeric(input$Country)], col = "red")
    
    #legend(x = range[2]-30, y= 31.5, legend = c("Male","Female"), fill = c(alpha("grey",0.5),alpha("blue",1)))
    legend("topright", legend = c("Male","Female"), fill = c(alpha("grey",0.5),alpha("blue",1)))
    
  })

})