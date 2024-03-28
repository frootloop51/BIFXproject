#.libPaths()


#if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
#}

#BiocManager::install("recount3", force = TRUE)

## Check that you have a valid Bioconductor installation
#BiocManager::valid()


#library("recount3")


human_projects <- available_projects()
#> 2023-05-07 18:01:01.66662 caching file sra.recount_project.MD.gz.
#> 2023-05-07 18:01:01.898517 caching file gtex.recount_project.MD.gz.
#> 2023-05-07 18:01:02.122462 caching file tcga.recount_project.MD.gz.
dim(human_projects)
#> [1] 8742    6
head(human_projects)
#>     project organism file_source     project_home project_type n_samples
#> 1 SRP107565    human         sra data_sources/sra data_sources       216
#> 2 SRP149665    human         sra data_sources/sra data_sources         4
#> 3 SRP017465    human         sra data_sources/sra data_sources        23
#> 4 SRP119165    human         sra data_sources/sra data_sources         6
#> 5 SRP133965    human         sra data_sources/sra data_sources        12
#> 6 SRP096765    human         sra data_sources/sra data_sources         7

## Select a study of interest
project_info <- subset(
  human_projects,
  project == "SRP009615" & project_type == "data_sources"
)
project_info
#>        project organism file_source     project_home project_type n_samples
#> 1838 SRP009615    human         sra data_sources/sra data_sources        12


subset(human_projects, file_source == "gtex" & project_type == "data_sources")

project_info[, c("project", "organism", "project_home")]



rse_gene_SRP009615 <- create_rse(project_info)


rse_gene_SRP009615


metadata(rse_gene_SRP009615)


## Sample metadata
recount3_cols <- colnames(colData(rse_gene_SRP009615))


length(recount3_cols)


head(recount3_cols)


recount3_cols_groups <- table(gsub("\\..*", "", recount3_cols))


recount3_cols_groups[recount3_cols_groups > 1]


recount3_cols_groups[recount3_cols_groups == 1]

recount3_cols

project_info2 <- subset(
  human_projects,
  project == "SRP043684" )
