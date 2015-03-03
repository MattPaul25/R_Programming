
simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

rankall <- function(outcome, num = "best") {
  outcome = simpleCap(outcome)
  NewOutCome <- gsub(" ", ".", paste0("Hospital.30.Day.Death..Mortality..Rates.from.", outcome))
  HospitalData <- read.csv("outcome-of-care-measures.csv")
  
  
  Result <- data.frame("hospital" = character(54), "state" = character(54), stringsAsFactors = FALSE)
  #check that is a valid run
  if(!(NewOutCome %in% colnames(HospitalData))) stop("invalid outcome")
  
  splitData <- split(HospitalData, HospitalData$State) 
  i <- 1 
  for (state in splitData) {
    state <- as.data.frame(state) 
    dfha <- as.numeric(as.character(state[,NewOutCome]))
    dfha <- as.factor(dfha)
    dfname <- as.character(state[, 2])[!is.na(dfha)]
    dfrate <- as.numeric(as.character(state[,NewOutCome]))[!is.na(dfha)]     
    dfslim <- data.frame(dfname = dfname, dfrate = dfrate, stringsAsFactors = FALSE)
    ordered <- dfslim[order(as.numeric(as.character(dfrate)), as.character(dfname)), ] 
    
    if (num == "worst") {
      num1 <- length(ordered$dfname)
    }
    else if (num == "best") {
      num1 <- 1
    } else {
      num1 <- num
    }
    namelist <- as.vector(ordered$dfname)
    minname <- namelist[num1]
    
    Result$hospital[i] <- as.character(minname) 
    Result$state[i]    <- as.character(state$State)[1] 
    i <- i + 1
  }
  
  
  Result
  
}