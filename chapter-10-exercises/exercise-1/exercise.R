# Exercise 1: creating data frames

# Create a vector of the number of points the Seahawks scored in the first 4 games
# of the season (google "Seahawks" for the scores!)
raw_scores_sea <- c(21,13,30,12) #2019 Season

# Create a vector of the number of points the Seahwaks have allowed to be scored
# against them in each of the first 4 games of the season
raw_scores_opp <- c(26,27,24,28)

# Combine your two vectors into a dataframe called `games`
games <- data.frame("Seahawks" = raw_scores_sea, "Opponent" = raw_scores_opp)

# Create a new column "diff" that is the difference in points between the teams
# Hint: recall the syntax for assigning new elements (which in this case will be
# a vector) to a list!
# games <- cbind(games,"diff" = c(1,2,3,4)) This is one way to do it
games$diff <- games$Seahawks - games$Opponent

# Create a new column "won" which is TRUE if the Seahawks won the game


# Create a vector of the opponent names corresponding to the games played


# Assign your dataframe rownames of their opponents


# View your data frame to see how it has changed!

