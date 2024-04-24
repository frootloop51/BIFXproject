browseVignettes("recount3")

library("recount3")
library("recount")
library("megadepth")


?scale_counts
?transform_counts

?get_coverage
?coverage_matrix
?read_coverage


human_projects <- available_projects()
#> 2023-05-07 18:00:51.140427 caching file sra.recount_project.MD.gz.
#> 2023-05-07 18:00:51.580698 caching file gtex.recount_project.MD.gz.
#> 2023-05-07 18:00:51.839908 caching file tcga.recount_project.MD.gz.

## Find the project you are interested in,
## here we use SRP009615 as an example
proj_info <- subset(
  human_projects,
  project == "SRP009615" & project_type == "data_sources"
)


rse_gene_SRP009615 <- create_rse(proj_info)

rse_gene_SRP009615


assay(rse_gene_SRP009615, "counts") <- transform_counts(rse_gene_SRP009615)

assay(rse_gene_SRP009615, "counts")


#Use transform_counts from recount3. According to documentation this function
#is similar to recount::scale_counts() but more general and with a different name to avoid NAMESPACE conflicts.

#shows that only raw_counts exists before transformation
rse_gene_SRP043684

#performs transformation
assay(rse_gene_SRP043684, "counts") <- transform_counts(rse_gene_SRP043684)

#shows that there is now raw_counts and counts 
rse_gene_SRP043684





























2) What are the goals of your piece of the pipeline? What will you accomplish?
  3) Why is your part of the pipeline important? What will users learn about the biology of the gene/transcript that you are examining?
  4) How will your piece of the pipeline fit with the rest -- what are your inputs and outputs?
  5) What strategy/workflow will you use to implement your part of the pipeline? 
  6) What databases/tools/techniques will you use? Please cite them at the end of the document.
7) What challenges do you forsee and how will you address them? 
  
  
  
  "C:\Users\ianla.000\Documents\bifxproject\SRP043684\bw\SRR1501367.bw"


# Base path that remains constant
base_path <- "C:/Users/ianla.000/Documents/bifxproject/SRP043684/bw/"


srr_ids <- c("SRR1501367", "SRR1501368", "SRR1501369")  # Add as many SRR IDs as needed

# Loop through each SRR ID
for(srr_id in srr_ids) {
  # Construct the full file path
  file_path <- paste0(base_path, srr_id, ".bw")
  
  # Print the file path or replace this with your operation of choice
  print(file_path)
  
  
  
  csv_data <- read.csv("path/to/your/file.csv", header=TRUE)
  
  # Optional: reorder or select columns to match the BED format
  annotation_file_BED <- csv_data[, c("chrom", "start", "end", "strand")]
  
  # Write to BED file
  write.table(bed_data, "output.bed", sep="\t", col.names=FALSE, row.names=FALSE, quote=FALSE)
  
  
  # Vector of identifiers for the files you want to process
  identifiers <- c("SRR1501367", "SRR1501368", "SRR1501369") # Add more as needed
  
  # Path to the annotation file (assumed constant for this example)
  annotation_file <- "C:/Users/ianla.000/Documents/bifxproject/annotation_file.bed"
  
  # Initialize a list to store coverage results (optional)
  coverage_results <- list()
  
  # Loop over each identifier
  for (id in identifiers) {
    # Construct the file path for the current .bw file
    bw_file_path <- sprintf("C:/Users/ianla.000/Documents/bifxproject/SRP043684/bw/%s.bw", id)
    
    # Calculate coverage
    current_cov <- get_coverage(
      bw_file_path,
      op = "mean",
      annotation = annotation_file
    )
    
    # Optionally store the result in the list with the identifier as the name
    coverage_results[[id]] <- current_cov
    
    # If you want to print or do something with current_cov immediately, you can do it here
    # For example, to display the coverage:
    print(current_cov)
  }
  
  # If you stored results, you can access them like this:
  # coverage_results[["SRR1501367"]]
  
  
  # Base path
  base_path <- "C:/Users/ianla.000/Documents/bifxproject/SRP043684/bw/"
  
  
  identifiers <- c("SRR1501382", "SRR1501381", "SRR1501380","SRR1501379", "SRR1501378", "SRR1501377", "SRR1501376"
                   , "SRR1501375", "SRR1501374", "SRR1501373", "SRR1501372", "SRR1501371", "SRR1501370", "SRR1501369"
                   , "SRR1501368", "SRR1501367", "SRR2173891", "SRR2173892")
  
  
  # Loop through each identifier
  for (id in identifiers) {
    # Construct the file path
    file_path <- paste0(base_path, id, ".bw")
    
    # Assuming 'get_coverage' and 'annotation_file' are defined
    # Perform the operation
    bw_cov <- get_coverage(
      file_path,
      op = "mean",
      annotation = annotation_file
    )
    
    # Dynamically create a variable name based on the identifier
    var_name <- paste0("bw_cov_", id)
    
    # Assign the result to the dynamically named variable
    assign(var_name, bw_cov)
  }
  
  
  # Combine the GRanges objects
  combinedGR <- c(gr1, gr2, gr3)
  
  # View the combined GRanges object
  combinedGR
  
  
  # Assuming grangesObject contains coverage scores
  coverageTrack <- DataTrack(range = grangesObject, type = "h", name = "Coverage")
  
  # Optionally, add additional tracks (e.g., gene annotations)
  annotationTrack <- AnnotationTrack(genome = "hg19", chromosome = "chr1")
  
  # Plot the tracks
  plotTracks(list(annotationTrack, coverageTrack), from = 1, to = 1000000)
  
  current_cov <- get_coverage(
    bw_file_path,
    op = "mean",
    annotation = annotation_file
  )
  
  # Optionally store the result in the list with the identifier as the name
  coverage_results[[id]] <- current_cov
  
  # If you want to print or do something with current_cov immediately, you can do it here
  # For example, to display the coverage:
  print(current_cov)
}

# If you stored results, you can access them like this:
# coverage_results[["SRR1501367"]]



# source for BED table info https://support.bioconductor.org/p/9145748/