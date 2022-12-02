# 1)

for(x in 1:5){
  print(x)
}

for(i in c('a','b','d','c')){
  print(i)
}

for(z in c(TRUE,FALSE,TRUE,TRUE)){
  print(z)
}

# 2)

for(i in 1:5){
  for(j in c('a', 'b')){
    print(paste(i, j))
  }
}

# 3)

i = 0

while(i <= 5){
  print(i)
  i = i + 1
}

cat("The value of i after the while loop finishes is ", i)

# 4)



