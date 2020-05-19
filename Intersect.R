exprs <- exprs(eset)
exprs_code <- as.data.frame(exprs) %>% 
  mutate(Code = as.numeric(row.names(exprs)))


fData_code <- fData(eset) %>% 
  as.data.frame() %>%
  mutate(Code = as.numeric(row.names(fData(eset))))

ppi_333 <- read.table(file = "333.txt", header = T)

exprs_code %>% 
  left_join(fData_code, by = "Code") %>%
  filter(hugo %in% ppi_333$name) %>%
  nrow()



#DEU 376 ... eita
EXP_PPI <- exprs_code %>% 
  left_join(fData_code, by = "Code") %>%
  filter(hugo %in% ppi_333$name)


EXP_PPI %>%
  select(hugo) %>%
  distinct() %>%
  nrow()

#TEM 279 DISTINTOS

Genes_faltando <- setdiff(as.character(ppi_333$name),EXP_PPI %>%
          select(hugo) %>%
          distinct() %>% pull())
Genes_faltando %>%
  write(file = "Genes_faltando.txt")


##### Genes faltando ####

Generest <- read.table(file = "genes_falt_conv.txt", header = T, sep = "\t")


exprs <- exprs(eset)
exprs_code2 <- as.data.frame(exprs) %>% 
  mutate(Code = as.numeric(row.names(exprs)))

fData_code2 <- fData(eset) %>% 
  as.data.frame() %>%
  mutate(Code = as.numeric(row.names(fData(eset))))


fData_code2 <- read.csv(file = "fData_code2_semp.txt", sep = "\t")

exprs_code2 %>% 
  left_join(fData_code2, by = "Code") %>%
  filter(refseq %in% Generest$To)

  
EXP_PPI2 <- exprs_code2 %>% 
  left_join(fData_code2, by = "Code") %>%
  filter(refseq %in% Generest$To)

EXP_PPI2 %>%
  select(hugo) %>%
  distinct() %>%
  nrow()


InterGenes <- bind_rows(EXP_PPI,EXP_PPI2)

InterGenes %>%
  select(hugo) %>%
  distinct() %>%
  nrow()

names(InterGenes)[1:42] <- colnames(inf_total)

inf_total <- inf_total %>% 
  as.data.frame() %>%
  mutate(Code = as.numeric(row.names(inf_total)))


hugo_code <- read.csv(file = "hugo_code.txt", sep = "\t")


inf_total2 <- inf_total %>%
  left_join(hugo_code, by = "Code") %>%
  filter(Code %in% inf_total$Code)




inf_total2 %>%
  select(Code) %>%
  distinct() %>%
  nrow()

inf_total2 %>%
  group_by(hugo) %>%
  tally() %>%
  write.table(file = "hugo_inf.tsv")

inf_total2_hugo <- inf_total2$hugo

inf_total2$Code <- NULL
inf_total2$hugo <- NULL


MatrizExpress <- as.data.frame(t(inf_total2))

colnames(MatrizExpress) <- as.character(inf_total2_hugo)


write.table(x = row.names(MatrizExpress), file = "nomesMatrizExpress.txt")
