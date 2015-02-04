myfunction <- function() {
	x <- rnorm(100)
	mean(x)
}

second <- function(x) {
	x + rnorm(length(x))
}

mattsFunc <- function(x){
	x * x * x * x
}