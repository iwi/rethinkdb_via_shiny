library(shiny)
library(rjson)

shinyServer(function(input, output){
  output$nombre <- renderText({paste('Nombre:', input$nombre)})
  output$nivel <- renderText({input$nivel})
  output$material <- renderText({input$material})
  
#  new_df_record <- df(
#    'nombre' = output$nombre,
#    'nivel' = output$nivel,
#    'material' = output$material
#  )
#  new_json_record <- toJSON(new_df_record) 
#  output$downloadData <- downloadHandler(
#    filename = function() {
#      paste('new.json')
#    },
#    
#    # This function should write data to a file given to
#    # it by the argument 'filename'.
#    content = function(file) {
#      # Write to a file specified by the 'file' argument
#      print(file)
#      writeLines(
#        new_json_record,
#        file
#      )
#    }
#  )
})
