# Análise Exploratória com Grafos ====
ega_plot <- function(modelo = 'glasso',
                     algoritmo = 'walktrap',
                     tipo_plot = 'qgraph'){
  p <- 
    EGAnet::EGA(
      bfi[1:25],
      uni.method = "LE",
      corr = "cor_auto",
      model = modelo,
      algorithm = algoritmo,
      plot.EGA = TRUE,
      plot.type = tipo_plot
    )
}

ega_cor_plot <- function(modelo = 'glasso',
                         algoritmo = 'walktrap',
                         tipo_plot = 'qgraph'){
  
  p <- 
    EGAnet::EGA(
      bfi[1:25],
      uni.method = "LE",
      corr = "cor_auto",
      model = modelo,
      algorithm = algoritmo,
      plot.EGA = F,
      plot.type = tipo_plot
    )
  
  plotly::ggplotly(
    ggcorrplot::ggcorrplot(
      p$correlation,
      outline.col = "white",
      type = "lower",
      show.diag = T,
      colors = c("red", "white", "blue")
    )
  )
}


# Análise Fatorial Exploratória ====
efa_plot <- function(numero_fatores = 5,
                     rotacao = 'oblimin',
                     fatoracao = 'minres') {
  
  fa <- psych::fa(
    psych::bfi[1:25],
    cor = 'poly',
    nfactors = numero_fatores,
    rotate = rotacao,
    fm = fatoracao
  )

  psych::fa.diagram(
    fa,
    main = 'Análise Fatorial Exploratória',
    sort = T,
    digits = 2,
    side = 1,
    rsize = 10,
    adj = 1
  )
  
}

efa_cor_plot <- function(numero_fatores = 5,
                         rotacao = 'oblimin',
                         fatoracao = 'minres'){
  
  fa <- psych::fa(
    psych::bfi[1:25],
    nfactors = numero_fatores,
    rotate = rotacao,
    fm = fatoracao
  )
  
  plotly::ggplotly(
    ggcorrplot::ggcorrplot(
      fa$r,
      outline.col = "white",
      type = "lower",
      show.diag = T,
      colors = c("red", "white", "blue")
    )
  )
}
