##Matrices are vectors with a dimension attribute - 
##the dimension attribute is itself an integer vecotr 
##of length 2(nrow =2, n col = 3)

m <- matrix(nrow = 2, ncol = 3)

##     [,1] [,2] [,3]
##[1,]   NA   NA   NA
##[2,]   NA   NA   NA

dim(m) 
## [1] 2 3

## attributes returns a list one being a dimension 
attributes(m)
##$dim
##[1] 2 3


##without dimension m R assumes we mean one column and multiple rows
m <- matrix(1:6)
m

##     [,1]
##[1,]    1
##[2,]    2
##[3,]    3
##[4,]    4
##[5,]    5
##[6,]    6

#matrix 2 rows, 3 columns
newMatrix <- matrix(1:6, 2, 3)
##     [,1] [,2] [,3]
##[1,]    1    3    5
##[2,]    2    4    6


## how to convert a vector into a matrix
 someVector <- 1:10
 ##[1]  1  2  3  4  5  6  7  8  9 10

dim(someVector) <- c(2,5) #3 assignes a vector to the dimensions of some vector
##     [,1] [,2] [,3] [,4] [,5]
##[1,]    1    3    5    7    9
##[2,]    2    4    6    8   10


##Binding Columns and Binding Rows
##cbinding and rbinding
 x <- 1:3
 y <- 10:12


cbind(x, y) ## column bind
 ##    x  y
##[1,] 1 10
##[2,] 2 11
##[3,] 3 12


rbind(x, y) ## row bind
 ## [,1] [,2] [,3]
##x    1    2    3
##y   10   11   12
