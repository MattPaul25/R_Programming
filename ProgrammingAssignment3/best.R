
# plotData <- function(){
#   outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#   head(outcome)
#   outcome[, 11] <- as.numeric(outcome[, 11])
#   hist(outcome[, 11])
# }

simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

best <- function(state, outcome){
  outcome = simpleCap(outcome)
  NewOutCome <- gsub(" ", ".", paste0("Hospital.30.Day.Death..Mortality..Rates.from.", outcome))
  HospitalData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  HospitalData <- HospitalData[ which(HospitalData$State == state),]
  if(nrow(HospitalData)<1) stop("invalid state")
  if(!(NewOutCome %in% colnames(HospitalData))) stop("invalid outcome")
  HospitalData <- HospitalData[ HospitalData[NewOutCome] != "Not Available",]
  myhd <- HospitalData[,c("Hospital.Name", NewOutCome)]
  minimum <- min(as.numeric(myhd[,2]))
  minimum <- as.character(minimum)
  
  if(!grepl( '\\.', minimum)){
    minimum <- paste0(minimum, ".0")
  }
  myhd <- myhd[myhd[NewOutCome] == minimum][1]  
}