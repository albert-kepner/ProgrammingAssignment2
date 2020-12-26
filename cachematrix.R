## 
## ### Assignment: Caching the Inverse of a Matrix
## 
## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly (there are also alternatives to matrix inversion that we will
## not discuss here). Your assignment is to write a pair of functions that
## cache the inverse of a matrix.
## 
## Write the following functions:
## 
## 1.  `makeCacheMatrix`: This function creates a special "matrix" object
##     that can cache its inverse.
## 2.  `cacheSolve`: This function computes the inverse of the special
##     "matrix" returned by `makeCacheMatrix` above. If the inverse has
##     already been calculated (and the matrix has not changed), then
##     `cacheSolve` should retrieve the inverse from the cache.
## 
## Computing the inverse of a square matrix can be done with the `solve`
## function in R. For example, if `X` is a square invertible matrix, then
## `solve(X)` returns its inverse.

## Write a short comment describing this function

## The first function, `makeCacheMatrix` creates a special "vector", which is
## really a list containing a function to
## 
## 1.  set the value of the matrix x
## 2.  get the value of the matrix x
## 3.  set the value of the inverse matrix for x
## 4.  get the value of the inverse matrix for x
## 
## <!-- -->

makeCacheMatrix <- function(x = numeric() ) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) m <<- inverse
  get_inverse <- function() m
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}


## Write a short comment describing this function

## 
## The following function calculates the inverse matrix using the special "vector"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse matrix of
## the data and sets the value of the inverse in the cache via the `set_inverse`
## function.
## 
cacheSolve <- function(x, ...) {
  m <- x$get_inverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$set_inverse(m)
  m
}