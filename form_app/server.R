library(shiny)
library(rjson)
library(shinyjs)

mandatory_fields <- c("name", "level")

shinyServer(function(input, output){
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

#  new_json_record <- toJSON(new_df_record)
  })
})
