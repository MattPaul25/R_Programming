##Missing Values are denoted by NA or NaN for undefined mathematical operations

##is.na() is used to test objects they are NA
x <- c(1 , 2, NA, 10, 3)
x
is.na(x)
##[1] FALSE FALSE  TRUE FALSE FALSE
is.nan(x)
##[1] FALSE FALSE FALSE FALSE FALSE
x <- c(1 , 2, "test", 10, 3)
x
##[1] "1"    "2"    "test" "10"   "3" 
#notice numbers are converted to text  
is.nan(x)
##[1] FALSE FALSE FALSE FALSE FALSE
is.nan(x)
##[1] FALSE FALSE FALSE FALSE FALSE
x <- c(1 , 2, NAN, 10, 3)
##Error: object 'NAN' not found
x <- c(1 , 2, NaN, 10, 3)
x
##[1]   1   2 NaN  10   3
is.nan(x)
##[1] FALSE FALSE  TRUE FALSE FALSE
>