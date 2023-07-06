install.packages("keras")
library(keras)
library(tensorflow)
tf$constant("Hello Tensorflow!")


CancerFinal <- read.csv("C:/Users/ianla.000/Downloads/data.csv")
CancerFinal
str(CancerFinal)
summary(CancerFinal)


install.packages("dplyr")
library(dplyr)
CancerFinal <- select(CancerFinal, -X)

test <- CancerFinal

test$diagnosis <- ifelse(test$diagnosis == 'M', 1, 0) 
str(test)


normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x))) } #normalized data using the technique taught in the lecture slides.
CancerNorm <- test
CancerNorm <- as.data.frame(lapply(CancerNorm, normalize))
summary(CancerNorm)

CancerTensor <- as.matrix(CancerNorm)

dimnames(CancerTensor)=NULL
