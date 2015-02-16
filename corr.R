corr <- function(directory, threshold = 0) {
id <- 1:332
theVector <- c()
  
for (i in id){
  digadd <- substr("/00", 1, 3 - ((nchar(i)) - 1))
  df <- read.csv(paste0(directory, digadd, i, ".csv"))  
  df <- df[complete.cases(df),]
  if(NROW(df) > 0){
      if(NROW(df) >= threshold){     
            theCorrelation <-  cor(df["nitrate"], df["sulfate"])
            theVector <- c(theVector, theCorrelation)
          }
      }
  }
theVector
}
