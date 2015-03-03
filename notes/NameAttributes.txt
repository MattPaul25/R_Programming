#R objects can also have names, which is very useful for writing readable code and self describing objects

x <- 1:3
x
#[1] 1 2 3
names(x)
#NULL
names(x) <- c("foo", "bar", "norf")
x
 #foo  bar norf 
 #  1    2    3 
names(x)
#[1] "foo"  "bar"  "norf"


#Lists can have names as well

x <- list(a = 1, b = 2, c=3)
x

#$a
#[1] 1

#$b
#[1] 2

#$c
#[1] 3


# Matrices can also have names 

> m <- matrix(1:4, nrow = 2, ncol = 2)
> m
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> dimnames(m) <- list(c("a", "b"), c("c", "d"))
> m
  c d
a 1 3
b 2 4
> 