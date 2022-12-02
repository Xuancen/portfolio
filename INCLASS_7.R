set.seed(195021)
x<-seq(from=0, to=2*pi,by=0.2)
f0<-function(x){ 100+sin(2*x)+cos(x/2) }
R2<-2/3
y<-f0(x)+rnorm(n=length(x),sd=sqrt(var(f0(x))*(1-R2)/R2))
plot(y~x)
lines(x=x,y=f0(x),col='red',lwd=2)

DF=round(seq(from=2,to=20,length=10))

cat("====", DF[1], "====", '\n')
z=cut(x,breaks=seq(from=min(x),to=max(x+.01),length=DF[1]),right=F)
fmStep <- lm(y~z)
cat('Model R-squared:', summary(fmStep)$r.squared, '\n')
cat('Model i=adjusted R-squared:', summary(fmStep)$adj.r.squared, '\n')
cat('AIC:', AIC(fmStep), 'BIC:', BIC(fmStep), '\n')

for(i in 2:length(DF)){
  cat("====", DF[i], "====", '\n')
  z=cut(x,breaks=seq(from=min(x),to=max(x+.01),length=DF[i]),right=F)
  fmStep <- lm(y~z)
  cat('Model R-squared:', summary(fmStep)$r.squared, '\n')
  cat('Model i=adjusted R-squared:', summary(fmStep)$adj.r.squared, '\n')
  cat('AIC:', AIC(fmStep), 'BIC:', BIC(fmStep), '\n')
}