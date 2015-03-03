#apply functions , lapply, sapply, tapply, apply, mapply

#lapply takes three arguments (a list, a function, ...)


x <- list(a = 1:5, b = rnorm(10))
y <- list(a= 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))

#function returns the lapply result on list - it returns a list as well
getMean <- function(Somelist){
lapply(Somelist, mean)
}

#runif generates a bunch of random variables
# x <- 1:4
# > lapply(x, runif)

# runif(number, min, max) <- args

# > runif(1, 1, 10)
# [1] 3.165329

#apply function(X, Margin, Fun, ....)]

# X is an array
# Margin is an integer vector indicating which margins should be 'retained'
#  - in a matrix you decide with 1 if you are choosing apply on columns or rows
# Fun i s afunction
# ... are the arguments to be passed to FUN

# if x is a matrix then apply(x, 1, mean) would return the mean on each column (with 2 as second arg it would do it on each row)

# another example of apply
# apply(x, 1, quantile, probs = c(.25, .75))
# returns matrix with 2 by 20


#mapply is a multivariate apply of sorts which applies a function in paral;lel over a set of arguments
#handles multiple lists
# function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)  

# mapply(rep, 1:4, 4:1) == list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))


# tapply is used to apply a function over subsets of a vector. tapply has know name meaning
# function (X, INDEX, FUN = NULL, ..., simplify = TRUE) 
# 
# x <- c(rnorm(10), runif(10), rnorm(10,1))
# g <- gl (3,10)
# tapply(x, g, mean)
# 1         2         3 
# 0.2955129 0.4905428 1.1983203


#split
#split creates multiple vectors from one based on an index in this case g
#  x <- c(rnorm(10), runif(10), rnorm(10,1))
#  g <- gl (3,10)
#  split(x,g) #<- always returns list back

#split works with lapply -- like so
# lapply(split(x,g), mean)




