setwd("C:/Users/guilh/Desktop/Proj1/Output/Listas")
## lista dos diff em geral
write.table(x = DE_tables_Diff$OB$hugo,file = "OB_Diff.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(x = DE_tables_Diff$ADP$hugo,file = "ADP_Diff.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(x = DE_tables_Diff$CD$hugo,file = "CD_Diff.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

##### EXPORT LISTA DOS GENES DE 7 E 14 DIAS #####

write.table(x = ADP_DE$Day_7 ,file = "ADP_DAY7.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(x = ADP_DE$Day_14 ,file = "ADP_DAY14.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(x = OB_DE$Day_7 ,file = "OB_DAY7.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(x = OB_DE$Day_14 ,file = "OB_DAY14.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(x = CD_DE$Day_7 ,file = "CD_DAY7.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(x = CD_DE$Day_14 ,file = "CD_DAY14.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)



##### GMT #####
write.table(x = as.character(ADP_DE$Day_7),file = "GMT/adp_7_diff.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = as.character(ADP_DE$Day_14),file = "GMT/adp_14_diff.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = as.character(OB_DE$Day_7),file = "GMT/ob_7_diff.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = as.character(OB_DE$Day_14),file = "GMT/ob_14_diff.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = as.character(CD_DE$Day_7),file = "GMT/cd_7_diff.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = as.character(CD_DE$Day_14),file = "GMT/cd_14_diff.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)

write.table(x = DE_tables_7$ADP,file = "GMT/adp_diff_7.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = DE_tables_7$OB,file = "GMT/ob_diff_7.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = DE_tables_7$CD,file = "GMT/cd_diff_7.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = DE_tables_14$ADP,file = "GMT/adp_diff_14.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = DE_tables_14$OB,file = "GMT/ob_diff_14.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
write.table(x = DE_tables_14$CD,file = "GMT/cd_diff_14.txt",sep = "\t",row.names = FALSE, quote = FALSE, col.names = TRUE)
