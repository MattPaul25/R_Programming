add2Nums <- function(x, y){
         x + y #function returns whatever the last expression
   }

 add2Nums <- function(x, y){
            x + y #function returns whatever the last expression
      }
above10 <- function(x) {
       use <- x > 10
       x[use]
     } 
aboveNum <- function(x, n=10) {
       use <- x > n
       x[use]
     }
columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

#functions in R are created using function directive - and stored like any other R objects
#function directive takes some arguments .. r <- function(arguments){ #do something}
#functions can be passed as arguments to other functions - and functions can be nested - define a funciton in a function
#the return value of a function is always the last one
#functions have named arguments with potential default values (i.e. optional perameters)
#formal arguments are included in the function declaration 
#named arguments allow for non ordinal arguements i.e. sd(na.rm = TRUE, x = mydata) is the same as sd(x = mydata, na.rm = TRUE)
#you can mix positional matching with matching by name - 
# Function can be partially matched - if no exact match it will look for partial match - then it will look for a positional match

#r has something called lazy evaluation - functions are evaluated only as needed
# arguments that arent used are ignored - even in the function declaration
f <- function(a, b){
  a^2
}

# //above funcion does not require a b argument because its not used in the function to return the value
# the ... arguemnt indicate a variable number of arguments that are usually passed on to other funcitons
#... is often used when extending another function and you dont want to copy the entire argument list o fthe original function
#generic functions use ... so that extra args can be passed to methods 

#any arguments after ... - they must be named and cannot be partially matched



# Scoping Rules -  
lm <- function(x) { x * x * x / x } 
#how does R know the difference between built in lm and the lm i just wrote
#R binds the value of a symbol - by searching the a series of environments to find the appropriate value 
#when you are woking on the comand line and need to retrieve the value of an R object the order goes as follows:
# 1. Search the global environment for a symbol name matching the one requested
# 2. Search the namespaces of each of the packages on the search list

# There is a specific order ot the search list
# search() 
# [1] ".GlobalEnv"        "tools:rstudio"     "package:stats"     "package:graphics"  "package:grDevices" "package:utils"     "package:datasets" 
# [8] "package:methods"   "Autoloads"         "package:base"    

#when a user loads a new package - the namespace of that package is put in position 2 - and everything else gets shifted down the list
#r has separate namespaces for functions and non-functions so its possible to have an object named c and a function named c


#scoping rules - make r different from s
#how a value is bound to a free variable in a function
#r usines lexical scoping or static scoping - an alternative to dynamic scoping
#related to scoping rules r uses the search list bound to the symbol

z = 10

f2 <- function(x, y){
  x^2 + y / z
}

#z in the function above is a free variable
#the variables of free variables are searched for in teh environment in which the function was defined
#so if z is in teh environment the above function could work - in the case of the script - this function would work even though z is instantiated
#outside of the function itself
#it first looks for something in global environment - then the parent environment - then the parent environments there after until the top level environment 
#if a function is defined in another environment - 

# Lexical Scoping
# if you cant find a value fo rthe function itself you need to look in the global environment 
# it is possible to return a function within a function --> so the function was definied inside another function 

make.power <- function(n){
  pow <- function(x) {
    x ^n
  }
  pow
  }

#make.power returns a function - so the function must be called in order to access the function pow!
# > x <- make.power(3)
# > x(2)
# [1] 8

# i assign the function result (another function) to x - then i cna use x to return the power function (thats pretty darn nea

y <- 10
f3 <- function (x1) {
    y <- 2
    y^2 + g(x1)
}

g <- function(x) {
    x * y
}

#what is f3(3)?
# lexical: in the g function the value of y is equal to 10 because its in the global environment
# dynamic: in the g function the value of y is equal to 2 because that is the calling environment (dynamic != R scoping)
#scheme, lisp and python are all lexical scoping
#in R all objects must be stored in memory
#all functions must carry a pointer to their respective defining environments, which could be anywhere
#in s-plus free variables are always looked up in the global workspace, so everything can be stored on the disk because the defining environment of all functions is the same


#There are several optimization functions - optim, nlm and optimize - require you to pass a function 

#Dates and Times
#Dates are represented by the date class - 
# Times are are represented by two separate classes POSIXct or the POSIXlt class
#dates are stored as the number of days since 1/1/1970
#times are stored intenrally as the number of seconds since 1/1/1970

basicDateFunc <- function(timeString){
  x <- as.Date(timeString)
}
# d <- basicDateFunc("1970-01-02")
# "1970-01-02" #d not actually a string
# unclass(d)
# [1] 1 - because its 1 day after 1/1/1970

#time:
# posix is a family of standards of how to represent dates and times
#posix ct class stores times  as very large integer under the hood, which is useful when you want to store time in a dataframe
#posix lt is a list underneath and it stores a bunch of other useful information like the day of the week, year, month, day o fthe month

#Some Generic functions that work with dates

# weekdays - returns day of the week
# months - returns the month name
# quarters - returns the quarter number

# as.POSIXlt(x) <- converts to a different time style 
# as.POSIXct(x) <- converts to integer
# x <- sys.time() <- today
# 
# > x <- Sys.time()
# > x
# [1] "2015-02-15 13:38:41 PST"
# > unclass(x)
# [1] 1424036322
# > x <- Sys.time()
# > unclass(x)
# [1] 1424036380
# > y <- as.POSIXlt(x)
# > y
# [1] "2015-02-15 13:39:39 PST"


#strptime function converts date strings into actual times
# 
# > datestring <- c("january 10, 2012 10:40")
# > x <-strptime(datestring, "%B %d, %Y") %B = month
# > x
# [1] "2012-01-10 PST"

