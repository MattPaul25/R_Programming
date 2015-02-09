Factors 

Factors are used to represent categorical data. Factors can be unordered or ordered. One can thing of a factor as an integer vector where each integer has a label
Factors are treated specially by modelling functions like lm() and glm()
Using factors with labels is better than using integers because factors are self describing -> having a variable of 'male' and 'female' is better than values 1 and 2

Factors print out something called levels - > levels appear to be unique items listed in the factor vector

> x <- factor(c("yes", "yes", "no", "yes"))
> x
[1] yes yes no  yes
Levels: no yes
> table(x)
x
 no yes 
  1   3 

  #unclass puts integer values for yes and no, "yes" is equal to 2 because the levels designated it 2nd and "no" is labeled as 1
  #no gets number 1 because it comes first alphabetically
  
> unclass(x)
[1] 2 2 1 2
attr(,"levels")
[1] "no"  "yes"
> 