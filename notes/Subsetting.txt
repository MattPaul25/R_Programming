Subsetting

Subsetting R objects 

multiple operators to extract subsets of r objects

'[' single square bracket always returns the same class as the original object - can be used to grab more than one element

'[[' double square brackets always extract a single item of list or data frame, it can only be used to extract one item -- may not extract list from list, but single item from list

'$' is used to extract a list or data frame by name - semantics are similar to '[['


> x <- c("a", "b", "c", "d", "e")
> x[1] # X at its first index
[1] "a"
> x[2]
[1] "b"
> x[1:4] # X at index 1 through 4 -- returns a vector
[1] "a" "b" "c" "d"
> x[x > "a"] # return an index of x where values are greater than character a
[1] "b" "c" "d" "e"
> u <- x >"a" #create logical vector you from vector x where values are greater than a
> u
[1] FALSE  TRUE  TRUE  TRUE  TRUE
> x[u] #returns values that correspond with true values of vector u
[1] "b" "c" "d" "e"




Subsetting Lists - you can use the double bracket or dollar sign operators
you cannot use double brackets or $ extraction methods for multiple items in the list

 x <- list(foo = 1:4, bar = .6)
> x
$foo
[1] 1 2 3 4

$bar
[1] 0.6


> x[[1]]
[1] 1 2 3 4

 x[["bar"]] #extracts just item in bar, the quotes specify we are looking for named argument
[1] 0.6

> x$bar #is the same output as x[["bar"]] - gives element associated with the name bar
[1] 0.6

> x["bar"] #shows x bar as a complete item
$bar
[1] 0.6



> x <- list(foo = 1:4, bar = .6, baz = "hello")
> x
$foo
[1] 1 2 3 4

$bar
[1] 0.6

$baz
[1] "hello"

> x[c(1,3)] #single bracket to extract multiple items (first and third index)
$foo
[1] 1 2 3 4

$baz
[1] "hello"

> name <- "foo"  #create variable called foo
> x[[name]]      #double brackets can work with the variable 
[1] 1 2 3 4 
> x$foo
[1] 1 2 3 4     
> x$name         #$ doesnt have variable support
NA

the $ sign allows for partial string mapping though


x <- list(a = list(10, 12, 14), b = c(13,2.81))

> x[[c(1,3)]] #extract value 14 from list 
[1] 14


> x[[1]][[3]] #another way to extract 14 from x list
[1] 14


> x[[1]][c(1,3)] #extract two items from x in the same sublist
[[1]]
[1] 10

[[2]]
[1] 14


> newarr <- c(x[[c(1,3)]], x[[c(2,2)]])
> newarr
[1] 14.00  2.81  #extracting two items from two different subsets


Subsetting Matrices 
Matrices can be subsetted in the way with (i,j) type indeces.

 x <- matrix(1:6, 2, 3)
> x
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

> x[1,2] #yields value in row 1, column 2
[1] 3

> x[2, 3] #yields value in row 2, column 3
[1] 6
> x[1,] #yields all values in first row
[1] 1 3 5
> x[,2] #yields all values in second column
[1] 3 4

> x[1,2, drop = FALSE]
     [,1]
[1,]    3  #returns the same value at x[1,2] however keeps the same class with drop = false - which is why we have a one by one matrix

> x[1, , drop = FALSE]
     [,1] [,2] [,3]
[1,]    1    3    5



Subsetting -- remove NA values
#one method to strip out missing values (NA) by creating a logical vector callded bad
> x <- c(1, 2, NA, 4, NA, 5)
> x
[1]  1  2 NA  4 NA  5
> bad <- is.na(x)
> bad
[1] FALSE FALSE  TRUE FALSE  TRUE FALSE
> x[!bad]                #items where vector x is NOT bad (bang bad)
[1] 1 2 4 5
> 

> y <- c("a", "b", NA, "d", NA, "f") #character vector with both elements are non missing
> good <- completecases(z, y)
Error: could not find function "completecases"
> good <- complete.cases(x,y)
> good
[1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE
> x[good]
[1] 1 2 4 5
> y[good]
[1] "a" "b" "d" "f"
