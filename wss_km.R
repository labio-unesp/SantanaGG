###### Library ####
library(factoextra)

###### Functions ####
wss <- function(k) {
  kmeans(df, k, nstart = 10 )$tot.withinss
}


###### Script ####
EXP #Matriz de expressão do limma

set.seed(123)
fviz_nbclust(EXP,eans, method = "wss") #Analisar no gráfico qual melhor numero de clusters


kmeans(x = EXP, centers = #numeroscolhido) #Realizar a análise de k-means
