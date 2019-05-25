ui <- fluidPage(theme = "bootstrap.css",
  # ... rest of the code
  position = "right",
    titlePanel(h1("Flu Anlaytics Report of USA")),
    fluidRow(
      column(6, wellPanel(selectInput("Heatmap", label = "Choose a map",
                            choices = list("CDC" = "cdc","Flu" = "PER", "Influenza" = "OOR", "Cold" = "FLU"),
                            selected = "PER"),
             imageOutput("img1"))), # here is the image
      column(6, wellPanel(selectInput("Heatmap2", label = "Choose a map",
                                      choices = list("CDC" = "cdc","Flu" = "PER", "Influenza" = "OOR", "Cold" = "FLU"),
                                      selected = "cdc"), imageOutput("img2")))),
  fluidRow(
    column(12, wellPanel(h4(textOutput("task4")), textOutput("selected"), h4(textOutput("task5")), textOutput("selected2")))
  )
)

server <- function(input, output){

  
    output$task4 <- renderText({ "Task 4:"})
    output$selected2 <- renderText({ 
      "
      If we look at the Flu heat map and the influenza heat map , 
      we see that the states with the highest number of tweets for flu
      is the same as the stated with the number of tweets for influenza.
      Although the some states have no tweets available for flu and 
      some states have no tweets for influenza. However, both the 
      heatmaps look somewhat similar."
    })

    output$selected <- renderText({ 
      "If we look at the Flu heat map and the CDC heat map, we see a 
      stark contrast between the two in terms of counts. The states 
      with highest level of flu as reported by CDC has a comparatively
      low count of tweets related to it and vice-versa.However, Texas 
      is the only state exempt from this phenomenon with its activity 
      level and tweet frequency at par with each other. It can be 
      therefore concluded that the state worst affected with flu has 
      the lesser tendency to tweet about it."
    })

    output$task5 <- renderText({ "Task 5:"})
  output$img1 <- renderImage({
    filename <- normalizePath(file.path("flu_heatmap.png"))
    if(input$Heatmap == "PER"){  
      list(src = normalizePath(file.path("flu_heatmap.png")),
           contentType = 'image/png',
           width = 650,
           height = 400,
           alt = paste("Image number", "1"))
    }                                        
    else if(input$Heatmap == "OOR"){
      list(src = normalizePath(file.path("influenza_heatmap.png")),
           width = 650,
           height = 400,
           alt = paste("Image number", "2"))
    }
    else if(input$Heatmap == "FLU"){
      list(src = normalizePath(file.path("cold_heatmap.png")),
           contentType = 'image/png',
           width = 650,
           height = 400,
           alt = paste("Image number", "3"))
    }
    else if(input$Heatmap == "cdc"){
      list(src = normalizePath(file.path("heatmap.png")),
           contentType = 'image/png',
           width = 650,
           height = 400,
           alt = paste("Image number", "3"))
    }
    else if(input$Heatmap == "cdc"){
      list(src = normalizePath(file.path("heatmap.png")),
           contentType = 'image/png',
           width = 650,
           height = 400,
           alt = paste("Image number", "3"))
    }
  }, deleteFile = FALSE)
  
  output$img2 <- renderImage({
    filename <- normalizePath(file.path("flu_heatmap.png"))
    if(input$Heatmap2 == "PER"){  
      list(src = normalizePath(file.path("flu_heatmap.png")),
           contentType = 'image/png',
           width = 650,
           height = 400,
           alt = paste("Image number", "1"))
    }                                        
    else if(input$Heatmap2 == "OOR"){
      list(src = normalizePath(file.path("influenza_heatmap.png")),
           width = 650,
           height = 400,
           alt = paste("Image number", "2"))
    }
    else if(input$Heatmap2 == "FLU"){
      list(src = normalizePath(file.path("cold_heatmap.png")),
           contentType = 'image/png',
           width = 650,
           height = 400,
           alt = paste("Image number", "3"))
    }
    else if(input$Heatmap2 == "cdc"){
      list(src = normalizePath(file.path("heatmap.png")),
           contentType = 'image/png',
           width = 650,
           height = 400,
           alt = paste("Image number", "3"))
    }
  }, deleteFile = FALSE)
  # ... rest of the code
}

shinyApp(ui, server)