---
title       : BMI Calculator
subtitle    : A brief introduction
author      : P. Oberholzer
job         : Data Scientist
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
---

## Index


This brief presentation aims at introducing the shiny application "BMI Calculator" developped for the purpose of the project in class "Data Products" from the Coursera hosted lecture "Specialization in Data Science" from the John Hopkins University.  

The following points are discussed in the next slides:

* Motivation
* Description
* Code

N.B. This work represents a proof-of-concept project realized in a short time frame and does not intend to deliver a perfect stable and robust application. Further quality checks and improvements would be needed to obtain a final product. 

Link to the application "BMI Calculator": [BMI Calculator](http://obepi.shinyapps.io/BMI_Calculator/)

--- .class #id 

## Motivation

The Body Mass Index (BMI) is a index of the relative weight based on an individual's mass and height. It is often used to quantify overweight and obesity tendancies, which is nowadays a crucial issue in most industrial countries of the world. It is calculated as follows:

$$BMI = \frac {mass} {height}^2 \:\:\:  \big[  \frac{\textrm{kg}} {\textrm{m}^2}  \big]$$

It can therefore be interesting to compute our own value and to compare it to the mean value of other countries for instance. A data set is made available from the World Health Organisation (WHO) that contains mean values and deviations for 20+ adults, male and female, for 189 countries.

### Source

[Wikipedia](http://en.wikipedia.org/wiki/Body_mass_index)  
[WHO]("http://apps.who.int/gho/data/view.main.2461?lang=fr")

--- .class #id 

## Description

The functionality of the application is simple. The main effort deployed in that work was in the data processing and the rendering.

Based on the weight and height, the BMI index is computed. Also, a graph reports the mean values obtained from the WHO data set. On the same graph, the BMI value of the user as well as its country are reported as benchmark. On the side panel, the user also has the option of zooming on the country considered. For that, the option "Zoom on my country" must be activated and the precision is fixed with the slidebar.

| Input | Output |
| ---- | ----- |
| Weight [kg]  | Calculated BMI |
| Height [cm] | Plot of BMI per country and sex |
| Country |
| Zoom options |

--- .class #id 

## Code

The full code of the application can be found on the Github repository. Herebelow, we just report the calculation of the BMI as code chunk. The example corresponds to the default value.


```r
BMI_calc <- function(wt,ht) {
  ht <- ht/100 # Conversion from [cm] to [m]
  wt/(ht^2)}

wt <- 70    # Is taken from input$Weight in shiny
ht <- 185   # Is taken from input$Height in shiny

BMI_calc(wt,ht)
```

```
## [1] 20.45
```

### Source

[Code on Github](https://github.com/Obepi/Data_Products.git)

