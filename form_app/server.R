library(shiny)
library(rjson)
library(shinyjs)
library(rethinker)

# external stuff
# declare mandatory fields
mandatory_fields <- c("name", "target_level", "material")

responses_directory <- file.path("responses")

epoch_time <- function() {
    as.integer(Sys.time())
}

host <- 'db'
port <- 28015
database <- 'test'
table <- 'materials'

shinyServer(function(input, output){
  # activate/deactivate Submit button iff mandatory fields are filled
  observe({
    mandatoryFilled <- vapply(
      mandatory_fields,
      function(x) {
        !is.null(input[[x]]) && input[[x]] != ""
      },
      logical(1)
    )
    mandatoryFilled <- all(mandatoryFilled)
    shinyjs::toggleState(id = "add_record",
                         condition = mandatoryFilled)
  })

  # Save the data
  save_data <- function(data) {
    # connect to db
    conn <- openConnection(host, port)
    # insert record to someDb's someTable
    r()$db('test')$table('materials')$insert(
       list(
         nombre = input$name,
         creador = input$creator,
         score = input$score,
         ubicacion = input$location,
         ubicacion_electronica = input$e_location,
         material = input$material,
         nivel_usado = input$used_level,
         nivel_target = input$target_level,
         comentarios = input$comments),
       conflict = "update",
       return_changes = FALSE 
    )$run(conn) 
  }

  # action to take when submit button is pressed
  observeEvent(input$add_record, {
               save_data(form_data())
  })  
})

