ADP1 <- TABLES$ADP %>%
  mutate(Cond7 = ifelse(P.Value < 0.01 & A7 > log2(2),"Up",
                        ifelse(P.Value < 0.01 & A7 < -log2(2),"Down","ns")),
         Cond14 = ifelse(P.Value < 0.01 & A14 > log2(2),"Up",
                         ifelse(P.Value < 0.01 & A14 < -log2(2),"Down","ns")))
ADP1 <- ADP1 %>%
  select(hugo, Cond7,Cond14)

ADP1 <- ADP1 %>%
  gather(key = "Day","Cond",2:3)

ADP1 <- ADP1 %>%
  mutate(Tecido = "ADP")


OB1 <- TABLES$OB %>%
  mutate(Cond7 = ifelse(P.Value < 0.01 & O7 > log2(2),"Up",
                        ifelse(P.Value < 0.01 & O7 < -log2(2),"Down","ns")),
         Cond14 = ifelse(P.Value < 0.01 & O14 > log2(2),"Up",
                         ifelse(P.Value < 0.01 & O14 < -log2(2),"Down","ns")))
OB1 <- OB1 %>%
  select(hugo, Cond7,Cond14)

OB1 <- OB1 %>%
  gather(key = "Day","Cond",2:3)

OB1 <- OB1 %>%
  mutate(Tecido = "OB")

CD1 <- TABLES$CD %>%
  mutate(Cond7 = ifelse(P.Value < 0.01 & C7 > log2(2),"Up",
                        ifelse(P.Value < 0.01 & C7 < -log2(2),"Down","ns")),
         Cond14 = ifelse(P.Value < 0.01 & C14 > log2(2),"Up",
                         ifelse(P.Value < 0.01 & C14 < -log2(2),"Down","ns")))
CD1 <- CD1 %>%
  select(hugo, Cond7,Cond14)

CD1 <- CD1 %>%
  gather(key = "Day","Cond",2:3)

CD1 <- CD1 %>%
  mutate(Tecido = "CD")


CondTotal <- ADP1 %>%
  bind_rows(OB1)

CondTotal <- CondTotal %>%
  bind_rows(CD1)

CondTotal <- CondTotal %>%
  mutate(Dia = ifelse(Day == "Cond7",7,14))

CondTotal <- CondTotal %>%
  select(-Day)


#CondTotal %>%
ggplot(aes(x = Dia, y = Cond, col = hugo)) +
  geom_line(aes(linetype = Tecido)) +
  facet_wrap(~Tecido) +
  scale_x_continuous(breaks = c(0,7,14))

CondTotal2 <- CondTotal %>%
  select(hugo, Tecido) %>%
  distinct() %>%
  mutate(Cond = "ns",Dia = 0)

CT <- CondTotal %>%
  bind_rows(CondTotal2)

CT %>%
  filter(Tecido == "ADP") %>%
  filter(hugo %in% PPI_cluster$Gene) %>%
  ggplot(aes(x = Dia, y = Cond, col = hugo)) +
  geom_line(aes(group = hugo)) +
  facet_wrap(~hugo) + 
  scale_x_continuous(breaks = c(0,7,14))

CT %>%
  filter(hugo == "MYD88") %>%
  ggplot(aes(x = Dia, y = Cond, col = Tecido)) +
  geom_line(aes(group = hugo)) +
  facet_wrap(~Tecido) + 
  scale_x_continuous(breaks = c(0,7,14))


##### Summary ####
CT %>%
  group_by(Cond, Tecido) %>%
  tally()
