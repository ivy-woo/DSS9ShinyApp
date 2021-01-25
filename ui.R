library(shiny)

shinyUI(fluidPage(
  
  tags$style("#text1 {font-size:17px; color:red; }"),
  tags$style("#text2 {font-size:18px; }"),
  
  titlePanel("Plotting the 'swiss' dataset"),
  
  sidebarLayout(
    sidebarPanel(
      
      h5("This is a simple app which generates a scatter plot on data from 
         the 'swiss' dataset in R."),
      h5("Select a variable as the independent variable and another one as 
         the dependent variable below, 
         the plot of the two variables will be displayed.
         A linear regression can be fitted, the regression curve will be added
         to the plot, the regression coefficients together with the R-squared
         value will be provided."),
      h5("See the footnote for an explanation of the variable names."),
      
      selectInput("ind",
                  h3("Choose the independent variable:"),
                  choices=list("Fertility"=1, "Agriculture"=2,
                               "Examination"=3, "Education"=4,
                               "Catholic"=5,"Infant Mortality"=6), selected=2),
      
      selectInput("dep",
                  h3("Choose the dependent variable:"),
                  choices=list("Fertility"=1, "Agriculture"=2,
                               "Examination"=3, "Education"=4,
                               "Catholic"=5,"Infant Mortality"=6), selected=1),
      
      radioButtons("regress", h3("Want to fit a linear regression?"),
                   choices=list("Yes"=1, "No"=2), selected=2),
      
      hr(),
      helpText("Fertilty: common standardized fertility measure."),
      helpText("Agriculture: % of males involved in agriculture as occupation."),
      helpText("Examination: % draftees receiving highest mark on army examination."),
      helpText("Education: % education beyond primary school for draftees."),
      helpText("Catholic:	% 'catholic' (as opposed to 'protestant')."),
      helpText("Infant Mortality:	live births who live less than 1 year.")
      
    ),
    
    mainPanel(
      plotOutput("plot"), 
      textOutput("text1"),
      htmlOutput("text2"),
    )
  )
))
