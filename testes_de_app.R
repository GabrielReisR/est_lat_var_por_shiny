#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
source("funcoes.R", encoding = 'UTF-8')
source("texto.R", encoding = 'UTF-8')


ui <- fluidPage(
  navbarPage(
    title = 'Estimando Variáveis Latentes',
    tabPanel(
      'Análise Exploratória com Grafos',
      tabsetPanel(tabPanel('Explore a AEG',
                           fluidRow(
                             sidebarPanel(
                               wellPanel(
                                 h4('Estimação do Modelo'),
                                 selectInput("model",
                                             "Estimação do modelo",
                                             c('glasso', 'TMFG'),
                                             'glasso'),
                                 
                                 selectInput('algorithm',
                                             'Algoritmo',
                                             c('walktrap', 'louvain'),
                                             'walktrap'),
                                 conditionalPanel("input.model == 'glasso'",
                                                  h5(strong(
                                                    'Você escolheu glasso'
                                                  )),
                                                  h6(strong(
                                                    'glasso é um algoritmo...'
                                                  ))),
                                 
                                 conditionalPanel("input.model == 'TMFG'",
                                                  h5(strong('Você escolheu TMFG')),
                                                  h6(strong(
                                                    'TMFG é um algoritmo...'
                                                  )))
                               )
                             ),
                             mainPanel(plotOutput('graph'))
                           )),
                  tabPanel('O que é a AEG?',
                           mainPanel(texto_ega)))),
                  
    tabPanel('Análise Fatorial Exploratória',
             tabsetPanel(
               
               # Painel 1 - Figura
               tabPanel(
               'Explore a AFE',
               fluidRow(
                 sidebarPanel(
                   wellPanel(
                     h4('Estimação da EFA'),
                     selectInput("model",
                                 "Estimação do modelo",
                                 c('isso', 'aquilo'),
                                 'glasso'),
                     
                     selectInput('algorithm',
                                 'Algoritmo',
                                 c('walktrap', 'louvain'),
                                 'walktrap'),
                     conditionalPanel("input.model == 'isso'",
                                      h5(strong('Você escolheu isso')),
                                      h6(strong(
                                        'isso é um algoritmo...'
                                      ))),
                     
                     conditionalPanel("input.model == 'aquilo'",
                                      h5(strong(
                                        'Você escolheu aquilo'
                                      )),
                                      h6(strong(
                                        'aquilo é um algoritmo...'
                                      )))
                   )
                 ),
                 mainPanel(
                   plotOutput('efa'))
               )),
               
               # Painel 2 - Texto
               tabPanel('O que é a AFE?',
                        mainPanel('textotextotexto'))

             )))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  # EFA ====
  output$efa <- renderPlot({
    efa_plot()
  })
  
  
  # EGA ====
  output$graph <- renderPlot({
    ega_plot(modelo = input$model,
             algoritmo = input$algorithm)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)