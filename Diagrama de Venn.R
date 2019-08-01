1º Metodo
venn.diagram(x, #vetor que será usado no diagrama
             filename = "nome do arquivo que será exportado.PNG ou .tiff",
             scaled = FALSE, #escalonamento 
             euler.d = FALSE, #escalonamento de euler para diagrama
              resolution = 600,
             height = 2500, #altura
             widht = 2500, #largura
             cat.cex = .75, #tamanho dado para cada nome de categoria
             cex = .75, #tamanho para cada rótulo de área
             lty = 2, #padrão de traço de cada circulo
             lwd = 0.5, #largura da circunferencia de cada circulo
             fontfamily = "serif",
             imagetype = "tiff ou png",
             fill = c("cor primeiro circulo","cor segundo circulo"),
             units = "px",
             main = "Titulo do Diagrama")
             


2º Metodo
grid.newpage()
png(filename = "nome do arquivo que será exportado.PNG ou .tiff")
venn.plot <- draw.pairwise.venn(area1 = 680, #numero do primero circulo
                                area2 = 540, #numero do segund circulo
                                cross.area = 509, #numero que contem em ambos
                                category = c("DAY 14","DAY 7"), #titulo dos circulos
                                cat.pos = c(0,0), #posição do titulo
                                cat.cex = 2, #tamanho dado para cada nome de categoria
                                lty = ("blank"), 
                                fill = c("cor primeiro circulo","cor segundo circulo"),
                                cat.dist = rep(0.025, 2),
                                alpha = c(0.4,0.4),
                                scaled = FALSE,
                                cex = 1.5)
dev.off()
