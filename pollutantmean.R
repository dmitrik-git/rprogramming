pollutantmean <- function (directory, pollutant, id = 1:332) {
  setwd(paste(Sys.getenv("R_USER"),"RStudio/rprogramming",directory,sep = "/"))
  files <- list.files(full.names = FALSE)
  data <- data.frame()
  datai <- data.frame() 
  for (i in id) {
    datai <-read.csv(files[i])
    data <- rbind (data, datai)
  }
  mean(data[,pollutant], na.rm = TRUE)

}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

##Quiz question
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")