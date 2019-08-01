1º Metodo
venn.diagram(x, #vetor que será usado no diagrama
             filename = "nome do arquivo que será exportado.PNG ou .tiff",
             scaled = FALSE,
             euler.d = FALSE, 
              resolution = 600,
             height = 2500, #altura
             widht = 2500, #largura
             cat.cex = .75,
             cex = .75, 
             lty = 2, 
             lwd = 0.5,
             fontfamily = "serif",
             imagetype = "tiff ou png",
             fill = c("cor primeiro circulo","cor segundo circulo"),
             units = "px",
             main = "Titulo do Diagrama")
             


2º Metodo
grid.newpage()
png(filename = "nome do arquivo que será exportado.PNG ou .tiff")
venn.plot <- draw.pairwise.venn(area1 = 680,
                                area2 = 540,
                                cross.area = 509,
                                category = c("DAY 14","DAY 7"),
                                cat.pos = c(0,0),
                                cat.cex = 2,
                                lty = ("blank"), 
                                fill = c("cor primeiro circulo","cor segundo circulo"),
                                cat.dist = rep(0.025, 2),
                                alpha = c(0.4,0.4),
                                scaled = FALSE,
                                cex = 1.5)
dev.off()
