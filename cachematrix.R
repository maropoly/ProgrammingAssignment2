## With large datasets, inversions of matrix can be very time consuming to.
##This function was created to help improve the computational aspect

## Function would do the following:
## 1: set the value of the matrix
## 2: get the value of the matrix
## 3: set the value of inverse- matrix
## 4: get the value of inverse- matrix
makeCacheMatrix <- function (x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  setinversematrix <- function(inverse) inv <<- inverse
  getinversematrix <- function() inv
  
  list(set = set, get = get,
       setinversematrix = setinversematrix,
       getinversematrix = getinversematrix)
  
}


## The following function returns the inverse of matrix. It first runs to see if the inverse
## Function runs to see if the cacluation was first executed and if it does it will use that computation
##If not execture, will compute the inverse and set the value int he cache by the set inverse


cacheSolve <- function(x, ...) {
  inv <- x$getinversematix
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinversematrix(inv)
  inv
}
 ##Sample RUn##
##x = rbind(c(1, -1/6), c(-1/6, 1))
##m = makeCacheMatrix(x)
##m$get()
##x = rbind(c(1, -1/6), c(-1/6, 1))
##m = makeCacheMatrix(x)
##m$get()

##[1,]  1.0000000 -0.1666667
##[2,] -0.1666667  1.00000
#cacheSolve(m)
##[,1]      [,2]
##[1,] 1.0285714 0.1714286
## 0.1714286 1.0285714