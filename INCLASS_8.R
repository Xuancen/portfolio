DATA=read.table('https://raw.githubusercontent.com/gdlc/STAT_COMP/master/DATA/GALTON.csv',header=TRUE,sep=',')
DATA$PA=(DATA$Father+DATA$Mother)/2
y=DATA$Height
x=DATA$PA
library(splines)

par(mfrow=c(2,2))
for (i in c(3, 4, 6, 8)){
x.ns=ns(x=DATA$PA,df=i,intercept=TRUE)
model=lm(y~x.ns-1)
print(model)
plot(y~x,col=8, cex=.5,main=paste('Natural spline with df = ', i))
lines(x=x,y=predict(model),col='red',lty=2,lwd=2)
}