# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- paste("Employee", 1:100)

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries2017a <- runif(100, 40000, 50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
salarie_adjustment <- runif(100, -5000, 10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame("employee" = employees, "Salary2017" = salaries2017a, "salary_adjust" = salarie_adjustment, stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$Salary2018 <- salaries$Salary2017 + salaries$salary_adjust

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raise <- (salaries$Salary2018 > salaries$Salary2017)


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
print(salaries$Salary2018[5])

# How many employees got a raise?
print(nrow(salaries[salaries$got_raise == TRUE, ]))

# What was the dollar value of the highest raise?
print(max(salaries$salary_adjust))

# What was the "name" of the employee who received the highest raise?
print(salaries[salaries$salary_adjust == max(salaries$salary_adjust), "employee"])

# What was the largest decrease in salaries between the two years?
print(min(salaries$salary_adjust))

# What was the name of the employee who recieved largest decrease in salary?
print(salaries[salaries$salary_adjust == min(salaries$salary_adjust), "employee"])

# What was the average salary change?
print(mean(salaries$salary_adjust))

# For people who did not get a raise, how much money did they lose on average?
print(mean(salaries$salary_adjust[salaries$raise == FALSE]))

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
#Yes, there is a wide spread of salaries. These numbers were randomly generated

# Write a .csv file of your salary data to your working directory
write.csv(salaries, "salaries.csv")
