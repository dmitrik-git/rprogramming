complete <- function(directory, id = 1:332) {
  wd <- getwd() 
  setwd(paste(wd,directory,sep = "/"))
  files <- list.files(full.names = FALSE)
  v <- numeric(length(id))
  k <- 1
    for (i in id) {
    filedata <- read.csv(files[i])
    row.of.df <- sum(complete.cases(filedata))
    v[k] <- row.of.df
    k <- k+1
    }
    setwd (wd)
    data <- data.frame (id, nobs = v)
    data
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

