library(shiny)

shinyUI(navbarPage(
  title = "Tatiana's teaching materials",
  tabPanel(
    "Summary",
    h1('What a nice title'),
    p('something and something'),
    img(src = "nens.jpg",
        height = 400,
        width = 300)
  ),
  tabPanel('Input new material',
    fluidPage(
#      titlePanel(strong('Input nuevo material')),
      sidebarLayout(
        sidebarPanel(
          textInput(
            'nombre',
            label = h3('Nombre del material'), 
            value = '...'
          ),
          checkboxGroupInput(
            "nivel",
            label = h3('Nivel'), 
            choices = list("Reception" = 'Reception', 
                           "Year 1" = 'Year 1', 
                           "Year 2" = 'Year 2',
                           "Year 3" = 'Year 3',
                           "Year 4" = 'Year 4',
                           "Year 5" = 'Year 5',
                           "Year 6" = 'Year 6',
                           "Adults" = 'Adults'
                           ),
            selected = 1
          )
#          selectInput(
#            "material",
#            label = h3("Material"), 
#            choices = list("Juego" = 'Juego',
#                           "Canción" = 'Canción',
#                           "Texto" = 'Texto',
#                           "Otros" = 'Otros'), 
#            selected = 1
#          )
        ),
        mainPanel(
          h3('Material a añadir'),
          textOutput('nombre'),
          br(),
          textOutput('nivel'),
          br(),
          textOutput('material'),
          br(),
          submitButton("Añadir"),
          br(),
          downloadButton("Guardar")
        )
      )
    )
  ),
  tabPanel("Search")
))
