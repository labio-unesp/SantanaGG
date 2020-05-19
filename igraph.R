library (igraph)


graf <- graph_from_adjacency_matrix(adjmatrix = as.matrix(CorExNet),mode = "undirected")

plot(graf)


tibble_graf <- tibble(Gene = names(degree(graf)),Degree = degree(graf)) %>%
  mutate(Hub = ifelse(Degree >=5,yes = "Hub","no hub")) %>%
  mutate(Gene = str_replace(Gene,pattern = " ", replacement = "")) %>%
  arrange(desc(Degree))

tibble_graf %>%
  ggplot(aes(Degree)) +
  geom_density()

tibble_graf %>%
  group_by(Hub) %>%
  tally()
