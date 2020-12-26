## TestCode.R

## First some testing of CacheVectorMean.

v1 <- makeVector(c(3, 4, 5, 6))

print(v1)

v1$get()

cachemean(v1)

cachemean(v1)


### Create a test matrix

##
m1 <- matrix(data = c(1,0,2, 2,-1,3, 4,1,8), nrow=3, ncol=3, byrow=TRUE)

m1

## create a cache
cache <- makeCacheMatrix(m1)

## Try to get the inverse
inverse <- cacheSolve(cache)

inverse

## matrix multiply m1 by inverse

##
matrix_result <- m1 %*% inverse

## Should be a 3x3 identity matrix!!!
matrix_result

## Hoo Ray, it works!



