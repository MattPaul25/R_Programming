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


