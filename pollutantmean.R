pollutantmean <- function(directory, pollutant, id = 1:332) {
  myCount <- 0
  mySum <- 0
  for (i in id){     
         digadd <- substr("/00", 1, 3 - ((nchar(i)) - 1))
         df <- read.csv(paste0(directory, digadd, i, ".csv"))
         myVector <- df[[pollutant]] 
         myCount <- myCount + sum(myVector[!is.na(myVector)] > 0)
         mySum <- mySum + sum(myVector[!is.na(myVector)])         
    } 
  myResult <- (mySum / myCount)
}