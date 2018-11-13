#Question 1a: Make a string with your last name
#Question 1b: Count the # of characters
last_name = "Hardy"
nchar(last_name)

#Question 2a: Make a vector of strings with first name/last name
#Question 2b: Coun the # of characters in each
name = c("Nicole", "Hardy")
nchar(name)

#Question 3: Make all uppercase
toupper(name)

#Question 4: Make string w/ "Regards" & first name sep by newline
new_string = paste("Regards,", "Nicole", sep = "\n")
cat(new_string)

#Question 5: Count # of characters in new_string
#Comma and newline counted!
nchar(new_string)
