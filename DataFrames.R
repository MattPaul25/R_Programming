#Data frames are used to store tabular Data
#they are represented as special type of list where every element of the list has to have some length
#Each element of the list can be though of as a column and the the langeth of each element of the list is the number of rows
#Unlike matrices, data frames can store different classes of objects in each columns (like lists);
#matrices must have every element be the same class (or type)
#Data frames also have a special attribute called row.names
#Data frames are usally created by calling read.table() or read.csv()
#Can be converted to a matrix by call data.matrix()

x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
x
#  foo   bar
# 1   1  TRUE
# 2   2  TRUE
# 3   3 FALSE
# 4   4 FALSE
nrow(x)
#[1] 4
ncol(x)
#[1] 2
