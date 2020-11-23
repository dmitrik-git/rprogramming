rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available", stringsAsFactors = FALSE)
  
  ## Check that state and outcome are valid
  valid.states <- unique(data[,7])
  if (!is.element(state, valid.states))
    stop("Wrong state!")
  
  valid.outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!is.element(outcome, valid.outcomes))
    stop("Wrong outcome!")
  
  ## Return hospital name in that state with lowest 30-day death
  
  ### Null vetor for then function output
  hospital <- c()
  
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
  
  all.hospitals <- subset[subset$State == state,]
    #Remove empty values#
  all.hospitals <- all.hospitals[complete.cases(all.hospitals),]
  
  hospital <- all.hospitals[order(all.hospitals$Rate, all.hospitals$Hospital),]
  
  if (num == "best") {
    hospital[1,1]
  } else if (num == "worst") { 
    hospital[nrow(hospital),1]
    } else {
      hospital[num,1]
      }
  
  
  ## rate
}
