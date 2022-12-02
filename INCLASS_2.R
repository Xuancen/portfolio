# 1)

data <- read.table('https://hastie.su.domains/ElemStatLearn/datasets/prostate.data')

# 2)

write.table(data, 'prostate.csv')

# 3)

data2 <- read.csv('prostate.csv')

# 4)

all.equal(data, data2)

# There is one more column in data2, and the column names are not the same.

# 5)

summary(data[, c('lcavol', 'lweight', 'lbph', 'lcp', 'lpsa', 'age', 'pgg45')])

table(data$svi)
table(data$gleason)

# 6)
par(mfcol=c(3,3))
hist(data$lcavol)
hist(data$lweight)
hist(data$lbph)
hist(data$lcp)
hist(data$lpsa)
hist(data$age)
hist(data$svi)
hist(data$gleason)
hist(data$pgg45)


# 7)
par(mfcol=c(2,4))

plot(data$lcavol, data$lpsa)
plot(data$lweight, data$lpsa)
plot(data$lbph, data$lpsa)
plot(data$lcp, data$lpsa)
plot(data$age, data$lpsa)
plot(data$pgg45, data$lpsa)

boxplot(lpsa~svi, data=data)
boxplot(lpsa~gleason, data=data)

# 8)

heatmap(cor(as.matrix(data[,1:9])),symm=TRUE)


# 9)

## Variables `lcavol`, `lcp`, `svi` appear to be most predictive of `lpsa`.