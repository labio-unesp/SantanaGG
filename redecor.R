

CorEx <- MatrizExpress %>% correlate(diagonal = 0) #Correlation matrix

CorExNet <- CorEx[,-1] %>% #Adjacent matrix
  getAdjMatrix(cor_min = .85)

rownames(CorExNet) <- colnames(CorExNet)

summary(as.matrix(CorEx[,-1]))


CorEx %>% gather("gene","valor",2:ncol(CorEx)) %>% 
  ggplot(aes(valor))+geom_density()
