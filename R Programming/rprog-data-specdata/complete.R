complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #n <- matrix(ncol=2,nrow=length(id),dimnames=list(1:length(id),c("id","nobs")))
  n <- data.frame()
  j <- 1
  
  for(i in id){
    fn <- sprintf("%03d.csv",i)
    f <- file.path(directory,fn)
    d <- read.csv(f)
    
    d <- d[!is.na(d$sulfate) & !is.na(d$nitrate),]
    c <- length(d[,1])
    
    n <- rbind(n,c(i,c))
    
    j <- j + 1
  }
  names(n) <- c("id","nobs")
  n
}