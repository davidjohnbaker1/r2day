2 + 2 

5 - 2

10 / 4

9 * 200

sqrt(81)

10 > 4

2 < -1

is.integer(7L)

is.double(7)

is.numeric(7)

is.character("hello, world!")

is.character("7")

is.character("I will drink 7 coffees by the end of today!")

is.character("NA")

my_thoughts <- "I am thinking about my cheese sandwich for lunch"

my_thoughts


foo <- 2 * 3
foo * 6

is.numeric(foo)

yearsSellingWidgets <- c(2,1,4,5,6,7,3,2,4,5,3)

yearsSellingWidgets * 3

yearsSellingWidgets - 2

yearsSellingWidgets < 2

str(yearsSellingWidgets)

yearsSellingWidgets <- c(2,1,4,5,6,7,3,2,4,5,3)
numberOfSales <- c(5,2,5,7,9,9,2,8,4,7,2)
salesData <- data.frame(yearsSellingWidgets,numberOfSales)

cor(yearsSellingWidgets, numberOfSales)

salesData$yearsSellingWidgets

cor(salesData$yearsSellingWidgets, salesData$numberOfSales)

plot(x = yearsSellingWidgets, y = numberOfSales,
     data = salesData, main = "My Plot",
     ylab = "Number of Sales",
     xlab = "Years at Company")


san_antonio <- txhousing %>%
  select(1:6, inventory) %>%
  filter(city == "San Antonio")

san_antonio


getwd()
setwd("img/")
setwd("..")

write.csv(x = san_antonio, file = "my_san_antonio_data.csv")

#======================================================================================================
# My new data analysis 

foo <- read.csv(file = "my_san_antonio_data.csv")
foo

my_san_antonio_data <- read_csv("~/Desktop/projects/r2day/my_san_antonio_data.csv")

names(txhousing)

range(txhousing$year)

txhousing %>%
  filter( year > 2010 | year < 2005) 



