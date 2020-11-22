best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  valid.states <- unique(data[,7])
  if (!is.element(state, valid.states))
    stop("Wrong state!")
  
  valid.outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!is.element(outcome, valid.outcomes))
    stop("Wrong outcome!")
  
  ## Return hospital name in that state with lowest 30-day death
  subset <- data.frame("Hospital" = data[,2], "State"=data[,7], "HA"=as.numeric(data[,11]), "HF"=as.numeric(data[,17]), "P"=as.numeric(data[,23]))

  hospital <- c()
  
  #Heart attacks#
  if (outcome == "heart attack")  {
    min.value <- min(subset[subset$State == state,"HA"], na.rm = TRUE)
    all.hospitals <- subset[subset$HA == min.value & subset$State == state,]
    all.hospitals <- all.hospitals[complete.cases(all.hospitals),]
    hospital <- sort(all.hospitals$Hospital)
    
  }
  
  #Heart failures#
  if (outcome == "heart failure") {
    min.value <- min(subset[subset$State == state,"HF"], na.rm = TRUE)
    all.hospitals <- subset[subset$HF == min.value & subset$State == state,]
    all.hospitals <- all.hospitals[complete.cases(all.hospitals),]
    hospital <- sort(all.hospitals$Hospital)
    
    
  }
  
  #Pneumonia#
  if (outcome == "pneumonia") {
    min.value <- min(subset[subset$State == state,"P"], na.rm = TRUE)
    all.hospitals <- subset[subset$P == min.value & subset$State == state,]
    all.hospitals <- all.hospitals[complete.cases(all.hospitals),]
    hospital <- sort(all.hospitals$Hospital)
  }
  
  hospital[1]

  ## rate
}
