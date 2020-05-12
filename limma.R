#### Analise limma ####

group <- with(pData(eset),paste(Cell,Time,sep = "_"))
group <- factor(group)

design <- model.matrix(~0 + group)
design

### grupo adipogenico ####
cmA <- makeContrasts(A14 = groupadipogenesis_14 - groupundifferentiated_0,
                     A7 = groupadipogenesis_7 - groupundifferentiated_0,
                     Adiff = groupadipogenesis_14 - groupadipogenesis_7,
                     levels = design) 
cmA

fitA <- lmFit(eset,design)

fitA2 <- contrasts.fit(fitA, contrasts = cmA)

fitA2 <- eBayes(fitA2)

resultsA <- decideTests(fitA2)

summary(resultsA)

topTable(fitA2)

vennDiagram(resultsA)

volcanoplot(fit = fitA2,coef = "A14",highlight = 10,names = fitA2$genes[,"hugo"])


#### grupo condrogenico ####
cmC <- makeContrasts(C14 = groupchondrogenesis_14 - groupundifferentiated_0,
                     C7 = groupchondrogenesis_7 - groupundifferentiated_0,
                     Cdiff =  groupchondrogenesis_14 - groupchondrogenesis_7,
                     levels = design)
cmC

fitC <- lmFit(eset,design)

fitC2 <- contrasts.fit(fitC,contrasts = cmC)

fitC2 <- eBayes(fitC2)

resultsC <- decideTests(fitC2)

summary(resultsC)

topTable(fitC2)

vennDiagram(resultsC)

volcanoplot(fit = fitC2, coef = "C14", highlight = 10, names = fitC2$genes[,"hugo"])

#### grupo osteogenico ####
cmO <- makeContrasts(O14 =  grouposteogenesis_14 -  groupundifferentiated_0,
                     O7 = grouposteogenesis_7 - groupundifferentiated_0,
                     Odiff = grouposteogenesis_14 - grouposteogenesis_7,
                     levels = design)
cmO

fitO <- lmFit(eset,design)

fitO2 <- contrasts.fit(fitO,contrasts = cmO)

fitO2 <- eBayes(fitO2)

View(fitO2)

resultsO <- decideTests(fitO2)

summary(resultsO)

topTable(fitO2)

topTable(fitO2,coef=NULL,number=10,genelist=fitO2$genes,adjust.method="BH",sort.by="B",resort.by=NULL,p.value=1,lfc=0,confint=FALSE)

vennDiagram(resultsO)

volcanoplot(fit = fitO2, coef = "O14", highlight =  10, names = fitO2$genes[,"hugo"])


