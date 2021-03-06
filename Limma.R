--> Ajustar modelo linear para cada gene, dada uma série de matrizes. Usa-se usar para a regressão de mínimos quadrados lineares.


design <- model.matrix(~ 0+factor(c(1,1,1,2,2,2,3,3,3))) #criar matriz do projeto

fit <- lmFit(eset, design) #ajusta modelo linear para cada gene, dada uma serie de matrizes

contrast.matrix <- makeContrast(array2 - array1 , array3 - array 2 , array3 - array1 , levels = design) #-> Constrói a matriz de contraste correspondente aos contrastes especificados de um conjunto de comparação

fit2 <- contrasts.fit(fit,contrast.matrix) #calcula e testa contrastes arbitrários para objetos de regressão

fit2 <- eBayes(fit2) #calculo empírico de Bayes estima o risco relativo da região de estudos com n áreas, dado o número observado e esperado de contagens de informações de covariáveis

topTable(fit2, coef= 1,adjust="BH") #extrai uma tabela de genes mais bem classificados do um modelo linear

resultados <- decideTests(fit2) #classifica uma série de estatísticas t relacionadas como up, down ou não significante

