library(shiny)
library(shinyjs)

mandatory_label <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

appCSS <- ".mandatory_star { color: red; }"


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
      shinyjs::useShinyjs(),
      shinyjs::inlineCSS(appCSS),
      titlePanel("Nuevo material"),
      div(
        id = "form",
        textInput(
          "name",
          h3(mandatory_label("Nombre")),
          ""),
        textInput(
          "creator",
          h3("Creado por")),
        sliderInput(
          "score",
          h3("Valoración"),
          0, 100, 50,
          ticks = FALSE),
        selectInput(
          "location",
          h3("Ubicación"),
          c("",
            "Cajón derecho del mueble blanco",
            "Mueble ruedas compartimento inferior",
            "Madriguerita de plástico en armario pasillo",
            "Debajo de la mesa",
            "Otro sitio misterioso")),
        checkboxGroupInput(
          "used_level",
          label = h3('Nivel en que los he usado'),
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
        ),
        checkboxGroupInput(
          "target_level",
          label = h3('Nivel target'),
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
        ),
        selectInput(
          "material",
          label = h3("Material"),
          choices = list("Juego" = 'Juego',
                         "Canción" = 'Canción',
                         "Texto" = 'Texto',
                         "Otros" = 'Otros'),
          selected = 1
        ),
        textInput(
          "comments",
          h3("Comentarios")),

        actionButton(
          "submit",
          "Submit",
          class = "btn-primary")
      )
    )
  ),
  tabPanel("Search")
))
