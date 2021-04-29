#  ----------------------------------------
# Nome: Estimando Variáveis Latentes
# Autora: Gabriel dos Reis Rodrigues
# Abril, 2021
# ----------------------------------------

# Initial loading ====
if (!require("EGAnet"))
    install.packages("EGAnet")
if (!require("ggcorrplot"))
    install.packages("ggcorrplot")
if (!require("plotly"))
    install.packages("plotly")
if(!require("psych"))
    install.packages("psych")
if (!require("shiny"))
    install.packages("shiny")
if(!require("shinythemes"))
    install.packages("shinythemes")

library(EGAnet)
library(ggcorrplot)
library(plotly)
library(psych)
library(shiny)
library(shinythemes)

source("funcoes.R", encoding = 'UTF-8')
source("texto.R", encoding = 'UTF-8')

# UI ====

ui <- fluidPage(theme = shinythemes::shinytheme("yeti"),
    navbarPage(
        title = 'Estimando Variáveis Latentes',
        
        #' *AEG*
        tabPanel(
            'Análise Exploratória com Grafos',
            tabsetPanel(
                
                # Painel 1 - Figura ====
                tabPanel('Explore a AEG',
                         fluidRow(
                             
                             # Sidebar
                             sidebarPanel(wellPanel(
                                 h4('Estimação do Modelo'),
                                 selectInput("model",
                                             "Estimação do modelo",
                                             c('glasso', 'TMFG'),
                                             'glasso'),
                                 
                                 selectInput('algorithm',
                                             'Algoritmo',
                                             c('walktrap', 'louvain'),
                                             'walktrap'),
                                 
                                 selectInput('type_plot',
                                             'Tipo da figura',
                                             c('qgraph', 'GGally'),
                                               'qgraph'),
                                 
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
                             )),
                             
                             # Plot
                             mainPanel(plotOutput('graph')))), 
                
                # Painel 2 - Correlações ====
                tabPanel('Correlações',
                         mainPanel(plotlyOutput('ega_corr'))),
                
                # Painel 3 - Texto ====
                tabPanel('O que é a AEG?',
                         mainPanel(texto_ega))
                
                
                )),
        
        #' *AFE*
        tabPanel('Análise Fatorial Exploratória',
                 tabsetPanel(
                     
                     # Painel 1 - Figura ====
                     tabPanel('Explore a AFE',
                              fluidRow(
                                  
                                  # Sidebar
                                  sidebarPanel(wellPanel(
                                      h4('Estimação da EFA'),
                                      sliderInput('n_factors',
                                                  'Número de Fatores',
                                                  1,
                                                  25,
                                                  5),
                                      
                                      selectInput('rotation',
                                                  'Rotação utilizada',
                                                  c("none", "varimax", "quartimax",
                                                    "bentlerT", "equamax", "varimin",
                                                    "geominT", "bifactor",
                                                    "Promax", "promax", "oblimin",
                                                    "simplimax", "bentlerQ", "geominQ",
                                                    "biquartimin", "cluster"),
                                                  'oblimin'),
                                      
                                      selectInput('factoring',
                                                  'Tipo da fatoração',
                                                  c("minres", "uls", "ols",
                                                    "wls", "gls", "pa",
                                                    "ml", "minchi", "minrank",
                                                    "old.min", "alpha"),
                                                  'minres'),
                                      
                                      conditionalPanel("input.rotation == 'none' |
                                                       input.rotation == 'varimax' |
                                                       input.rotation == 'quartimax' |
                                                       input.rotation == 'bentlerT' |
                                                       input.rotation == 'equamax' |
                                                       input.rotation == 'varimin' |
                                                       input.rotation == 'geominT' |
                                                       input.rotation == 'bifactor'",
                                                       h5('Você escolheu realizar
                                                          uma rotação',
                                                          strong('ortogonal.')),
                                                       h6(strong(
                                                           'Ou seja, o tipo de rotação
                                                           que você escolheu NÃO
                                                           estimará correlação
                                                           entre os fatores. Assim,
                                                           os fatores são considerados
                                                           variáveis latentes', 
                                                           em('independentes.')
                                                       ))),
                                      
                                      conditionalPanel("input.rotation == 'Promax' |
                                                       input.rotation == 'promax' |
                                                       input.rotation == 'oblimin' |
                                                       input.rotation == 'simplimax' |
                                                       input.rotation == 'bentlerQ' |
                                                       input.rotation == 'geominQ' |
                                                       input.rotation == 'biquartimin' |
                                                       input.rotation == 'cluster'",
                                                       h5('Você escolheu realizar
                                                          uma rotação',
                                                          strong('oblíqua.')),
                                                       h6(strong(
                                                           'Ou seja, o tipo de 
                                                           rotação que você escolheu
                                                           irá estimar correlações
                                                           entre os fatores. Assim,
                                                           os fatores são considerados
                                                           variáveis latentes', 
                                                           em('correlacionadas.')
                                                       )))
                                  )),
                                  
                                  # Plot
                                  mainPanel(plotOutput('efa')))), 
                     
                     
                     # Painel 2 - Correlações ====
                     tabPanel('Correlações',
                              mainPanel(plotlyOutput('efa_corr'))),
                     
                     # Painel 3 - Texto ====
                     tabPanel('O que é a AFE?',
                              mainPanel('textotextotexto'))
                     
                 )))
)

# Server ====
server <- function(input, output) {
    
    # AGE ====
    output$graph <- renderPlot({
        ega_plot(modelo = input$model,
                 algoritmo = input$algorithm,
                 tipo_plot = input$type_plot)
    })
    
    # Correlação AGE ====
    output$ega_corr <- renderPlotly({
        ega_cor_plot(
            modelo = input$model,
            algoritmo = input$algorithm,
            tipo_plot = input$type_plot
        )
    })
    
    # EFA ====
    output$efa <- renderPlot({
        efa_plot(numero_fatores = input$n_factors,
                 rotacao = input$rotation,
                 fatoracao = input$factoring)
    })
    
    # Correlação EFA ====
    output$efa_corr <- renderPlotly({
        efa_cor_plot(numero_fatores = input$n_factors,
                     rotacao = input$rotation,
                     fatoracao = input$factoring)
        
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)