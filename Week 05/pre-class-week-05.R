#---------------------------------------------------------------------------
# Pre-Class Week 05: 
#---------------------------------------------------------------------------
#Loads data on coronary heart disease
suppressMessages(library(foreign))
wcgs <- read.dta("https://drive.google.com/uc?export=download&id=0B8CsRLdwqzbzYWxfN3ExQllBQkU")

#A function that standardizes the data to make each variable have
#mean = 0 and sd = 1
standardized.me = function(x)
{
  x = (x - mean(x, na.rm = TRUE))/sd(x, na.rm = TRUE)
  return(x)
}

#Create new dataset with just numeric columns
WCGS.new = wcgs[,which(lapply(wcgs, class) == "numeric" | lapply(wcgs, class) == "integer")]

#loops through dataset (minus id column) to standardize each column
for (i in 2:dim(WCGS.new)[2])
{
  WCGS.new[,i] = standardized.me(WCGS.new[,i])
  print(paste("Mean of column", i, "is", mean(WCGS.new[,i], na.rm = TRUE)))
  print(paste("Standard deviation of column", i, "is", sd(WCGS.new[,i], na.rm = TRUE)))
  print("") #to make it more readable. 
}

#calculate mean weight of subjects by type of CHD using a loop
types_CHD = as.character(unique(wcgs$typchd69))
for (i in types_CHD) 
{
  print(paste("Mean weight of person with",i, "is", mean(wcgs$weight[which(wcgs$typchd69 == i)], na.rm = TRUE)))
}

#calculates mean weight of subjects by type of CHD without using  a loop
library(dplyr)
wcgs %>%
  group_by(typchd69) %>%
  summarise(mean_weight = mean(weight))
