n=500
p=5
X=matrix(nrow=n,ncol=p,data=rnorm(n*p))
y=X[,3]-X[,5]+rnorm(n)

C=crossprod(X)
r=crossprod(X,y)


## 1)
QR=qr(X)
Q=qr.Q(QR) 
R=qr.R(QR)

dHat=crossprod(Q,y)
result= backsolve(R,dHat) 

model = lm(y~X-1)
summ = summary(model)


print(cbind(solve(C, r), summ$coefficients[, 1], result))

# The result is same as `solve(C,r)` and `lm(y~X-1)`.

## 2)

solveSys <- function(C, r, tol=1e-4){
  p=ncol(C)
  b=rep(0,p)

  ready=FALSE
  while(!ready){
    
    bOLD=b 
    for(i in 1:p){
      b[i]=(r[i]-sum(C[i,-i]*b[-i]))/C[i,i]
    }
    ready<-(max(abs(b-bOLD))<tol)
  }
  return(b)
}

result = solveSys(C, r)
print(cbind(solve(C, r), summ$coefficients[, 1], result))
