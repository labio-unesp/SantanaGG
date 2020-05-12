#diagrama de venn

setwd("C:/Users/guilh/Desktop/Proj1/Output/Diagrama de Venn")

#Adip
tiff(filename = "diagramaA.tiff",width = 1000,height = 1000,units = "px",res = 600,pointsize = 2.8)
vennDiagram(resultsA)
dev.off()


#Chond
tiff(filename = "diagramaC.tiff",width = 1000,height = 1000,units = "px",res = 600,pointsize = 2.8)
vennDiagram(resultsC)
dev.off()


#Osteo
tiff(filename = "diagramaO.tiff",width = 1000,height = 1000,units = "px",res = 600,pointsize = 2.8)
vennDiagram(resultsO)
dev.off()






#### PLOT DE DIAGRAMA DOS DIFERENCIALMENTE EXPRESSOS ####

venn.diagram(x = VENN_DE,filename = "venn_de_14.png",
             main = "Different expressed genes 14 days")  


venn.diagram(x = VENN_DE_7,filename = "venn_de_7.png",
             main = "Different expressed genes 7 days") 


#### PLOT DE DIAGRAMA DE VENN EM 2 TIPOS DIFERENTES ####
#Diagrama tipo 1#
ADP_DE <- list(Day_7 = DE_tables_7$ADP$hugo,
               Day_14 = DE_tables_14$ADP$hugo)

venn.diagram(ADP_DE, filename = "VENN_ADYPOGENESIS.PNG",scaled = FALSE, euler.d = FALSE, resolution = 600, height = 2500, width = 2500,
             cat.cex = .75, cex = .75, lty =2, lwd =0.5, fontfamily ="serif", imagetype = "tiff",
             fill = c("blue", "red"),units = "px", 
             main = "Venn Diagram Differentially Adypogenesis")




OB_DE <- list(Day_7 = DE_tables_7$OB$hugo,
              Day_14 = DE_tables_14$OB$hugo)

venn.diagram(OB_DE, filename = "VENN_OSTEOBLAT.PNG",scaled = FALSE, euler.d = FALSE, resolution = 600, height = 2500, width = 2500,
             cat.cex = .75, cex = .75, lty =2, lwd =0.5, fontfamily ="serif", imagetype = "tiff",
             fill = c("blue", "red"),units = "px", 
             main = "Venn Diagram Differentially Osteoblast")




CD_DE <- list(Day_7 = DE_tables_7$CD$hugo,
              Day_14 = DE_tables_14$CD$hugo)

venn.diagram(CD_DE, filename = "VENN_CHONDROBLASTS.PNG",scaled = FALSE, euler.d = FALSE, resolution = 600, height = 2500, width = 2500,
             cat.cex = .75, cex = .75, lty =2, lwd =0.5, fontfamily ="serif", imagetype = "tiff",
             fill = c("yellow", "hot pink"),units = "px",main.just = c(0.5,1), category.names  = c("DAY 7", "DAY 14"),
             main = "Venn Diagram Differentially Chondroblasts",main.pos = c(0.5, 1.05))





#Diagrama tipo 2#
grid.newpage()
png(filename = "DIAGRAMA_VENN_ADYPOGENESIS.PNG")
venn.plot <- draw.pairwise.venn(area1 = 680,
                                area2 = 540,
                                cross.area = 509,
                                category = c("DAY 14","DAY 7"),
                                cat.pos = c(0,0),
                                cat.cex = 2,
                                lty = ("blank"), 
                                fill = c("red","blue"),
                                cat.dist = rep(0.025, 2),
                                alpha = c(0.4,0.4),
                                scaled = FALSE,
                                cex = 1.5)
dev.off()

grid.newpage()
png(filename = "DIAGRAMA_VENN_OSTEOGENIC_trio.PNG")
draw.triple.venn(area1 = 814, 
                 area2 = 402, 
                 area3 = 126, 
                 n12 = 241, 
                 n23 = 34, 
                 n13 = 61, 
                 n123 = 9, 
                 category = c("Day 7", "Day 14", "Diff"), 
                 lty = "blank", 
                 fill = c("skyblue", "pink1", "mediumorchid"))

dev.off()

grid.newpage()
png(filename = "DIAGRAMA_VENN_CHONDROBLASTS_trio.PNG")
draw.triple.venn(area1 = 2752, 
                 area2 = 1023, 
                 area3 = 1952, 
                 n12 = 686, 
                 n23 = 202, 
                 n13 =1245, 
                 n123 = 72, 
                 category = c("Day 7", "Day 14", "Diff"), 
                 lty = "blank", 
                 fill = c("skyblue", "pink1", "mediumorchid"))

dev.off()

grid.newpage()
png(filename = "DIAGRAMA_VENN_ADYPOGENESIS_trio.PNG")
draw.triple.venn(area1 = 1416, 
                 area2 = 772, 
                 area3 = 27, 
                 n12 = 615, 
                 n23 = 15, 
                 n13 =12, 
                 n123 = 3, 
                 category = c("Day 7", "Day 14", "Diff"), 
                 lty = "blank", 
                 fill = c("skyblue", "pink1", "mediumorchid"))

dev.off()

grid.newpage()
png(filename = "DIAGRAMA_VENN_OSTEOGENIC.PNG")
venn.plot <- draw.pairwise.venn(area1 = 355,
                                area2 = 267,
                                cross.area = 222,
                                category = c("DAY 14","DAY 7"),
                                cat.pos= c(0,0),
                                cat.cex = 2,
                                lty = ("blank"),
                                fill = c("red","blue"),
                                cat.dist = rep(0.025, 2),
                                alpha = c(0.4,0.4),
                                scaled = FALSE,
                                cex = 1.5)
dev.off()



grid.newpage()
png(filename = "DIAGRAMA_VENN_CHONDROBLASTS.PNG")
venn.plot <- draw.pairwise.venn(area1 = 1558,
                                area2 = 697,
                                cross.area = 537,
                                category = c("DAY 14","DAY 7"),                               cat.pos= c(0,0),
                                cat.cex = 2,
                                lty = ("blank"),
                                fill = c("red","blue"),
                                cat.dist = rep(0.025, 2),
                                alpha = c(0.4,0.4),
                                scaled = FALSE,
                                cex = 1.5)
dev.off()





