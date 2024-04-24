library(GenomicRanges)
browseVignettes("GenomicRanges")

#####################################################

# Step One: Inputting the Regions to be tested for DE Through Creation of GenomicRanges Object

# load the necessary packages needed to complete the differential expression analysis
library(GenomicRanges)
library(recount)
library(DESeq2)

# It is important to note that the coordinates in recount are from the hg38 assembly. If yours are assembly hg19,
# be sure to convert them to hg38. The UCSC Genome Browser has created a great utility for converting coordinates 
# between assemblies.  The link to the converter can be found here: https://genome.ucsc.edu/cgi-bin/hgLiftOver. 

# Create a GenomicRanges object of the putative regions
# This is equivalent to expressed_regions(), which is used to define a set of regions based on the mean bigWig file for a given project
# read in the file that contains the information necessary to create the GRanges object
region_info <- read.csv("putative_region_info_for_GRanges.csv", header= TRUE, sep = ",")

# variables for each of the GRanges components- creating the GenomicRanges object is the alternative to 
# using the 'expressed_regions' function in recount

# start and stop positions
# start positions
start_pos <- region_info$start

# end positions
end_pos <- region_info$end

# seqnames
seqnames <- rep(as.character(region_info$seqnames,length.out= length(start_pos)))

# strand
strand <- rep(as.character(region_info$strand,length.out= length(start_pos)))

# Use the variables created above to create the GRanges object
granges_putative_exons <- GRanges(seqnames= seqnames,ranges=IRanges(start= start_pos,end=end_pos),strand= strand)

# Convert the GenomicRanges object to a dataframe
# Make the rownames of the dataframe reflect the region (chr#: coordinates_strand) to be used when creating coverage matrix

#####################################################

# Step Two: Calculating coverage of the desired regions, scaling the counts, adding necessary colData, and combining
# all of the coverage matrices

# Load in the recount project to be used in the differential expression analysis

if(!file.exists(file.path("SRP043684", "rse_gene_SRP043684.Rdata"))) {
  download_study("SRP043684", type = "rse-gene")
}

# Check that the file was downloaded using the file.exists() function
file.exists(file.path("SRP043684", "rse_gene_SRP043684.Rdata"))

load(file.path("SRP043684", "rse_gene_SRP043684.Rdata"))

rse_gene_SRP043684 <- rse_gene

##################################################

# Calculate the coverage over the putative regions (using coverage_matrix() function in recount)

# Vector of chromosome names. This will be used to help the for loop target the data it must process.
chromosomes <- c("chr1", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16")

# Create an empty list to store coverage matrices objects
coverage_matrices <- list() 

# Iterate over each chromosome and create coverage matrix which is then added to the coverage_matries list
for (chromosome in chromosomes) {
  coverage_matrices[[chromosome]] <- coverage_matrix("SRP043684", chromosome, granges_putative_exons,
                                                     verboseLoad = FALSE, scale = FALSE)}
#######################################################  
  
# Define a function to scale counts for a single coverage matrix
  scale_matrics <- function(matrix) {
    matrix_sc <- scale_counts(matrix)
    return(scaled_matrix)
  }
  
# Iterate over the list of coverage matrices and apply scaling
  matrix_scale <- lapply(coverage_matrices, scale_matrices)
