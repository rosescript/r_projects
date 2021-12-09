##### R Project 5: Central Limit Theorem
##### Name: Sydney Wells
##### Version Number: 2



## (C1) Load the file Cars_Dataset.csv into R

cars <- read.csv("C:/Users/rose8/Documents/cars.csv")
mpg <- cars$Overall_MPG
category <- cars$Weight_Category


## (C2) Table of category
	# Code
table(category)

	# Copy and paste results here
    	# Heavy Weight  Light Weight Medium Weight 
    	#          20            24           168 


	# What category has the most cars?
    	# Medium weight has the most cars

	# What category has the least cars?
    	# heavy weight has the least cars




## (C3) Find estimates for the Mean, Variance, Standard Deviation Estimates for mpg using Built-In R Functions

	# Mean Code
mean(mpg)

	# Copy and paste mean results here
    	# 24.70047
	
	# Variance Code
var(mpg)
	
	# Copy and paste variance results here
    	# 37.07929

	# Standard Deviation Code
sd(mpg)
	
	# Copy and paste standard deviation results here
    	# 6.089277
	



## (C4) Histogram of mpg
	## Remember to save your plot and also submit it to Gradescope.

	# Code:
hist(mpg)


	# Describe your histogram:
    	# This histogram is right skewed.





# (C5) Shapiro-Wilk test on mpg

	# Code:
shapiro.test(mpg)


	# Copy and paste results here

    	# Shapiro-Wilk normality test

    	# data:  mpg
    	# W = 0.91039, p-value = 5.28e-10


	# Do you think that your population is normally distributed?
    	# No.
	# Reason: 
    	# This population is not normally distributed because the p-value is less than 0.05


	

# (C6) Copy and paste function, then run it.


sampling_jp <- function(dataset, seed_value, num_samples, sizejp){
  samples1 <- matrix(NA, nrow = num_samples, ncol = sizejp)
  set.seed(seed_value)
  for(i in 1:num_samples){
    samples1[i,] <- sample(dataset, size = sizejp, replace = TRUE)
  }
  rowmeans1 <- rowMeans(samples1)
  graph <- hist(rowmeans1, right = FALSE, xlab = "Sample Means",
                main = "Histogram",
                sub = paste("Size = ", sizejp))
  sw <- shapiro.test(rowmeans1)
  result <- list(SampleMeans = rowmeans1, Shapiro = sw, Histogram = graph)
  return(result)
}





# (Q7) Describe the difference between the terms "number of samples" and "sample size".

	# Number of Samples:

    	# The number of samples is the total number of samples within a given population

	# Sample Size:

    	# The sample size is the size of one of those samples within the given population


# (Q8) Describe what each individual part is doing in (C6) for code provided


	# sample() does:
    	# sample() takes a sample of size sizejp from dataset using replacement

	# dataset does:
    	# dataset is the set of data sample is pulling a sample from

	# size = sizejp does:
    	# this is the size of the sample

	# replace = TRUE does:
    	# indicates that replacement should be used


# (C9) Build sampling distribution of samples of mpg
	## Remember to save your histogram and also submit it to Gradescope.

	# Code:

run1 <- sampling_jp(mpg, 154, 115, 6)

	
	# Copy and paste Shapiro-Wilk test results here

		# Shapiro-Wilk normality test

		# data:  rowmeans1
		# W = 0.94782, p-value = 0.0002104

	




# (C10) Build sampling distribution of samples of mpg
	## Remember to save your histogram and also submit it to Gradescope.

	# Code:
run2 <- sampling_jp(mpg, 154, 115, 393)


	
	# Copy and paste Shapiro-Wilk test results here

		# Shapiro-Wilk normality test

		# data:  rowmeans1
		# W = 0.99498, p-value = 0.9562




# (Q11) From (C9): Does it appear normally distributed?  Why or why not?
	# Normally Distributed (Yes or No):
		# No
	# Reason using histogram:



	# Reason using the Shapiro-Wilk Test:
		# No, because the p-value is less than 0.05





# (Q12) From (C10): Does it appear normally distributed?  Why or why not?
	# Normally Distributed (Yes or No):
		# Yes
	# Reason using histogram:
			# The histogram looks pretty symmetrical.


	# Reason using the Shapiro-Wilk Test:
		# Yes, because the p value is greater than 0.05





# (Q13) CLT?
	# Can CLT be used in (C9)?:

	# Reason: 
		# No, the sample size is too small.


	# Can CLT be used in (C10)?:

	# Reason:
		# Yes, the sample size is large enough to justify using the CLT






# (Q14) Expected Value of the Sample Mean using CLT formulas

	# Code for first sample size:

mean(mpg)

	# Copy and paste results here

		# 24.70047


	# Code for second sample size:

mean(mpg)

	# Copy and paste results here

		# 24.70047
	
	
	
# (Q15) Standard Deviation of the Sample Mean using CLT formulas

	# Code for first sample size:

var(mpg) / sqrt(6)

	# Copy and paste results here

		# 15.13756



	# Code for second sample size:

var(mpg) / sqrt(393)

	# Copy and paste results here
	
		# 1.870403
	
	
	
# (C16) Average of the Sample Means from C9 and C10

	# Code for average of sample means from C9

mean(run1$SampleMeans)

	# Copy and paste results here
		# 24.56159


	# Code for average of sample means from C10

mean(run2$SampleMeans)
	# Copy and paste results here

		# 24.72792
	
	
	
	
# (C17) Standard Deviation of the Sample Means from C9 and C10

	# Code for standard deviation of sample means from C9

sd(run1$SampleMeans)
	# Copy and paste results here
		# 2.569765


	# Code for standard deviation of sample means from C10

sd(run2$SampleMeans)

	# Copy and paste results here
	
		# 0.2900332
	



	
# (Q18) Does the CLT approximation appear to get better as the sample size increased? Why or why not?

	# Does it get better?
		# Yes

	# Reason:
		# The CLT works better when n > 30, so when n became 393 the CLT approximation improved.



