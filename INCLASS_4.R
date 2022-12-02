# 1)

myT <- function(X){
  n_row = nrow(X)
  n_col = ncol(X)
  result = matrix(nrow=n_col, ncol=n_row)
  for(i in 1:n_row){
    for(j in 1:n_col){
      result[j, i] = X[i, j]
    }
  }
  return(result)
}

z=c('a','b','c','d','e','f','g','h','i')
X=matrix(nrow=3,ncol=3,data=z)
print(X)
print(t(X)) 
print(myT(X))

X=matrix(nrow=3,ncol=3,data=z,by.row=TRUE)
print(X)
print(t(X)) 
print(myT(X))

# Matrices store data by column and row index.

# 2)

product <- function(X, Y){
  result = matrix(nrow=nrow(X), ncol=ncol(Y))
  for(i in 1:nrow(X)){
    for(j in 1:ncol(Y)){
      tmp = 0
      for(k in 1:length(X[i, ])){
        tmp = tmp + X[i, k] * Y[k, j]
      }
      result[i, j] = tmp
    }
  }
  return(result)
}

X = matrix(nrow=3, ncol=4, data=c(1:12))
Y = matrix(nrow=4, ncol=3, data=c(1:12))

print(product(X, Y)) 
print(X %*% Y)





