fit_linear_model <- function(X, y){
  tmp <- solve(t(X) %*% X)
  beta <- tmp %*% t(X) %*% y
  return(beta)
}

n=300
x1=rbinom(size=1,n=n,prob=.5)
x2=rnorm(n)
mu=100
b1=2
b2=-3

signal=mu + x1*b1 + x2*b2
error=rnorm(n)
y=signal+error

summary(lm(y~x1+x2))

Intercept=rep(1, length(x1))
X=cbind(x1, x2, Intercept)
fit_linear_model(X, y)