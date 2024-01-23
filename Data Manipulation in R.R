
###Data Manipulation###

# Piping.The dplyr and tidyverse functions are often used in conjunction with piping.
# Summarizing data.
# Selecting and filtering data.
# Adding, changing, or renaming columns.
# Spreading and gathering data.
# Merging datasets.

install.packages("dplyr")
install.packages("gapminder")

library(dplyr)
library(gapminder)

#check structure of data
data = gapminder
str(data)

#filter function select rows according to condition
data[data$continent=='Europe',]

data %>%
 filter(continent=='Europe')

#fetch only records according to condition
data %>%
  filter(continent=='Europe', year>2000)

#instead of comma you can also use ampersand & operator
data %>%
 filter(continent=='Europe' & year>2000)

#use of or operator
data %>%
  filter(continent=='Europe'|continent=='Americas')

#use of multiple criteria or condition
data %>%
  filter(continent=='Europe'|continent=='Americas',year>2000)

#select specific columns
data %>%
  select(country,year,lifeExp)

#instead of writing the name of columns you can also use column index
data %>%
  select(2:4)

#you can also use column name
data %>%
  select(continent:pop)

#when you dont want to have a specific column then you use dashline with the column name
data %>%
  select(-country)

#combine select and filter
data %>%
  select(country, year, lifeExp) %>%
  filter(lifeExp>80)

#arrange function is used to sort rows based on columns
data %>%
  arrange(year) #in ascending order
  arrange(-year) #in descending order

#first sort data based on column year and then sort it based on continent
  data %>%
    arrange(year,continent)

#i can add another coloumn
data %>%
  arrange(year, continent, -lifeExp)

#mutate : add a new variable from existing column
data %>%
  mutate(gdp=pop*gdpPercap)

data %>%
  mutate(gdp=pop*gdpPercap, inv_gdp=1/gdp)

data %>%
  mutate(gdp=pop*gdpPercap) %>%
  arrange(-gdp)

#summarise : is used to provide a summary of statistics for instance.
#find maximum and minimum life expectancy as a new variable
data %>%
  summarise(max_LE=max(lifeExp), min_LE=min(lifeExp))

#summerise function is very useful when its used with group by function
data %>%
  group_by(country) %>%
  summarise(max_LE=max(lifeExp),min_LE=min(lifeExp))

#i can also count how many observations are in each one 
data %>%
  group_by(country) %>%
  summarise(max_LE=max(lifeExp),min_LE=min(lifeExp),count=n())

#identify missing values
#so i'm asking is it not available is it a missing value so true here means that its a missing value 
is.na(starwars)

#remove the missing values
na.omit(starwars)

#mean or average of mass
mean(starwars$mass)

mean(starwars$mass, na.rm = T)
-----------------------------------------------------------------------------------------------------