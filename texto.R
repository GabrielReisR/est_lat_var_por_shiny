texto_ega <-
  c("Em psicologia, educação e ciências comportamentais, usamos 
  escalas/instrumentos para medir um determinado construto (por exemplo, 
  ansiedade, felicidade). Para isso, costumamos ter um questionário com um 
  número X de itens e desejamos saber a quantidade de fatores latentes que 
  surgem desses itens. Isso geralmente é feito com Análise Fatorial 
  Exploratória (AFE), onde o número de dimensões é geralmente estimado 
  examinando os padrões de eigenvalues/autovalores (veja meu guia sobre 
  eigenvalues aqui). Dois dos métodos mais comuns que usam autovalores são 
  o critério de Kaiser-Guttman que seleciona fatores que apresentam eigenvalue 
  > 1 e análise paralela. No entanto, muitas críticas têm sido feitas com 
  relação ao desempenho desses métodos na estimativa da dimensionalidade. Por 
  exemplo, o critério de Kaiser-Guttman pode tanto subestimar quanto 
  sobrestimar o número de fatores (Zwick & Velicer, 1986). Já a análise 
  paralela tradicional tende a ter erros do Tipo I inflados em dados binários 
  (Green et al., 2016).

  Devido a essas e outras limitações, Golino & Epskamp (2017) propuseram um 
  novo método para estimar a dimensionalidade de uma escala, denominado 
  Exploratory Graph Analysis (EGA), ou Análise Exploratória de Grafos. 
  Este artigo será um breve resumo dos desenvolvimentos recentes em EGA, 
  visando a divulgação deste método.",
  
  strong(h3('Exploratory Graph Analysis')), '[asdasd](https://twitter.com)',

  "Os métodos de psicometria de rede ganharam atenção recentemente na literatura
  das ciências psicológicas. Isso pode ser devido à mudança na interpretação 
  teórica das correlações observadas nos dados. Tradicionalmente, como feito 
  pela AFE, os modelos psicométricos assumem que as causas latentes explicam 
  o comportamento observado (ou seja, itens). Áreas emergentes, como a 
  psicometria de rede, apresentam modelos promissores para a pesquisa em 
  psicologia, pois apóia perspectivas teóricas sobre a complexidade, ou seja, 
  considera os atributos psicológicos como sistemas de comportamentos observados 
  que se reforçam mutuamente e de forma dinâmica.
  
  Há uma relação entre uma variável latente típica na psicometria tradicional e
  em clusters de rede. Conforme dito por Golino & Epskamp (2017):
  
  Pode-se ver diretamente que, se um modelo de variável latente é o verdadeiro 
  modelo causal subjacente, esperaríamos que os indicadores em um modelo de rede
  apresentassem clusters fortemente conectados para cada variável latente. 
  Uma vez que os edges correspondem a coeficientes de correlação parciais entre
  duas variáveis após o condicionamento em todas as outras variáveis na rede, e
  dois indicadores não podem se tornar independentes após o condicionamento nas
  variáveis observadas, uma vez que ambos são causados por uma variável latente,
  a força do edge entre dois indicadores não deve ser zero.
  O EGA é um método exploratório que não depende de premissas a priori, 
  portanto, não requer orientação do pesquisador. Em EGA, os nodes representam
  variáveis (ou seja, itens) e os edges representam a relação (ou seja, 
  correlações) entre dois nodes.
  
  Na primeira publicação dos autores sobre o método, a EGA era feita assim:
  É estimada a matriz de correlação entre as variáveis observadas.
  A estimação graphical least absolute shrinkage and selection operator (glasso)
  é usada para obter a matriz de covariância esparsa inversa, com a
  regularização dos parâmetros definidos via EBIC sobre 100 valores diferentes.
  Essa junção do EBIC com glasso tem sido chamada de EBICglasso.
  
  O algorítimo walktrap é usado para achar o número de clusters da matriz de
  correlação parcial calculada nos passos anteriores.
  O número de clusters identificados é igual ao número de variáveis latentes.
  
  Vamos explicar um pouco o que é uma correlação parcial, glasso, EBIC e 
  Walktrap a seguir.
  Correlação parcial
  Como uma correlação normal, ela representa o grau de associação entre duas 
  variáveis. Contudo, diferente da correlação normal, ela vê essa associação 
  controlando todas as outras variáveis que você colocar no modelo. 
  No exemplo da EGA, vemos a relação entre um Item 1 e Item 2 controlando o 
  efeito de todos os outros itens. Para calcular, basta calcular a inversa da 
  matriz de covariância. Como o intuito não é ensinar a calcular a inversa de 
  uma matriz, deixamos como dever de casa.
  EBICglasso")

