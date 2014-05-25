## This function creates a matrix object, which is a list containing 
## a function to

## set the value of the vector
## get the value of the vector
## set the value of the matrix
## get the value of the matrix's inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinvmatrix <- function(matrix) m <<- matrix
        getinvmatrix <- function() m
        list(set = set, get = get,
             setinvmatrix = setinvmatrix,
             getinvmatrix = getinvmatrix)
}


## The following function calculates the inverse  of the special matrix 
## created with the above function. However, it first checks to see if the
## inverse of the matrix has already been calculated. If so, it gets the
## matrix inverse  from the cache and skips the computation. Otherwise, it
## calculates the inverse of the matrix and sets the value of the matrix in
## the cache via the setmatrix function.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
        m <- x$getinvmatrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinvmatrix(m)
        m
}