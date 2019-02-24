#--------------------------------------------------
# Texas Analysis Script 
# David John Baker
# Feb 24th 
#--------------------------------------------------
library(tidyverse)
#--------------------------------------------------
# Import data 

# would go here 

#--------------------------------------------------
# Check structure of data 
str(txhousing)

#--------------------------------------------------
# Create a table with only the the first four counties in the dataset.

txhousing %>% 
  select(city,sales:median)

txhousing %>%
  select(city) %>%
  unique()

txhousing %>%
  select(city) %>%
  table()

#--------------------------------------------------
# fn + shift + command + M = %>%
#--------------------------------------------------
# Create a table with only the the first four counties in the dataset.

# Create any new table using a single logical operator

txhousing %>%
  filter(city == "Dallas") %>%
  filter(sales >= 150)

# Create a table with a two logical operators
# Create a table that has no observations from either Paris or Waco.

txhousing %>%
  filter(city != "Paris" | city != "Waco")

# Create a new variable based on two other variables

txhousing

txhousing %>%
  mutate(lVol = log10(volume), garbage = volume/sales)

# Find the month with the highest average scales in Tyler 
# county for the year 2015

txhousing %>%
  select(city, sales, year, month) %>%
  filter(city == "Tyler") %>%
  filter(year == "2015") %>%
  filter(sales == max(sales))

txhousing %>%
  select(city, sales, year, month) %>%
  filter(city == "Tyler") %>%
  filter(year == 2015) %>%
  arrange(-sales)
  
# Create a table with data from Austin and Galveston, 
# using only the last three years of the dataset. 
# Group the sales by city and then calculate z scores for each county.

range(txhousing$year)
# 2015, 2014 , 2013

txhousing %>%
  filter(city == "Austin" | city == "Galveston") %>%
  filter(year >= 2013) %>%
  group_by(city) %>%
  mutate(zSales = scale(sales))


txhousing %>%
  select(year, sales) %>%
  group_by(year) %>%
  mutate(log_sales = log(sales), 
         growth = log_sales - lag(log_sales),
         growth_rate = growth * 100) 


#======================================================================================================
# Making Plots 

txhousing %>%
  filter(city == "San Antonio") %>%
  ggplot(aes(x = date, y = sales, color = as.factor(month), size = volume)) +
  geom_point() + 
  geom_smooth(se = FALSE, method = "lm") +
  labs(title = "Sales in San Antonio over Time",    
       x = "Year",
       y = "Sales", 
       caption = "Plot made by @DavidJohnBaker") +
  theme_classic()

txhousing %>%
  filter(city == "San Antonio" | city == "El Paso") %>%
  group_by(city) %>%
  mutate(zSales = scale(sales)) %>%
  ggplot(aes(x = date, y = zSales,
             label = month)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) +
  guides(fill=FALSE) +
  labs(title = "Sales in El Paso and San Antonio over Time",    
       x = "Year",
       y = "Sales", 
       caption = "Plot made by @DavidJohnBaker") +
  facet_wrap(~ city)
  theme_classic()

#--------------------------------------------------
# Bar Plots (google!)
g <- ggplot(mpg, aes(class))
# Number of cars in each class:
g + geom_bar() + coord_flip()


options(scipen = 999) # Remove Scientfic notation from R 
model_1 <- lm(sales ~ listings, data = txhousing)
summary(model_1)

plot(model_1)

model_1$coefficients

model_1$residuals

model_1$effects

model_1$rank

txhousing %>%
  str()

#--------------------------------------------------
# Recasting Factors (numeric, integer)

txhousing %>%
  mutate(city_factor = as.factor(city)) %>%
  str()

#--------------------------------------------------
# Renaming

txhousing %>%
  rename(Citayy = city)

tx_housing_with_awful_names <- txhousing %>%
  rename(Citayy = city)

#--------------------------------------------------
# Pairs Plots 
library(psych)
pairs.panels(iris)













