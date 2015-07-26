# ui.R
# 'This application generates a data frame states from data 
# 'state.x77' from datasets library.
# 'The facts and figures of a state in United States can be seen # 'by individually 
# ' selecting a state value from the input box.Further filtering
# 'of various columns can be made by selecting through the second 
# 'input box. The summary value of the column selected is
# 'displayed in the main panel.Taking the minimum and maximum #'valuses displayed in summary,two more numeric inputs are taken #'for the range of value in the selected column to be considered #'for display. A slider is also provided. Based on the minimum #'and maximum numeric inputs entered, the minimum and maximum #'value of slider is automatically reset.For getting the desired #'range of data , only the numeric input needs to be changed. #'(Moving the slider does not change the range of valus in 
#'the out put.) 
#
library(datasets)
library(shiny)
state<<-data.frame(state.x77)

shinyUI(fluidPage(
titlePanel("US States"),
sidebarLayout(
sidebarPanel(
helpText("Display Facts and figures of the selected state in US."),
selectInput("var",
label = "Choose a State to display Facts and Figures",
choices = c(rownames(state)),
selected = 1)
,
selectInput("var1",
label = "Choose a column for summary display ",
choices = c(colnames(state)),
selected = 1)
,

numericInput("min_val", "Enter Minimum Range of column selected for view ", 0),
numericInput("max_val", "Enter Maximum Range of column selected for view ", 10000),

uiOutput("slider")

),
mainPanel(
tableOutput("text1")
,
tableOutput("text2")
,
tableOutput("values")
)
)
))