---
title       : Slidify
subtitle    : Developing Data Products.
author      : Akhil Kumar Ramasagaram
job         : CS Student, Gitam University.
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction.

- For this project I have used the "mtcars" dataset which can be found in .
- The main goal of this project was that it predicts the optimal miles per gallon(mpg) using two predictor variables.
- The Predictor variables are 'cyl'(number of Cylinders) and 'hp'(horsepower).
- The user can use any one of the predictor or he can use all the variables in his model.
- The predictions are calculated by simple linear regression model.


--- .class #id 

## Regression model.

```r
model = lm(mpg ~ cyl + hp, data = mtcars)
summary(model)
```

```
## 
## Call:
## lm(formula = mpg ~ cyl + hp, data = mtcars)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -4.495 -2.490 -0.183  1.978  7.293 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  36.9083     2.1908   16.85  < 2e-16 ***
## cyl          -2.2647     0.5759   -3.93  0.00048 ***
## hp           -0.0191     0.0150   -1.27  0.21253    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.17 on 29 degrees of freedom
## Multiple R-squared:  0.741,	Adjusted R-squared:  0.723 
## F-statistic: 41.4 on 2 and 29 DF,  p-value: 3.16e-09
```

--- .class #id 
## Input.
- As we can see from the application running on HTML. There are 2 checkbox's to select the predictor/(s). 

```r
checkboxGroupInput("checkbox", label = h3("Select predictor/(s)"),
                            choices = list("Cylinders" = "cyl", "Horsepower" = "hp")),
```

- Just below that we have two numerical input features where a user can set the values with predetermined incremental values. I have set 4 and 50 for cylinders and horsepower respectively as the default value and the incremental value is derived from the step parameter

```r
numericInput('cr', 'Number of cylinders', 4, min = 4, max = 8, step = 2),
numericInput('hp', 'Gross horsepower', 50, min = 50, max = 350, step = 5),
```

--- .class #id 
## Output.
- The mainPanal() shows the output for out application.

```r
mainPanel(h3("Result"), h4("Predictor/(s) Selected"), verbatimTextOutput("predictors"), 
    h4("MODEL"), verbatimTextOutput("model"), h4("Predicted MPG"), verbatimTextOutput("prediction"))
```



