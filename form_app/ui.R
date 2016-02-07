library(shiny)
library(shinyjs)
library(rethinker)

host <- 'db'
port <- 28015



mandatory_label <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

appCSS <- ".mandatory_star { color: red; }"


name_input <- function(){
  textInput(
          "name",
          h3(mandatory_label("Nombre")),
          "")
}

creator_input <- function(){
  textInput(
    "creator",
    h3("Creado por"))
} 

score_input <- function(){
  sliderInput(
    "score",
    h3("Valoración"),
    0, 100, 50,
    ticks = TRUE)
}   

location_input <- function(){
  selectInput(
    'location',
    h3("Ubicación"),
    c("Cajón derecho del mueble blanco",
      "Mueble ruedas compartimento inferior",
      "Madriguerita de plástico en armario pasillo",
      "Debajo de la mesa",
      "Otro sitio misterioso"))
}

used_level <- function(){
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
                   "Adults" = 'Adults'),
    selected = 0)
}

target_level <- function(){
  checkboxGroupInput(
    "target_level",
    label = h3(mandatory_label('Nivel objetivo')),
    choices = list("Reception" = 'Reception',
                   "Year 1" = 'Year 1',
                   "Year 2" = 'Year 2',
                   "Year 3" = 'Year 3',
                   "Year 4" = 'Year 4',
                   "Year 5" = 'Year 5',
                   "Year 6" = 'Year 6',
                   "Adults" = 'Adults'),
    selected = 1)
}

material <- function(){
  selectInput(
    "material",
    label = h3("Material"),
    choices = list("Juego" = 'Juego',
                   "Canción" = 'Canción',
                   "Texto" = 'Texto',
                   "Otros" = 'Otros'),
    selected = 1)
}

comments <- function(){
  HTML('<textarea id = "comments" rows = "5" cols = "80">...</textarea>')
}

add_record_button <- function(){
  actionButton(
    "add_record",
    label = "Añadir nuevo registro",
    class = "btn-primary")
}

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
        name_input(),
        creator_input(),
        score_input(),
        location_input(),
        used_level(),
        target_level(),
        material(),
        h3('Comentarios'),
        comments(),
        br(),
        add_record_button(),
        br(), br()
      )
    )
  ),
  tabPanel("Search")
))
