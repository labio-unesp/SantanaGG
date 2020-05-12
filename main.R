##### Main ####
###### Library ######
library(Biobase)
library(limma)
library(VennDiagram)
library(GSVA)
library(ComplexHeatmap)
library(circlize)
library(RColorBrewer)
library(dplyr)
library(tidyr)
library(ggplot2)
library(factoextra)
library(NbClust)
library(ggrepel)

##### Script #####

setwd("C:/Users/guilh/Desktop/Proj1/Data")

PRE_e <- read.table(file = "exp.txt",header = TRUE,sep = "\t")
PRE_e <- PRE_e[-1,]

e <- PRE_e[,-1]

row.names(e) <- PRE_e$Scan.REF
e <- e[order(row.names(e)),]
e <- e[,order(colnames(e))]

x <- as.matrix(sapply(e,as.numeric))
#matrix de expressao pronta

pre_f <- read.table(file = "feature.txt",sep = "\t",header = TRUE,quote = "")
f <- pre_f[,-1]
row.names(f) <- as.character(pre_f$Name)

f <- f[order(row.names(f)),]
#data.frame features pronto

pre_p <- read.table(file = "phenotype.txt",header = TRUE,sep = "\t")
p <- pre_p[,-1]
row.names(p) <- paste("X",pre_p$Hybridization,sep = "")
p <- p[order(row.names(p)),]

#ESET

eset <- ExpressionSet(assayData = x,
                      phenoData = AnnotatedDataFrame(p),
                      featureData = AnnotatedDataFrame(f))


plotDensities((eset),legend =  FALSE)
exprs(eset) <- log(exprs(eset))


colnames(pData(eset)) <- c("Cell","Time")

#### ANALISE DO LIMMA ####


#### PLOT DIAGRAMA DE VENN E VOLCANO ####


### plot listas ####
fits <- list("ADP" = fitA2, "OB" = fitO2, "CD"= fitC2)
View(fits)

TABLES <- lapply(fits,FUN = getTable)
DE_tables_14 <- lapply(TABLES, DE_finder)

DE_tables_7 <- lapply(TABLES, function(x){DE_finder(TABLES[x],group = 6)})
DE_tables_7 <- list(ADP = DE_finder(TABLES$ADP, group = 6),
                    OB = DE_finder(TABLES$OB, group = 6),
                    CD = DE_finder(TABLES$CD, group = 6))

DE_tables_Diff <- lapply(TABLES, function(x){DE_finder(TABLES[x],group = 7)})
DE_tables_Diff <- list(ADP = DE_finder(TABLES$ADP, group = 7),
                       OB = DE_finder(TABLES$OB, group = 7),
                       CD = DE_finder(TABLES$CD, group = 7))

List_14_diff_7 <- list(ADP = setdiff(DE_tables_14$ADP$hugo,DE_tables_7$ADP$hugo),
                       OB = setdiff(DE_tables_14$OB$hugo,DE_tables_7$OB$hugo),
                       CD = setdiff(DE_tables_14$CD$hugo,DE_tables_7$CD$hugo))

List_7_diff_14 <- list(ADP = setdiff(DE_tables_7$ADP$hugo,DE_tables_14$ADP$hugo),
                       OB = setdiff(DE_tables_7$OB$hugo,DE_tables_14$OB$hugo),
                       CD = setdiff(DE_tables_7$CD$hugo,DE_tables_14$CD$hugo))


intersec_14_7 <- list(ADP = intersect(DE_tables_14$ADP$hugo,DE_tables_7$ADP$hugo),
                      OB = intersect(DE_tables_14$OB$hugo,DE_tables_7$OB$hugo),
                      CD = intersect(DE_tables_14$CD$hugo,DE_tables_7$CD$hugo))



VENN_DE <- list(ADP = DE_tables_14$ADP$hugo,
                OB = DE_tables_14$OB$hugo,
                CD = DE_tables_14$CD$hugo)

VENN_DE_7 <- list(ADP = DE_tables_7$ADP$hugo,
                  OB = DE_tables_7$OB$hugo,
                  CD = DE_tables_7$CD$hugo)
#PLOT DE DIAGRAMA DOS DIFERENCIALMENTE EXPRESSOS#


##### analise ##### 
eset2 <- eset
annotation(eset2) <- "org.Hs.eg.db"

#GSVA
#GMT | lista

#PPI ####
EXP <- exprs(eset)
View(head(f))



