data <-read.csv("hw1_data.csv")
theCols<- c("Ozone","Temp","Solar.R")
#data[,theCols]

a=data[data$Ozone > 41 & data$Temp > 67,"Solar.R"]
mean(a)


