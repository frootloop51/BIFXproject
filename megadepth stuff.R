proj_info <- subset(
  human_projects,
  project == "" & project_type == "data_sources"
)

basename(head(rse_gene_SRP043684$BigWigURL))
