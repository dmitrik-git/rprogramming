rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available", stringsAsFactors = FALSE)
  
  valid.outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!is.element(outcome, valid.outcomes))
    stop("Wrong outcome!")
  
  ## Return hospital name in that state with lowest 30-day death
  
  ### Null vetor for then function output
  hospitals.state <- c()
  summary <- data.frame()
  
  
  states <- unique(data[,7])
  
  #Heart attacks#
  if (outcome == "heart attack")  {
    subset <- data.frame("Hospital" = data[,2], "State"=data[,7], "Rate"=as.numeric(data[,11]))
  }
  
  #Heart failures#
  if (outcome == "heart failure") {
    subset <- data.frame("Hospital" = data[,2], "State"=data[,7], "Rate"=as.numeric(data[,17]))
  }
  
  #Pneumonia#
  if (outcome == "pneumonia") {
    subset <- data.frame("Hospital" = data[,2], "State"=data[,7], "Rate"=as.numeric(data[,23]))
  }
  
  for (i in states) {
    all.hospitals <- subset[subset$State == i,]
    #Remove empty values#
    #all.hospitals <- subset[complete.cases(subset),]
    hospitals.state <- all.hospitals[order(all.hospitals$Rate, all.hospitals$Hospital, na.last = NA),]

    if (num == "best") {
      newrow <- data.frame ("Hospital" =  hospitals.state[1,1], "State" = i)
    } else if (num == "worst") { 
      newrow <- data.frame ("Hospital" =  hospitals.state[nrow(hospitals.state),1], "State" = i)
    } else {
      newrow <- data.frame ("Hospital" =  hospitals.state[num,1], "State" = i)
    }
    summary <- rbind(summary, newrow)

  }
  
  summary[order(summary$State),]
  
  

  
  
  ## rate
}
