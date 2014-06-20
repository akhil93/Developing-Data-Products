library(shiny)
shinyUI(
  pageWithSidebar(
    
    headerPanel("Developing Data Products"),
    sidebarPanel(
      h4('This is a simple application which uses the mtcars data set from R and it takes 2 variables which is "hp" and "cyl" which stands for horsepower and number of cylinders. Using these two variables we try to predict the mileage of that vehicle.'),
      hr(),
      h4('Follow the below 3 steps'),                      #
      h5('1. Select predictor/(s)'),                      #This Matter which will be displayed on
      h5('2. Choose values for the predictors'),          #the sidebar
      h5('3. Submit'), 
      hr(),
         
      checkboxGroupInput("checkbox", label = h3("Select predictor/(s)"),              #middle part of sidebar
                            choices = list("Cylinders" = "cyl", "Horsepower" = "hp")),   #checkboxes for predictors
      hr(),
      h3('Select Values'),                                                       #the bottom portion of the sidebar
      numericInput('cr', 'Number of cylinders', 4, min = 4, max = 8, step = 2),  #lets the user to select different values for
      numericInput('hp', 'Gross horsepower', 50, min = 50, max = 350, step = 5), #number of cylinder and horsepower
      hr(),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Result'),
      h4('Predictors which were Selected'),                                     #
      verbatimTextOutput("predictors"),                                         #
      h4('MODEL'),                                                              #Result Page
      verbatimTextOutput("model"),                                              # 
      h4('Predicted MPG'),                                                      #
      verbatimTextOutput("prediction")                                          #
    )
  )
)