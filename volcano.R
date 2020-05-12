#Volcano ####
setwd("C:/Users/guilh/Desktop/Proj1/Output/Volcano")

#Adip
tiff(filename = "volcano_A14.tiff",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitA2, coef = "A14", names = fitA2$genes[,"hugo"])
dev.off()

tiff(filename = "volcano_A7.tiff",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitA2, coef = "A7", names = fitA2$genes[,"hugo"])
dev.off()

tiff(filename = "volcano_Adiff.tiff",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitA2, coef = "Adiff", names = fitA2$genes[,"hugo"])
dev.off()


#Chond
tiff(filename = "volcano_C14.tiff",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitC2, coef = "C14", names = fitC2$genes[,"hugo"])
dev.off()

tiff(filename = "volcano_C7.tiff",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitC2, coef = "C7", names = fitC2$genes[,"hugo"])
dev.off()

tiff(filename = "volcano_Cdiff.tiff",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitC2, coef = "Cdiff", names = fitC2$genes[,"hugo"])
dev.off()


#Osteo
tiff(filename = "volcano_O14.tiff",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitO2, coef = "O14", names = fitO2$genes[,"hugo"])
dev.off()

tiff(filename = "volcano_O7.tiff",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitO2, coef = "O7", names = fitO2$genes[,"hugo"])
dev.off()

png(filename = "volcano_Odiff.png",width = 1600,height = 1200,units = "px",res = 600,pointsize = 4)
volcanoplot(fit = fitO2, coef = "Odiff", names = fitO2$genes[,"hugo"])
dev.off()



# tipo 2 ####

test <- topTable(fitO2,number = 24357)
test <- getTable(fitO2)
test1 <- getTable(fitA2)
test2 <-getTable(fitC2)

mutateddf <- mutate(test2,
                    sig=ifelse((test2$P.Value < 0.05 ) & (test2$C14 > 0.5), "up - regulados", ifelse((test2$P.Value < 0.1) & (test2$C14 < -1), "down regulados","N?o significantes"))) #Will have different colors depending on significance
input <- cbind(gene=mutateddf$hugo, mutateddf ) #convert the rownames to a column
volc = ggplot(input, aes(C14, -log10(P.Value))) + #volcanoplot with log2Foldchange versus pvalue
  geom_point(aes(col=sig)) + #add points colored by significance
  scale_color_manual(values=c("red", "black","green")) + 
  ggtitle("Volcano plot") + #e.g. 'Volcanoplot DESeq2'
  geom_hline(yintercept = 1,linetype="dotted") +
  geom_vline(xintercept = c(-1,1),linetype="dotted") +
  theme_bw()
ggsave(filename = "VolcanoplotChondro 14.png",width = 12,height = 7,dpi = 300)


mutateddf1 <- mutate(test2,
                    sig=ifelse((test2$P.Value < 0.05 ) & (test2$C7 > 0.5), "up - regulados", ifelse((test2$P.Value < 0.1) & (test2$C7 < -1), "down regulados","N?o significantes"))) #Will have different colors depending on significance
input <- cbind(gene=mutateddf1$hugo, mutateddf1 ) #convert the rownames to a column
volc = ggplot(input, aes(C7, -log10(P.Value))) + #volcanoplot with log2Foldchange versus pvalue
  geom_point(aes(col=sig)) + #add points colored by significance
  scale_color_manual(values=c("red", "black","green")) + 
  ggtitle("Volcano plot") + #e.g. 'Volcanoplot DESeq2'
  geom_hline(yintercept = 1,linetype="dotted") +
  geom_vline(xintercept = c(-1,1),linetype="dotted") +
  theme_bw()
ggsave(filename = "VolcanoplotChondro 7.png",width = 12,height = 7,dpi = 300)

mutateddf2 <- mutate(test1,
                    sig=ifelse((test1$P.Value < 0.05 ) & (test1$A7 > 0.5), "up - regulados", ifelse((test1$P.Value < 0.1) & (test1$A7 < -1), "down regulados","N?o significantes"))) #Will have different colors depending on significance
input <- cbind(gene=mutateddf2$hugo, mutateddf2 ) #convert the rownames to a column
volc = ggplot(input, aes(A7, -log10(P.Value))) + #volcanoplot with log2Foldchange versus pvalue
  geom_point(aes(col=sig)) + #add points colored by significance
  scale_color_manual(values=c("red", "black","green")) + 
  ggtitle("Volcano plot") + #e.g. 'Volcanoplot DESeq2'
  geom_hline(yintercept = 1,linetype="dotted") +
  geom_vline(xintercept = c(-1,1),linetype="dotted") +
  theme_bw()
ggsave(filename = "VolcanoplotAdypo 7.png",width = 12,height = 7,dpi = 300)


mutateddf3 <- mutate(test1,
                    sig=ifelse((test1$P.Value < 0.05 ) & (test1$A14 > 0.5), "up - regulados", ifelse((test1$P.Value < 0.1) & (test1$A14 < -1), "down regulados","N?o significantes"))) #Will have different colors depending on significance
input <- cbind(gene=mutateddf3$hugo, mutateddf3 ) #convert the rownames to a column
volc = ggplot(input, aes(A14, -log10(P.Value))) + #volcanoplot with log2Foldchange versus pvalue
  geom_point(aes(col=sig)) + #add points colored by significance
  scale_color_manual(values=c("red", "black","green")) + 
  ggtitle("Volcano plot") + #e.g. 'Volcanoplot DESeq2'
  geom_hline(yintercept = 1,linetype="dotted") +
  geom_vline(xintercept = c(-1,1),linetype="dotted") +
  theme_bw()
ggsave(filename = "VolcanoplotAdypo 14.png",width = 12,height = 7,dpi = 300)


mutateddf4 <- mutate(test,
                    sig=ifelse((test$P.Value < 0.05 ) & (test$O14 > 0.5), "up - regulados", ifelse((test$P.Value < 0.1) & (test$O14 < -1), "down regulados","N?o significantes"))) #Will have different colors depending on significance
input <- cbind(gene=mutateddf4$hugo, mutateddf4 ) #convert the rownames to a column
volc = ggplot(input, aes(O14, -log10(P.Value))) + #volcanoplot with log2Foldchange versus pvalue
  geom_point(aes(col=sig)) + #add points colored by significance
  scale_color_manual(values=c("red", "black","green")) + 
  ggtitle("Volcano plot") + #e.g. 'Volcanoplot DESeq2'
  geom_hline(yintercept = 1,linetype="dotted") +
  geom_vline(xintercept = c(-1,1),linetype="dotted") +
  theme_bw()
ggsave(filename = "VolcanoplotOsteo 14.png",width = 12,height = 7,dpi = 300)


mutateddf5 <- mutate(test,
                    sig=ifelse((test$P.Value < 0.05 ) & (test$O7 > 0.5), "up - regulados", ifelse((test$P.Value < 0.1) & (test$O7 < -1), "down regulados","N?o significantes"))) #Will have different colors depending on significance
input <- cbind(gene=mutateddf5$hugo, mutateddf5 ) #convert the rownames to a column
volc = ggplot(input, aes(O7, -log10(P.Value))) + #volcanoplot with log2Foldchange versus pvalue
  geom_point(aes(col=sig)) + #add points colored by significance
  scale_color_manual(values=c("red", "black","green")) + 
  ggtitle("Volcano plot") + #e.g. 'Volcanoplot DESeq2'
  geom_hline(yintercept = 1,linetype="dotted") +
  geom_vline(xintercept = c(-1,1),linetype="dotted") +
  theme_bw()
ggsave(filename = "VolcanoplotOsteo 7.png",width = 12,height = 7,dpi = 300)
