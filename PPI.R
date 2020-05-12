ppi <- read.table(file = "c:/Users/guilh/Desktop/Proj1/Data/ppi.txt",header = T,sep = "\t")

f_PPI <- subset(f, f$hugo %in% ppi$hugo)

EXP <- subset(EXP, rownames(EXP) %in% rownames(f_PPI))

Nm1 <- c(rep("",42))
for(i in 1:ncol(EXP)){
  Nm1[i] <- paste(as.character(p$DevelopmentalStage[i]),as.character(p$Time[i]),sep = "_")
}
colnames(EXP) <- Nm1

EXP <- EXP[,order(colnames(EXP),decreasing = T)]
EXP_z <- scale_rows(EXP)

EXP_z <- EXP_z[,order(colnames(EXP_z),decreasing = T)]


colnames(EXP_z)

metaData1 <- data.frame(Col = colnames(EXP_z)) #meta dados do experimento TOTAL
metaData1$Col1 <- metaData1$Col
metaData1 <- metaData1 %>%
  separate(col = Col1,into = c("cell","day"),sep = "_") #PRONTO

column_ha = HeatmapAnnotation(Tissue = metaData1$cell, Day = metaData1$day)

Heatmap(matrix = EXP_z,
        show_row_names = F,top_annotation = column_ha) #Com clusteriza??o
HM2 <- Heatmap(matrix = EXP_z,
               show_row_names = F,
               top_annotation = column_ha,
               cluster_columns = F,show_column_names = F,
               name = "Z-Score") #Sem clusteriza??o
tiff(filename = "Heatmap_PPI.tif",width = 4000,height = 2000,res = 600)
draw(HM2)
setwd("C:/Users/guilh/Desktop/Proj1/Output/PPI - heatmap")
dev.off()


#Ad
EXP_z <- as_tibble(EXP_z,.name_repair = "unique")
HMad <- EXP_z %>%
  select(starts_with("undiff"),starts_with("adi"))
Ad_ColName <- colnames(HMad)
Ad_ColName <- Ad_ColName[order(Ad_ColName,decreasing = T)]

Heatmap(matrix = as.matrix(HMad),
        show_row_names = F,
        cluster_columns = F,column_order = Ad_ColName)
HMad <- HMad[,order(colnames(HMad),decreasing = T)]
HMad_mean <- c(mean(as.matrix(HMad[,1:6])),mean(as.matrix(HMad[,7:12])),mean(as.matrix(HMad[,13:18])))
HMad_median <- c(median(as.matrix(HMad[,1:6])),median(as.matrix(HMad[,7:12])),median(as.matrix(HMad[,13:18])))


#Ob
HMob <- EXP_z %>%
  select(starts_with("undiff"),starts_with("ost"))
Ob_ColName <- colnames(HMob)
Ob_ColName <- Ob_ColName[order(Ob_ColName,decreasing = T)]


Heatmap(matrix = as.matrix(HMob),
        show_row_names = F,
        cluster_columns = F,column_order = Ob_ColName)

HMob_mean <- c(mean(as.matrix(HMob[,1:6])),mean(as.matrix(HMob[,7:12])),mean(as.matrix(HMob[,13:18])))
HMob_median <- c(median(as.matrix(HMob[,1:6])),median(as.matrix(HMob[,7:12])),median(as.matrix(HMob[,13:18])))


#ASC
ASC1 <- EXP %>%
  subset(rownames(EXP) == "50195")

ASC1 <- data.frame(metaData1,Value = ASC1[1,1:42])

Heatmap(matrix = as.matrix(ASC1),
        show_row_names = F,top_annotation = column_ha)

Heatmap(matrix = as.matrix(ASC1),
        show_row_names = F,
        top_annotation = column_ha,
        cluster_columns = F,show_column_names = F,
        name = "Z-Score") #Sem clusteriza??o
ASC1$day <- as.numeric(ASC1$day)
ASC1 %>%
  ggplot(aes(x = factor(day), y = Value, col = cell)) +
  geom_boxplot() + 
  facet_grid(.~cell) +
  theme_bw()

ASC1 %>%
  ggplot(aes(x = day, y = Value, col = cell)) +
  geom_line() +
  geom_point()

ASC1$day <- as.factor(ASC1$day)
res2 <- aov(Value ~ cell * day,data = ASC1)
summary(res2)
TukeyHSD(res2,which = c("cell","day","cell:day"))


set.seed(123)
exp1 <-exprs(eset)
fviz_nbclust(exp1,kmeans, method = "wss") #Analisar no gr?fico qual melhor numero de clusters
NbClust(data = exp1,method = "kmeans",min.nc = 5,max.nc = 20)

cl <- kmeans(x = exp1, centers = 24) #Realizar a analise de k-means

Clusters <- data.frame(Gene = fData(eset)$hugo)
Clusters$Cluster <- cl$cluster

Clusters %>%
  group_by(Cluster) %>%
  tally()

Clusters[Clusters$Gene == "ASC",]

sASC_cluster <- Clusters[Clusters$Cluster == 8,]
PPI_cluster <- Clusters[Clusters$Gene %in% ppi$hugo,]

PPI_cluster %>%
  group_by(Cluster) %>%
  tally()


tot_wss <- c()
tot_wss


for(i in 1:25){
  cl1 <- kmeans(exp1,centers = i)
  tot_wss[i] <- cl1$tot.withinss
}
tot_wss
plot(x=1:25,
     y=tot_wss,
     type = "b",
     xlab = "Number of clusters",
     ylab = "Within groups sum of squares")


DAVID_ADP7 <- read.table(file = "Diferenciação/ADP 7 - DAVID.txt",header = TRUE,sep = "\t", quote = "")

DAVID_ADP7 %>% #Dataframe sa?da do DavidTools
  ggplot(aes(x = Term, y = Count, fill = FDR)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  xlab("Termos") + #Labels
  ylab("Percentagem de genes (%)") + #Labels
  scale_fill_gradient(low="red", high="purple") + #Escolher cores
  theme_bw()

DAVID_ADP14 <- read.table(file = "Diferencia??o/ADP 7 - DAVID.txt",header = TRUE,sep = "\t", quote = "")
