##Assignment 2##
##R Programming - Hopkins##
##2017-01-03##

## This function pair saves time when re-running a program
## by cacheing the matrix inversion output. 
## Functions built and designed by extending upon the 
## ProgrammingAssignment2 repository found at
## https://github.com/rdpeng/ProgrammingAssignment2

## Returning a list of 4 functions, MakeCaheMatrix appends
## cache data to the given invertable matrix
    # - set() allows for reinitializing for a new matrix without 
    #reruning makeCacheMatrix
    # - get() returns the matrix to be inverted
    # - setinv() caches output
    # - getinv() returns invertion output, if any 

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function(){
        x    
    }
    setinv <- function(inv) {
        m <<- inv
    }
    getinv <- function(){
        m
    } 
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Upon first call the casheSolve function will get the matrix, invert 
## it and store it in the cache data appended to the matrix. Upon second
## call (with no reinitialisation), the cacheSolve will pull the 
## cached data from the matrix 

cacheSolve <- function(x, ...) {
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinv(m)
    m
}
