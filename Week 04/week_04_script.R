#Question 1:
#Print integers 1-50 using a loop
for(i in 1:50)
{
  print(i)
}

#Question 2a:
#Add all integers between 0 and 1000
add_int = 0
for(i in 0:1000)
{
  add_int = i + add_int
}
print(add_int)

#Question 2b: 
#Add all EVEN integers between 0 and 1000
add_even_int = 0
for(i in seq(from = 0, to = 1000, by = 2))
{
  add_even_int = i + add_even_int
}
print(add_even_int)

#Question 2c part 1: 
#Add all integers between 0 and 1000 without a loop
add_int_no_loop = sum(0:1000)
print(add_int_no_loop)

#Question 2c part 2:
#Add all even integers between 0 and 1000 without a loop
add_even_int_no_loop = sum(seq(from = 0, to = 1000, by = 2))
print(add_even_int_no_loop)

#Question 3a: 
survey <- data.frame(
  "participant" = c(1, 2, 3, 4, 5, 6),
  "q1" = c(5, 3, 2, 7, 11, 0),
  "q2" = c(4, 2, 2, 5, -10, 99),
  "q3" = c(-4, -3, 4, 2, 9, 10),
  "q4" = c(-30, 5, 2, 23, 4, 2),
  "q5" = c(88, 4, -20, 2, 4, 2)
)

#Sets invalid values to NA
survey.clean = survey
for(i in 1:dim(survey)[1])
{
  for(j in 2:dim(survey)[2])
  {
   if(survey[i,j] < 1 | survey[i,j] > 5)
   {
     survey.clean[i,j] = NA
   }
  }
}

#Question 3b:
#Adds a new column "invalid.answers" that indicates how many bad answers given
n = 0
for(i in 1:dim(survey)[1])
{
  for(j in 2:dim(survey)[2])
  {
    if(survey[i,j] < 1 | survey[i,j] > 5)
    {
      n = n + 1
    }
    survey.clean$invalid.answers[i] = n
  }
  n = 0
}



  