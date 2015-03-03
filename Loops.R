##for loops
#For loops take an iterator variable and assign it successive values from a sequence or vector -- for loops are msot commonly used for iterating over the elements of an object
print("testing for loops")
x <- c("a", "b", "c", "d", "e")
print (x)

for (i in 1:5) {
		print(x[i])
}

for (i in seq_along(x)){
		print (x[i])
}

#this for acts like foreach var i in collection
for(letter in x){
	print(letter)
}

for (i in 1:5) print (x[i]) #same as first one

print("------------------------------------------------")

#Nested for loops
print("Nested For Loops -- working with a matrix")
x <- matrix(1:6, 2, 3)
print(x)

for(i in seq_len(nrow(x))){
	for(j in seq_len(ncol(x))){
		print(x[i, j])
	}
}

#nesting beyond 2 - 3 levels makes it difficult to read
print("------------------------------------------------")

#While Loops
print("While Loops -- taking a logical expression")
print("counting to 10....")
count <- 0

while (count < 10) {
	print (count)
	count <- count + 1
}

print("------------------------------------------------")

z <- 5
iterator <- 0

while(z >= 2 && z <= 7) {
	print (z)
	coin <- rbinom(1,1, 0.5)

	if (coin == 1) { 
		z <- z + 1
	} else {
		z <- z - 1
	}

	if (iterator >= 100){
		break
	}
	iterator <- iterator + 1

}

print ("iterations: ")
print (iterator)

print("------------------------------------------------")

#repeat next break
print("repeat loops")
#repeat initiates an infinite loop , must be used with break otherwise InfLoop

x0 <- 1
tol <- 1e-8
x1 <- 0
iterator <- 0

repeat {
	x1 <- x1 + 1 
	if(abs(x1-x0) < tol ) {
		break
		} else {
			x0 <- x1
		}
	
	if (iterator >= 100){
		break
	}
	iterator <- iterator + 1
	}

print("------------------------------------------------")

#repeat next break
print("next in for loops")


for ( i in 1:100) {
	
	if (i <= 20) {
		#skip the first 20 iterations
		next
	}
	print(i) #this wont execute till it hits 20
}
