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
  
  strong(h3('Exploratory Graph Analysis')),

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

texto_afe <-
  c(
  "Análise Fatorial Exploratória (AFE) é uma ferramenta estatística que serve 
  para diversas propostas. Em ciências sociais (e.g. Psicologia, Educação) ela 
  tem servido o propósito geral de diminuir o número de dimensões/fatores de 
  uma escala ou instrumento. Isto é, a redução do número de parâmetros para 
  o número de traços latentes/construtos psicológicos. Assim, podemos definir 
  como objetivo da AFE:
  
  Avaliar a dimensionalidade de uma série de indicadores de maneira a identificar 
  o menor número de traços latentes que explica o padrão das correlações 
  (Osborne, 2014).

  De maneira mais formal, o modelo fatorial comum (Common Factor Model) vê a 
  covariância entre variáveis observáveis como um reflexo da influência de um 
  ou mais fatores e a variância não explicada. Os itens são considerados 
  indicadores que variam de acordo com o nível de traço latente, ou seja, 
  quanto maior seu nível de Depressão, maior seria sua concordância com o item 
  “Tenho me sentido deprimido”.
  Por exemplo, no instrumento DASS-21 tem-se 21 parâmetros (ou itens) que se 
  propõem a medir Depressão, Ansiedade e Estresse. Para que serveria realizar 
  uma AFE? Para diminuir o número de parâmetros que temos e agrupá-lo em um ou 
  mais traços latentes. Ou seja, ao invés de nós termos 21 indicadores 
  diferentes que avaliam Depressão/Ansiedade/Estresse, fazemos uma redução 
  para 3 indicadores (traços latentes) que explicam a variância dos itens.
  A AFE divide entre a variância em comum (comunalidade) e a variância única 
  (singularidade). A variância em comum diz respeito a influência compartilhada 
  de traços latentes em um indicador. Já a variância única pode representar duas 
  coisas: variação do item que reflete causas latentes não conhecidas; e erro 
  aleatório dado a falta de confiabilidade ou erro de medida.
  O modelo fatorial comum se baseia na mecânica de regressão linear, e 
  especifica que os dados observáveis refletem uma combinação linear da 
  influência do traço latente.",
  
  "Se temos 1 indicador/item, representando m fatores, temos a seguinte notação:",
  
  strong(h3('Por que ela é chamada de Exploratória?')), 
  
  "Ela é mais data-driven, ou seja, não se pressupõe estatisticamente qual é o 
  comportamento da relação entre as variáveis. Em uma Análise Fatorial 
  Confirmatória, se fixa os parâmetros e os itens carregam apenas em seus 
  respectivos fatores. Já na AFE o item pode carregar tanto no seu fator 
  hipotetizado quanto nos demais fatores."
  )

