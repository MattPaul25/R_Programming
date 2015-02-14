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