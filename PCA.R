PCA1 <- prcomp(MatrizExpress,scale. = T)

factoextra::fviz_pca_biplot(PCA1,
                            addEllipses = TRUE, # Concentration ellipses
                            ellipse.type = "confidence",
                            legend.title = "Groups")#biplot
fviz_screeplot(PCA1)
fviz_pca_ind(PCA1)
fviz_pca_biplot(PCA1)
  