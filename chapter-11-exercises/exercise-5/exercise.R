# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month = flights %>%
  group_by(month) %>%
  summarise(avgDepDelay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(month)

# Which month had the greatest average departure delay?
dep_delay_month = dep_delay_by_month %>%
  filter(avgDepDelay == max(avgDepDelay)) %>%
  select(month) %>%
  toString()

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
arr_delay_by_dest = flights %>%
  group_by(dest) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(desc(delay)) %>%
  head(5)

# You can look up these airports in the `airports` data frame!
#View(airports)

# Which city was flown to with the highest average speed?
city_speed <- flights %>%
  mutate(speed = distance / air_time * 60) %>%
  group_by(dest) %>%
  summarise(avg_speed = mean(speed, na.rm = TRUE)) %>%
  filter(avg_speed == max(avg_speed, na.rm = TRUE))