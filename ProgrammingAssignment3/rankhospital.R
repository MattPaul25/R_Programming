simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

rankhospital <- function(state, outcome, num = "best") {
  outcome = simpleCap(outcome)
  NewOutCome <- gsub(" ", ".", paste0("Hospital.30.Day.Death..Mortality..Rates.from.", outcome))
  HospitalData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  HospitalData <- HospitalData[ which(HospitalData$State == state),]
  if(nrow(HospitalData)<1) stop("invalid state")
  if(!(NewOutCome %in% colnames(HospitalData))) stop("invalid outcome")
  HospitalData <- HospitalData[ HospitalData[NewOutCome] != "Not Available",]
  myhd <- HospitalData[,c("Provider.Number", "Hospital.Name", NewOutCome)]
  names(myhd)[3]<-"Rate"
  ranked <- myhd[order(myhd["Rate"]), ] 
  ranked["Rank"]<-seq.int(nrow(ranked))
  
  if (num == "worst") {
    num <- length(ranked$Hospital.Name)
  }
  else if (num == "best") {
    num <- 1
  }
  
  ranked <- ranked[num,2]
  }