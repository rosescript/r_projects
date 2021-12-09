##### R Project 3: Binomial Distribution
##### Name: Sydney Wells
##### Version Number: 4



### Part 1
## (C1): Store the size of your distribution
nBerTrial <- 23




## (C2) Store your probability of successes
pbty <- 0.72




## (C3) Create a vector from 0 through the number of Bernoulli Trials of your distribution.
num_successes <- c(0:nBerTrial)



## (C4) Find Binomial Probabilities.
probabilities <- dbinom(num_successes, nBerTrial, pbty)



## (C5) Make num_successes into a factor.
successes <- factor(num_successes[1:(nBerTrial+1)])



## (C6) Create a barplot.
barplot(probabilities, xlab = "Successes", ylab = "Binomial Probabilities (PMF)", ylim = c(0,0.22), names.arg = successes)







### Part 2
## (C7) Random Sampling
set.seed(692)
sample_values <- rbinom(45, nBerTrial, pbty)





### Questions
## (Q1) Expected Value of Distribution?
# Code:
# the expected value of the distribution would be n*p
pbty * nBerTrial


# Result from Code:
16.56


## (Q2) Standard Deviation of Distribution?
# Code:
sqrt(nBerTrial * pbty * (1 - pbty))

# Result from Code:
2.153323

## (Q3) Mean of random sample?
# Code:
mean(sample_values)


# Result from Code:
16.64444


## (Q4) Standard Deviation of random sample?
# Code:
sd(sample_values)

# Result from Code:
2.186275


## (Q5) Why do you think the mean and standard deviation from the sample is not exactly the same as the expected value and standard deviation from the distribution?
# Answer:
# They are calculated differently. The mean for for the distribution is calculated with n*p (or in our
# case, nBerTrial*pbty), whereas the mean for the random sample is calculated with the mean() function,
# which is an entirely different equation. Similarly, the standard deviation for the distribution is
# calculated with sqrt(nBerTrial * pbty * (1 - pbty)), and the sample's standard deviation is calculated
# with the sd() function.


## (Q6) Would the success / failure condition be met in this case if we wanted to approximate using the Normal Distribution? Why or why not?
# Code: 
q <- 1 - pbty
nBerTrial * q


# Solution:
# Yes, the success/failure condition is met in this case because nBerTrial * pbty is 16.56 and nBerTrial * q is 6.44.
# Since both of those are greater than or equal to 5, the condition is met.
