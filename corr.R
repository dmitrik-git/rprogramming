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

all.obs <- complete ("specdata")
obs.over.threshold <- 
  aa <- all.obs ["nobs"] > 0
  all.obs[aa, "id"] 
files <- list.files(full.names = FALSE)
filedata <- read.csv(files[2])
sulfate <- filedata ["sulfate"]
nitrate <- filedata ["nitrate"]
sulfate
nitrate
cor(sulfate, nitrate, use = "complete.obs")

dir <- identical (getwd(), "~/rprogramming")
dir
setwd("C:/Users/dmitri.kovagin/Documents/RStudio/rprogramming/specdata")
Sys.getenv("R_USER")
a <- complete ("specdata")
b <- a ["nobs"] > 1000
b
a[a ["nobs"] > 1000] 
a[154,]
?cor

vv <- numeric (3)
vv[1]<- 3
vv[3] <- 6
vv