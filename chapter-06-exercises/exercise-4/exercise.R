# Exercise 4: functions and conditionals

# Define a function `is_twice_as_long` that takes in two character strings, and 
# returns whether or not (e.g., a boolean) the length of one argument is greater
# than or equal to twice the length of the other.
# Hint: compare the length difference to the length of the smaller string
is_twice_as_long <- function(string1, string2){
  #Divide string1 by string2, if it's double it'll be greater than 2.
  return (nchar(string1)/nchar(string2) >= 2 || nchar(string2)/nchar(string1) >= 2)
}

# Call your `is_twice_as_long` function by passing it different length strings
# to confirm that it works. Make sure to check when _either_ argument is twice
# as long, as well as when neither are!

print(paste(
  is_twice_as_long("word", "longer words"),
  is_twice_as_long("longer words first", "short"),
  is_twice_as_long("not doublely long", "not doubley long")
))

# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"

describe_difference <- function(string1, string2){
  #It's a common code convention to only have 1 return statement.
  answer <- ""
  if(nchar(string1) > nchar(string2)){
    answer <- paste("Your first string is longer by", nchar(string1)-nchar(string2), "charcters")
  } else if(nchar(string2) > nchar(string1)){
    answer <- paste("Your second string is longer by", nchar(string2)-nchar(string1), "charcters")
  } else {
    answer <-"Your strings are the same length"
  }
  return(answer)
}

# Call your `describe_difference` function by passing it different length strings
# to confirm that it works. Make sure to check all 3 conditions1
print(paste(
  describe_difference("word", "longer words"),
  describe_difference("longer words first", "short"),
  describe_difference("not doublely long", "not doublely long")
))
