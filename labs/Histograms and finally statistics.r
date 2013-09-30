# TODO: Test, when the data set will be available

# Check your working directory
getwd()
# Set your work directory
setwd("/path")

# If necessary, install packages
install.packages("psych")
install.packages("sm")

# Load packages
library(psych)
library(sm)

# Read data into a dataframe called impact
impact <- read.table("file-path.txt", header = T)

# Get the dimensions of the dataframe
dim(impact)
nrow(impact)
ncol(impact)

# Open data editor
edit(impact)

# Object types
class(impact)
names(impact)

class(impact$verbal_memory_baseline)
class(impact$reatcion_time_baseline)
class(impact$subject)

# Change class of veriable $subject
impact$subject <- factor(impact$subject)
class(impact$subject)

# Summary statistics
mean(impact$verbal_memory_baseline)
sd(impact$verbal_memory_baseline)

describe(impact)

describeBy(impact, impact$condition)

# Subsetting
edit(impact)

control <- subset(impact, impact[, 2]=="control")
control

concussed <- subset(impact, impact[, 2]=="concussed")
concussed

# Histograms of control group at baseline
pow(mfrow = c(2,3)) # To view 6 histograms on one page
hist(control[, 3], xlab = "Verbal memory", main = "")
hist(control[, 4], xlab = "Visual memory")
hist(control[, 5], xlab = "Visual motor speed")
hist(control[, 6], xlab = "Reaction time")
hist(control[, 7], xlab = "Impulse control")
hist(control[, 9], xlab = "Total system score")

# To demonstrate thtere is more than one way to access a veriable
par(mfrow = c(1,2)) # To view 2 histograms on one page
hist(control[, 3], xlab = "Verbal memory", main = "")
hist(control$verbal_memory_baseline, xlab = "Verbal memory", main = "")

# Density plots
par(mfrow = c(1,2))
hist(concussed[, 14], xlab = "Total symptom score", main = "")
plot(density(concussed[, 14]), xlab = "Total symptom score", main = "")

# Compare density plots
par(mfrow = c(1,1))
sm.density.compare(impact$total_symptom_retest,
                   impact$condition, xlab = "Total symptom score")