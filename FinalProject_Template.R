##### R Final Project
##### Name: Sydney Wells
##### Version Number: 2




## Task 1: Load the Dataset into R (Code)

school_data <- read.csv("C:/Users/rose8/Documents/r_projects/final_proj/CPS_Dataset.csv")




## Task 2: Summary Statistics for Students Passing Algebra
	# Summary Stats Code and Results
	passing <- school_data$Students_Passing_Algebra
	summary(passing)
	
	# Results: 
		# Min.  1st Qu.  Median  Mean   3rd Qu.  Max.     NA's 
    	# 3.80   33.70   54.15   53.83   73.47  100.00     436 
	
	
	# Variance Code and Results
	var(passing, na.rm = TRUE)

	# Result: 
		# 632.7849

	
	
	# Standard Deviation Code and Results
	sd(passing, na.rm = TRUE)

	# Result: 
		# 25.15522

	
	# Number of values that are not missing Code and Results
		not_na <- passing[!is.na(passing)]
		length(not_na)
		# There are 566 values in passing, and our summary reported that 436
		# of those values are NA. So if we subtract 436 from 566, we have 
		# 130 values that are not missing. We also get 130 from the code above,
		# by passing all of the non-NA values into not_na, and then printing 
		# the length of not_na
	


	
	
## Task 3: Summary Statistics for Graduation Rate
	# Summary Stats Code and Results
	grad_rate <- school_data$Graduation_Rate

	summary(grad_rate)

	# Results:
		# Min.   1st Qu.  Median   Mean   3rd Qu.    Max.    NA's 
		# 16.30   51.45   62.25   62.54   74.53   97.60     488 
	
	
	# Variance Code and Results
	var(grad_rate, na.rm = TRUE)

	# Result:
		# 296.0686

	
	
	# Standard Deviation Code and Results
	sd(grad_rate, na.rm = TRUE)

	# Result:
		# 17.20664
	
	# Number of values that are not missing Code and Results

	grad_not_na <- grad_rate[!is.na(grad_rate)]
	length(grad_not_na)
	# There are 566 values in grad_rate, and our summary reported that 488
	# of those values are NA. So if we subtract 488 from 566, we have
	# 78 values that are not missing. We also get 78 from the code above,
	# by passing all of the non-NA values into grad_not_na, and then printing
	# the length of grad_not_na

	
	
	
	
	
## Task 4: Histogram for Students Passing Algebra
	## Remember to save your plot and also submit it to Gradescope.

	# Code:

	hist(passing)





	# Describe histogram: symmetry?
		# it looks almost symmetric, it's very close to being bell shaped



	
	# Describe histogram: unimodal or bimodal or multimodal?
		# bimodal


	
	
	
	
## Task 5: Histogram for Graduation Rate
	## Remember to save your plot and also submit it to Gradescope.

	# Code:
	hist(grad_rate)




	# Describe histogram: symmetry?
		#  symmetrical



	
	# Describe histogram: unimodal or bimodal or multimodal?
		# unimodal
		
		
		
		



## Task 6: Boxplot for Students Passing Algebra
	## Remember to save your plot and also submit it to Gradescope.

	# Code:
	bp1 <- boxplot(passing, ylab = "Boxplot for passing", horizontal = TRUE)


	
	# Are there outliers present?
	bp1$out
		
		
		
		


## Task 7: Boxplot for Graduation Rate
	## Remember to save your plot and also submit it to Gradescope.

	# Code:
	bp2 <- boxplot(grad_rate, ylab = "Boxplot for grad_rate", horizontal = TRUE)
	

	# Are there outliers present?
	bp2$out
		
		
		


		
## Task 8: Shapiro-Wilk Test for Students Passing Algebra
	# Code:
	shapiro.test(passing)



	# Copy and paste results here

	# Shapiro-Wilk normality test

	#data:  passing
	# W = 0.97738, p-value = 0.02852



	# Do you think that your population is normally distributed?
		# no


	# Reason: 
		# This population is not normally distributed because the p-value is less than 0.05

		
		
	# Does your decision here match what you are seeing with your histogram from Task 4? Why or why not?

		
		
		
		
		
		
## Task 9: Shapiro-Wilk Test for Graduation Rate
	# Code:
	shapiro.test(grad_rate)



	# Copy and paste results here
	# Shapiro-Wilk normality test

	# data:  grad_rate
	# W = 0.9884, p-value = 0.7067



	# Do you think that your population is normally distributed?
		# yes.


	# Reason: 
		# This population is normally distributed because the p-value is greater than 0.05

		
		
	# Does your decision here match what you are seeing with your histogram from Task 5? Why or why not?

		# Yes, the histogram looks pretty symmetrical which means it's probably normally dsitributed.
		
		
		
		
		
## Task 10: Compare average PLAN scores from students tested Fall 2009 to the average PLAN scores from students tested Fall 2010.  Create a confidence interval, assuming equal variances. (See PDF for CI to create.)

	# Code:
	fa09 <- school_data$X10_Grade_Plan_2009
	fa10 <- school_data$X10_Grade_Plan_2010
	t.test(fa09, fa10, conf.level = 0.927, var.equal = TRUE)



	# Copy and paste results here

	# Two Sample t-test

	# data:  fa09 and fa10
	# t = 0.21531, df = 167, p-value = 0.8298
	# alternative hypothesis: true difference in means is not equal to 0
	# 92.7 percent confidence interval:
	# -0.5710111  0.7257630
	# sample estimates:
	# mean of x mean of y 
	# 15.14634  15.06897



	# State the parameter the confidence interval is for.
		# the parameter is the difference in means


		
	# Write down the confidence interval.
		# -0.5710111 < diff_means < 0.7257630



	# Write an interpretation of your confidence interval.
		# We are 92.7% confident that the difference of means of fa09 and fa10 
		# lies between -0.5710111 and 0.7257630.


	# We are interested in whether there is evidence that there is specific value difference between the PLAN scores for the two years. (See PDF for more specifics.)
		# Is there evidence this is true?
			# No.

		# Reason why or why not.
			# 1 does not lie within our confidence interval of -0.5710111 < diff_means < 0.7257630

		
		
		
		
		
		
		
## Task 11: Create a confidence interval for the variance of Graduation Rate. (See PDF for CI to create.) Ignore any warnings generated.

	# Code:
	library(DescTools)
	VarCI(grad_rate, method = "classic", conf.level = 0.931, sides = "two.sided", na.rm = TRUE)


	
	# Copy and paste results here

	#     var   lwr.ci   upr.ci 
	# 296.0686 225.6236 406.8828


	
	# State the parameter the confidence interval is for.
		# the parameter is the variance


	
	# Write down the confidence interval.
		# 225.6236 < var < 406.8828



	# Write an interpretation of your confidence interval.
		# We are 93.1% confident that the variance lies between 225.6236 and 406.8828.


	# What assumption did we need to make to construct this confidence interval?
		# We needed to assume equal variances.



	# Do you think that this assumption was met? You should reference an earlier Task from this project to answer this question.

	
	
	
	
	

	
## Task 12: Hypothesis Test for Students Passing Algebra
	# What conditions must you satisfy to perform this test? Do you think they are met?  Why or why not?




	# State the hypotheses:
		#H0: passing_mean = 49
		#H1: passing_mean > 49
	
	
	
	
	# Code
	t.test(passing, mu = 49, alternative = "greater", conf.level = 0.981)

	
	
	# Copy and paste results here

	# One Sample t-test

	# data:  passing
	# t = 2.1889, df = 129, p-value = 0.0152
	# alternative hypothesis: true mean is greater than 49
	# 98.1 percent confidence interval:
	# 49.20403      Inf
	# sample estimates:
	# mean of x 
	# 53.82923
	
	
	
	# State the Test Statistic Value:
		# t = 2.1889

	# State the P-Value:
		# p-value = 0.0152

	
	# Decision from P-Value (see PDF for significance level):
		# we reject the null hypothesis because 0.0152 < 0.019.
	
	# Conclusion from P-Value:
		# There is enough evidence to support the mean > 49

	
	# State the critical value. Provide your code and results.


			
	# State the critical region.



	# Would you make the same decision based on the critical region that you did with your p-value? Why or why not?






