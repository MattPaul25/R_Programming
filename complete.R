complete <- function(directory, id = 1:332) {
  table.completion <- data.frame(foo=c(), bar=c())
 
  for (i in id){
    digadd <- substr("/00", 1, 3 - ((nchar(i)) - 1))
    df <- read.csv(paste0(directory, digadd, i, ".csv"))   
    myRow = c(i, NROW(df[complete.cases(df),]))
    table.completion <- rbind(table.completion, myRow)
}
colnames(table.completion)[1] <- "id"
colnames(table.completion)[2] <- "nob"
table.completion
}