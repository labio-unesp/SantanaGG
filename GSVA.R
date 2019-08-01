"gsva"(expr, #gene de expressão
       gset.idx.list, #conjunto de genes fornecido como um objeto de lista 
       method=c("gsva", "ssgsea", "zscore", "plage"), #Método para empregar na estimativa de escores de enriquecimento de conjuntos de genes por amostra
       rnaseq=TRUE, # informar se os dados da expressão gênica de entrada são provenientes de experimentos de microarray 
       abs.ranking=FALSE, #determinar se os genes devem ser classificados de acordo com seu sinal (abs.ranking = FALSE) ou por valor absoluto
       min.sz=1, #minimo de conjunto de genes
       max.sz=Inf, #maximo de conjunto de genes
       no.bootstraps=0, #numero de interaçoes bootstrap a serem executadas
       bootstrap.percent = .632, #percentual de amostra bootstrap
       parallel.sz=0,  #Número de processadores a serem usados ao fazer os cálculos em paralelo
       mx.diff=TRUE, #calcular a estatística de enriquecimento (ES) da estatística de passeio aleatório do KS
       tau=switch(method, gsva=1, ssgsea=0.25, NA), # tau = 1 quando o método = "gsva" e tau = 0.25 quando o método = "ssgsea" apenas conforme especificado 
       kernel=TRUE, 
       ssgsea.norm=TRUE, 
       verbose=TRUE) #fornece informaçoes sobre cada etapa de calculo
