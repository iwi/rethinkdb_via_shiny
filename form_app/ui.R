library(shiny)

shinyUI(fluidPage(
  titlePanel("Input material information"),
  fluidRow(
      column(4, 
        textInput(inputId,
                  label = "name",
                  value = "",
                  width = NULL,
                  placeholder = NULL)
             wellPanel(
      actionButton("submit", "submit")
    )),
  column(8, wellPanel(
    verbatimTextOutput("inputText")
    ))
  )
))

