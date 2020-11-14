complete <- function(directory, id = 1:332) {
  ##data <- data.frame(id, nobs)
  wd <- getwd() 
  setwd(paste(wd,directory,sep = "/"))
  files <- list.files(full.names = FALSE)
  for (i in id) {
    filedata <- read.csv(files[i])
    ##data[i,id, nobs] <- c(files[i], sum(complete.cases(filedata)))
    data[i] <- data.frame(id=max(filedata["ID"]), nobs=sum(complete.cases(filedata)))
  }
    setwd (wd)
    data
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))

data <- data.frame()
data[1,1] <- c("2")
data[1,2] <- c("5")

filedata <- read.csv("072.csv")
c("72", sum(complete.cases(filedata)))
c
?data.frame

a=complete.cases(data)
a
data[a]
getwd()
setwd("C:/Users/dmitri.kovagin/Documents/RStudio/rprogramming")
setwd("C:/Users/dmitri.kovagin/Documents/RStudio/rprogramming/specdata")
data
sum(!a)
data[1,1:2] <- c(3, 33)