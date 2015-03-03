##Explicit Coercian

## using the as function to change the data type
## using the class function to tell us what type were looking at 

x <- 0:6
class(x)
y = as.numeric(x) 
z = as.logical(x) ##[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
z1 = as.character(x) ##[1] "0" "1" "2" "3" "4" "5" "6"


test <-as.character(as.numeric(z1)/2)
## Yields "0"   "0.5" "1"   "1.5" "2"   "2.5" "3"  

as.logical(test) ## NA NA NA NA NA NA NA

as.logical(as.numeric(test)) ##FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE