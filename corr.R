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
