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

e_location_input <- function(){
  textInput(
    'e_location',
    h3("Ubicación electrònica"))
}

used_level_input <- function(){
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

target_level_input <- function(){
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

material_input <- function(){
  selectInput(
    "material",
    label = h3("Material"),
    choices = list("Juego" = 'Juego',
                   "Canción" = 'Canción',
                   "Texto" = 'Texto',
                   "Otros" = 'Otros'),
    selected = 1)
}

comments_input <- function(){
  HTML(paste(
    '<h3>Comentarios</h3>',
    '<textarea id = "comments" rows = "5" cols = "80">...</textarea>'),
    '<br>',
    '<br>',
    sep = '')
}

add_record_button <- function(){
  actionButton(
    "add_record",
    label = "Añadir nuevo registro",
    class = "btn-primary")
}

search_name_input <- function(){
  textInput(
    'search_name',
    h3('Búsqueda por nombre del material'))
}

search_name_button <- function(){
  actionButton(
    "name_search",
    label = "Buscar",
    class = "btn-secondary")
}



## Main

shinyUI(navbarPage(
  title = "Tatiana's teaching materials",
  tabPanel("Buscar",
    fluidPage(
      titlePanel('Buscar'),
      sidebarLayout(
        sidebarPanel(
          div(
            id = 'name_search_form',
            search_name_input(),
            search_name_button()
          )
        ),
        mainPanel(
          div(
            id = 'outcome',
            h3(textOutput('found_name'))
          )
        )
      )
    )
  ),
   tabPanel('Input new material',
    fluidPage(
      shinyjs::useShinyjs(),
      shinyjs::inlineCSS(appCSS),
      titlePanel("Nuevo material"),
      div(
        id = "input_form",
        name_input(),
        creator_input(),
        score_input(),
        location_input(),
        e_location_input(),
        used_level_input(),
        target_level_input(),
        material_input(),
        comments_input(),
        add_record_button(),
        br(), br()
      )
    )
  ),
 tabPanel(
    "Summary",
    h1('What a nice title'),
    p('something and something'),
    img(src = "nens.jpg",
        height = 400,
        width = 300)
  )
))
