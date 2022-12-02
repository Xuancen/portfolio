# Question 1. X follows a Normal distribution with mean 10 and variance 4. 
# Evaluate the following probabilities:
  
# - P(X<8)

pnorm(8, mean = 10, sd = 2)

# - P(X>11)

1 - pnorm(11, mean = 10, sd = 2)

# - P(8<X<11)

pnorm(11, mean = 10, sd = 2) - pnorm(8, mean = 10, sd = 2)

# Question 2. For the same RV X, we produce a linear transformaton Z=(X-10)/2. Compute the following probabilities

# we can get that Z ~ norm(mean=0, sd=1)

# - P(Z< -1)

pnorm(-1, mean = 0, sd = 1)

# - P(Z> 1/2)

1 - pnorm(1/2, mean = 0, sd = 1)

# - P( -1 < Z < 1/2) 

pnorm(1/2, mean = 0, sd = 1) - pnorm(-1, mean = 0, sd = 1)

# Question 3. Let Z1, Z2,...,Zp be IID Bernoulli random variables with success probability 0.07. Now let X=Z1+Z2+...+Zn. 
# Compute and report the following probabilities for `n=[10,20,30]`

# X ~ B(n, p=0.07)


# - P(X=3)

## when n = 10

dbinom(3, prob = 0.07, size = 10)

## when n = 20

dbinom(3, prob = 0.07, size = 20)

## when n = 30

dbinom(3, prob = 0.07, size = 30)

# - P(X>3)

## when n = 10

1 - pbinom(3, prob = 0.07, size = 10)

## when n = 20

1 - pbinom(3, prob = 0.07, size = 20)

## when n = 30

1 - pbinom(3, prob = 0.07, size = 30)



# - P(X<3)

## when n = 10

pbinom(3, prob = 0.07, size = 10) - dbinom(3, prob = 0.07, size = 10)

## when n = 20

pbinom(3, prob = 0.07, size = 20) - dbinom(3, prob = 0.07, size = 20)

## when n = 30

pbinom(3, prob = 0.07, size = 30) - dbinom(3, prob = 0.07, size = 30)

# - P(X<=3)

## when n = 10

pbinom(3, prob = 0.07, size = 10)

## when n = 20

pbinom(3, prob = 0.07, size = 20)

## when n = 30

pbinom(3, prob = 0.07, size = 30)


# - Verify that P(X<=3)+P(X>3)=1

pbinom(3, prob = 0.07, size = 10) + 1 - pbinom(3, prob = 0.07, size = 10)

# Question 4. 

## expected value of Binomial: 50 * 0.05 = 2.5

x = rbinom(10000, size = 50, prob = 0.05)

y = rpois(10000, lambda = 2.5)

mean(x)

mean(y)

# Question 5.

## b follows a normal distribution.


# Question 6.

DATA=read.table('https://raw.githubusercontent.com/gdlc/STAT_COMP/master/DATA/wages.txt',header=TRUE)
str(DATA) # inspect the types of each variable! Do variables have the correct type?

HA=lm(wage~education+sex+union+region+ethnicity,data=DATA)
H0=lm(wage~education+sex+union+region,data=DATA)
# Use logLik() to obtain the log-likelihood for each model 

# Likelihood ratio test
teststat <- -2 * (as.numeric(logLik(H0))-as.numeric(logLik(HA)))
p <- pchisq(teststat, df = 1, lower.tail = FALSE)
p

## p = 0.07 > 0.05. We can't reject H0

# F-test

anova(H0, HA)

## p = 0.2 > 0.05, we can't reject H0

# Question 7.

## X ~ b(4, 3/100)

1 - dbinom(0, size = 4, prob = 3/100)

## The probability that I contract COVID-19 is 0.1147072
