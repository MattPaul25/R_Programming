

#This function creates a matrix object which is a list. It has anonymous functions like getsolve
# and setsolve that the object carries - set solve is used to store the matrix in cache, which is 
# called from the cacheSolve function

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
      setsolve = setsolve,
      getsolve = getsolve)
}


## This function takes in a matrix object created by makeCacheMatrix and 
# checks whether the inverse has been cached before - if not it solves the inverse,
# if it has been cached it retrieves with the message gett cached data and exits early
#via return statement, it caches the solve via the anonymous function object in makeCacheMatrix func

cacheSolve <- function(x, ...){
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
