# This is a comment

# '<-' - is the assignment operator.
# c() - for Combine. Generic function, to form a vector.
# vector - is a data type, that must contain entries that are all of the same type.
colors <- c("red", "green", "blue")

# IMPORTANT - R using 1 based indexing.
colors[1] # is red

# Print the vector
colors

# Create vector of numbers, with values from one to 10.
numbers <- c(1:10)

# Add values to a vector
numbers <- c(numbers, 11:15)

# R has some built in datasets
data(mtcars)
names(mtcars)

# Use '?' to get more information about any commands.
?mean

str(mtcars)         # get the structure of dataset

head(mtcars, 10)    # prints first 10 rows of dataset
tail(mtcars, 10)    # prints last 10 rows of dataset

# Use '$' to get any column
mtcars$mpg

### datasets

getwd()             # get working directory
setwd('')           # set working directory (use forwar '/' slashes)

statesInfo <- read.csv('data.csv')          # read data from data.csv

subset(statesInfo, state.region == 1)       # get subset of data, where region == 1

subset(statesInfo, !is.na(gender))          # get subset of data, where present the value of gender row

statesInfo[statesInfo$state.region = 1,]    # the same

table(reddit$gender)                        # table

by(reddit$friend_count, reddit$gender, summary)
### R markdown
# You can use markdown with R. The extension of the file will be .Rmd
```{r}
summary(mtcars) # summary - get basi info. Min, max, median and quantiles about each column.
```

# ifelse construction
cond <- mtcars$wt < 3
mtcars$weight_class <- ifelse(cond, 'light', 'average')

# Libraries
# ggplot2 - library to plot graphs.

# installation
install.packages('ggplot2')                 # install package
library(ggplot2)                            # load package

# plot the histogramm
qplot(data = reddit, x = age.range)

# plot a splitted histogram with a binwidth, breaks and scale x a axis:
qplot(x = age.range, data = reddit, binwidth = 25) + 
    scale_x_continious(limit = c(0, 1000) breaks = seq(0, 1000, 50)) + 
    facet_wrap(~gender)
