#Installs packages and loads into library
install.packages(c('gapminder', 'dplyr'))
library('gapminder')
library('dplyr')

#a tibble with data on different countries
gapminder
length(which(is.na(gapminder == TRUE))) #checks to see if there are NA's

#Question #1: 
gapminder %>%
  group_by(continent)%>% 
  summarise(unique_countries = n_distinct(country))

#Question #2:
gapminder %>%
  filter(year == 1997 & continent == "Europe") %>%
  arrange(gdpPercap) %>%
  slice(1)

#Question #3:
gapminder %>%
  filter(year %in% 1980:1989) %>%
  group_by(continent) %>%
  summarise(avg_life_expectancy = mean(lifeExp))

#Question 4: 
gapminder %>%
  group_by(country) %>%
  summarise(total_GDP = sum(gdpPercap*pop)) %>%
  arrange(desc(total_GDP)) %>%
  slice(1:5)

#Question 5:
gapminder %>% 
  filter(lifeExp >= 80) %>%
  select(country, lifeExp, year)

#Question 6: 
gapminder %>%
  group_by(country) %>%
  summarise(correlation = cor(lifeExp, gdpPercap)) %>%
  arrange(desc(abs(correlation))) %>%
  slice(1:10)

#Question 7: 
gapminder %>%
  filter(continent != "Asia") %>%
  group_by(continent, year) %>%
  summarise(avg_pop = mean(pop)) %>%
  arrange(desc(avg_pop))

#Question 8: 
gapminder %>%
  group_by(country) %>%
  summarise(sd = sd(pop)) %>%
  arrange(sd) %>%
  slice(1:3)

#Question 9: 
#This is a tibble
gm1992 = 
  gapminder %>%
    filter(year == 1992)
gm1992 %>% class()

#Question 10: 
gapminder %>%
  arrange(country, year) %>%
  group_by(country) %>%
  filter(pop < lag(pop) & lifeExp > lag(lifeExp))

