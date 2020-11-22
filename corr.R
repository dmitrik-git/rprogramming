corr <- function(directory, threshold = 0) {
  setwd(paste(Sys.getenv("R_USER"),"RStudio/rprogramming",directory,sep = "/"))
  files <- list.files(full.names = FALSE)
  all.obs <- complete (directory)
  obs.over.threshold <- all.obs[all.obs ["nobs"] > threshold, "id"] 
  result.vector <- numeric(length(obs.over.threshold))
  k <- 1
  for (i in obs.over.threshold) {
    filedata <- read.csv(files[i])
    sulfate <- filedata ["sulfate"]
    nitrate <- filedata ["nitrate"]
    
    result <- cor(sulfate, nitrate, use = "complete.obs")
    result.vector[k] <- result
    k <- k+1
  }
  result.vector
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)

##Quiz questions

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))