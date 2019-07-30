##### BIBLIOTECA #####
library(ComplexHeatmap)
library(circlize)

##### SCRIPT #####
#plot heatmap
mat #sendo a matriz de expressão
Heatmap(mat)  #plotar um Heatmap simples

hm <- Heatmap(mat) #outra forma de plotar um Heatmap simples, neste caso jogamos o Heatmap para uma variável
draw(hm) #desenhar a variável

#colorindo heatmap
col_fun = colorRamp2(c(-2, 0, 2), c("green", "white", "red")) #onde colorRamp define de -2 a 2 o intervalo de coloração e as cores
Heatmap(mat, name = "noda legenda de cores", col = col_fun) #plotar Heatmap colorido

#titulo
Heatmap(mat, name = "nome legenda de cores", col = col_fun, column_title = "Título da coluna", row_title = "Título da linha") #acrescenta titulo na linha e coluna

#bordas
Heatmap(mat, name = "nome legenda de cores", border = TRUE) #para acrescentar bordas deixe TRUE para border, ou para esconder deixe FALSO

#annotation
Heatmap(mat, name = "nome legenda de cores", 
        top_annotation = HeatmapAnnotation("nome da legenda de cores da anotacao" = 1:24, "nome do grafico" = anno_points(runif(24))), #cria uma anotação ligada ao Heatmap, nesse caso uma legenda de cores e um gráfico de pontos
        right_annotation = rowAnnotation("nome da legenda de cores da anotacao" = 18:1, "nome do grafico" = anno_barplot(runif(18))) #cria uma anotação a direita do Heatmap ligada a linha, nesse caso a legenda de cores e um gráfico de barras
       ) #obs : retirar as aspas dos annotation

