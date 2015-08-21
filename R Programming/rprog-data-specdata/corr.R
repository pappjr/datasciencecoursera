corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  comp <- complete(directory)
  keep <- comp[,2] > threshold
  fs <- list.files(directory)
  fs <- fs[keep]
  
  n <- vector(mode="numeric", length=0)
  
  for(i in fs){
    f <- file.path(directory,i)
    d <- read.csv(f)
  
    n <- rbind(n,cor(d$sulfate,d$nitrate, use="complete.obs"))
    
  }
  
  n
}