files <- list.files(path = "msigdb/",pattern = ".gmt",full.names = T)

Pericles <- exprs(eset)
row.names(Pericles) <- fData(eset)$hugo
n1 <- paste(pData(eset)[,1],pData(eset)[,2])
colnames(Pericles) <- n1

write.table(x = Pericles,file = "pericles.txt",sep = "\t", quote = F)


colnames(meanPer) <- unique(colnames(Pericles))
row.names(meanPer) <- rownames(Pericles)



meanPer <- matrix(NA, ncol = 7, nrow = nrow(Pericles))
Pericles <- Pericles[,order(colnames(Pericles))]

for(i in 1:nrow(Pericles)){
  meanPer[i,1] <- mean(Pericles[i,1:6])
  meanPer[i,2] <- mean(Pericles[i,7:12])
  meanPer[i,3] <- mean(Pericles[i,13:18])
  meanPer[i,4] <- mean(Pericles[i,19:24])
  meanPer[i,5] <- mean(Pericles[i,25:30])
  meanPer[i,6] <- mean(Pericles[i,31:36])
  meanPer[i,7] <- mean(Pericles[i,37:42])
}


for(i in 1:length(files)){
  pathways <- gmt2list(files[i])
  
  GSVA_teste <- gsva(meanPer,pathways, method = "gsva",verbose = T,tau = 1,abs.ranking = F,ssgsea.norm = FALSE)
  
  v1 <- gsub(".gmt","",files[i])
  v1 <- gsub(".2.symbols","",v1)
  v1 <- gsub("msigdb/","",v1)
  
  write.table(x = GSVA_teste,file = paste0("C:/Users/guilh/Desktop/Proj1/Data/GSVA",v1,".txt"),row.names = T, col.names = T, sep = "\t", quote = F)
  
  mat <- scale_rows(GSVA_teste)
  tiff(filename = paste(v1,"2HM","tif",sep = "."),width = 3500, height = 4000,res = 600)
  breaks <- seq(-2, 2, by= 0.1)
  f3 = colorRamp2(breaks, colorRampPalette(rev(brewer.pal(n = 10, name = "RdBu")))(41))
  
  
  H2 <- Heatmap(matrix = mat,col = f3,clustering_distance_columns = "pearson", clustering_method_columns = "ward.D2",
                clustering_distance_rows = "pearson", clustering_method_rows = "ward.D2", 
                show_column_dend = T, show_row_dend = F,show_row_names = F, name = "GSVA Score",column_title = v1)
  draw(H2)
  dev.off()
}



### GMT 
setwd("C:/Users/guilh/Desktop/Proj1/Data/")
tiff(filename = "Diff_sig.tif",width = 3500, height = 4000,res = 600)
breaks <- seq(-2, 2, by= 0.1)
f3 = colorRamp2(breaks, colorRampPalette(rev(brewer.pal(n = 10, name = "RdBu")))(41))
m1 <- read.table(file = "GSVA/Diff_sig.txt",sep = "\t")
m1 <- scale_rows(m1)
H2 <- Heatmap(matrix = as.matrix(m1),col = f3,clustering_distance_columns = "pearson", clustering_method_columns = "ward.D2",
              clustering_distance_rows = "pearson", clustering_method_rows = "ward.D2", 
              show_column_dend = T, show_row_dend = F,show_row_names = T, name = "GSVA Score")
draw(H2)

setwd("C:/Users/guilh/Desktop/Proj1/Output/GSVA - heatmap")
dev.off()




setwd("C:/Users/guilh/Desktop/Proj1/Data/")
df1 <- read.table(file = "GSVA/Diff_sig.txt",header = TRUE,sep = "\t") # Leia o arquivo GSVA/Diff_sig.txt
df1 <- scale_rows(df1)

breaks <- seq(-2, 2, by= 0.1)
f3 = colorRamp2(breaks, colorRampPalette(rev(brewer.pal(n = 10, name = "RdBu")))(41))

tiff(filename = "Diff_sig.value.tif",width = 3500, height = 4000,res = 600)
Heatmap(df1,col = f3,clustering_distance_columns = "pearson", clustering_method_columns = "ward.D2",
        clustering_distance_rows = "pearson", clustering_method_rows = "ward.D2", 
        show_column_dend = T, show_row_dend = F,show_row_names = F, name = "GSVA Score",column_title = "Differential experessed genes signatures",
        cell_fun = function(j, i, x, y, width, height, fill) {
          grid.text(sprintf("%.1f", df1[i, j]), x, y, gp = gpar(fontsize = 15))
        })
setwd("C:/Users/guilh/Desktop/Proj1/Output/GSVA - heatmap")
dev.off()

