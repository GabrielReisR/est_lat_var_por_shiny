numero_fatores <- 1:25

rotacao <- c("none", "varimax", "quartimax",
             "bentlerT", "equamax", "varimin",
             "geominT", "bifactor",
             "Promax", "promax", "oblimin",
             "simplimax", "bentlerQ", "geominQ",
             "biquartimin", "cluster")

fatoracao <- c("minres", "uls", "ols",
               "wls", "gls", "pa",
               "ml", "minchi", "minrank",
               "old.min", "alpha")

efa <- function(numero_fatores = 5,
                rotacao = 'oblimin',
                fatoracao = 'minres'){
  psych::fa(
    psych::bfi[1:25],
    cor = 'poly',
    nfactors = numero_fatores,
    rotate = rotacao,
    fm = fatoracao
  )
  
}


fa <- psych::fa(
  psych::bfi[1:25],
  cor = 'poly',
  nfactors = 10,
  rotate = 'varimin',
  fm = 'minres'
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
