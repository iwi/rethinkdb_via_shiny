library(shiny)
library(rjson)
library(shinyjs)
library(rethinker)

# external stuff
# declare mandatory fields
mandatory_fields <- c("name", "level")

# declare save fields
save_fields <- c("name",
                 "score",
                 "material",
                 "level"
                )

responses_directory <- file.path("responses")

epoch_time <- function() {
    as.integer(Sys.time())
}

host <- 'db'
port <- 28015

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
    shinyjs::toggleState(id = "submit",
                         condition = mandatoryFilled)
  })

  # format data to save
#  form_data <- reactive({
#    data <- sapply(save_fields, 
#                   function(x) input[[x]]
#                  )
#    data <- c(data, timestamp = epoch_time())
#    data <- t(data)
#    data <- toJSON(data)
#    data
#  })
  
  # Save the data
  save_data <- function(data) {
    # connect to db
    conn <- openConnection(host, port)
    # insert record to someDb's someTable
    r()$db("test")$table("materials")$insert(
       list(
         nombre = input$name,
         creador = input$creator,
         score = input$score,
         ubicacion = input$location,
         nivel = input$level,
         material = input$material
       ),
       conflict = "update",
       return_changes = TRUE
    )$run(conn) 
  }

  # action to take when submit button is pressed
  observeEvent(input$submit, {
               save_data(form_data())
                        })  
})

