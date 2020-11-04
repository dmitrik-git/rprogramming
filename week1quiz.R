##Useful resource
# https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-extractOperator.md

data <-read.csv("hw1_data.csv")
theCols<- c("Ozone","Temp","Solar.R")
#data[,theCols]

##Question 18
a=data[data$Ozone > 31 & data$Temp > 90,"Solar.R"]
a1=complete.cases(a)
mean(a[a1])

##Question 19
b=data[data$Month == 6,"Temp"]
##b1=complete.cases(b)
##mean(b[b1])
mean(b)

##Question 20
c=data[data$Month == 5,"Ozone"]
c1=complete.cases(c)
max(c[c1])

