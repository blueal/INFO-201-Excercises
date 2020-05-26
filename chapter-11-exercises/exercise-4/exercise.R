# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
library(nycflights13)


# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
rows = nrow(flights)
cols = ncol(flights)
namesCol = names(flights)

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
delayedFlights = mutate(flights, gain_in_air = (arr_delay - dep_delay))

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
delayedFlights = arrange(delayedFlights, desc(gain_in_air))

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
delayedFlights2 = mutate(flights, gain_in_air = (arr_delay - dep_delay)) %>%
  arrange(desc(gain_in_air))

# Make a histogram of the amount of time gained using the `hist()` function
hist(delayedFlights$gain_in_air)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
averageDelay = mean(delayedFlights$gain_in_air, na.rm = TRUE)

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
SeaTac = delayedFlights %>%
  filter(dest == "SEA") %>%
  select(origin, dest, gain_in_air)
  

# On average, did flights to SeaTac gain or loose time?
SeaTacAverage = SeaTac$gain_in_air %>%
  mean(na.rm = TRUE)

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
flightsToSEA = flights %>%
  filter(dest == "SEA") %>%
  summarise(avg = mean(arr_time, na.rm = TRUE),
            min = min(arr_time, na.rm = TRUE),
            max = max(arr_time, na.rm = TRUE))
