## Getting and cleaning data with R
## From coursera Getting and Cleaning Data course

### Reading data

## Get working directory
getwd()

## Set working directory
setwd('./data')

## Checking for and creating directories
if (!file.exists('directoryName')) {
	dir.create('directoryName')
}

## Getting data from the internet
download.file(fileUrl, destfile = './data/cameras.csv', method = 'curl')
list.files('./data')
dateDownloaded <- date()

## Reading local files
cameraData <- read.table('data/cameras.csv', sep = ',', header = TRUE)
cameraData <- read.csv('data/cameras.csv')

## Reading Excel files
library(xlsx)
cameraData <- read.xlsx('data/camera.xlsx', sheetIndex=1, header = TRUE)
colIndex <- 1:4
rowIndex <- 2:3
cameraData <- read.xlsx('data/camera.xlsx', sheetIndex=1, header = TRUE,
	colIndex = colIndex, rowIndex = rowIndex)

## Reading XML
library(XML)
fileUrl <- 'www.example.com/simple.xml'
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]                 # access 1st element
rootNode[[1][[1]]]            # access first subcomponent of first subcomponent
xmlSApply(rootNode, xmlValue) # apply xmlValue function to all nodes in rootNode
xpathSApply(rootNode, '//name', xmlValue)

## Reading JSON
library(jsonlite)
jsonData <- fromJSON('https://example.com/path/to/json')
names(json)
names(jsonData$owner)
myjson <- toJSON(data, pretty = TRUE)
cat(myjson)
head(jsonData)

## Reading data from the web
con = url('http://website.com/article')
htmlCode = readLines(con)
close(con)
htmlCode

library(httr); html2 = GET(url)
content2 = content(html2, as='text')
parsedHtml = htmlParse(content2, asText=TRUE)
xpathSApply(parsedHtml, '//title', xmlValue)

pg2 = GET('http://website.com/login', authenticate('user', 'passwd'))

google = handle('http://google.com')
pg3 = GET(handle=google, path='/')

## Reading data from APIs
myapp = oauth_app('twitter', key='consumerKey', secret='consumerSecret')
sig = sign_oauth1.0(myapp, token='token', token_secret='token_secret')
homeTL = GET('https://api.twitter.com/1.1/statuses/home_timeline.json', sig)


### Working with data

## Summirizing data
# Look at a bit of data
head(resData, n = 3)
tail(restData, n = 3)
summary(resData)
str(resData)

# Quantiles of quantitative variables
quantile(resData$councilDistrict, na.rm = TRUE)

# Make table
table(resData$zipCode, useNA="ifany")
table(restData$councilDistrict, resData$zipCode)

# Check for missing values
sum(is.na(resData$councilDistrict))
any(is.na(resData$councilDistrict))
all(resData$zipCode > 0)

# Rows and colums sums
colSum(is.na(resData))
all(colSum(is.na(resData))==0)

# Values with specific characteristics
table(resData$zipCode %in% c("12345", "12543"))
resData[resData$zipCode %in% c("12345")]

# Cross tabs
data(UCBAdmissions)
df = as.data.frame(USBAdmissions)
summary(df)
xt <- xtabs(Freq ~ Gender + Admit, data = df)

# Flat tables
warpbreaks$replicate <- rep(1:9, len=54)
xt = xtabs(breaks ~., data=warpbreaks)
ftable(xt)

# Size of dataset
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")


## Creating new variables
# Creating sequences
s1 <- seq(1,10,by=2) # 1 3 5 7 9
s2 <- seq(1,10,length=3) # 1.0 5.5 10.0
x <- c(1,3,8,25,100); seq(along = x) # 1 2 3 4 5

# Subsetting variables
restData$nearMe = restData$neirghborthood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# Creating binary variables
resData$zipWrong = ifelse(resData$zipCode < 0, TRUE, FALSE)
table(resData$zipWrong, resData$zipCode < 0)

# Creating categorical variables
resData$zipGroups = cut(resData$zipCode, breaks=quantile(resData$zipCode))
table(resData$zipGroups)

# Creating factor variables
resData$zcf <- factor(resData$zipCode)

# Levels of factor veriables
yesno <- sample(c("yes", "no"), size = 10, replace=TRUE)
yesnofac = fatcor(yesno, levels=c("yes", "no"))
releal(yesnofac, ref="yes") # change factor to numeric
as.numeric(yesnofac) # another way to change factor to numeric


## Reshaping data
# Melting data frames
library(reshape2)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))

# Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData <- dcast(carMelt, cyl ~ variable, mean)

# Averaging values
tallpy(InsectSpray$count, InsectSpray$spray, sum)
# Another way
spIns = split(InsectSpray$count, InspectSpray$spray)
sprCount = lapply(spIns, sum)
# Another way
ddply(InspectSpray, .(spray), summarize, sum=sum(count)) # require dplyr


## Managing Data Frames with dplyr
# select filter arrange rename mutate summirise
# The first arg is a data frame
# The subsequent arguments describe what to do with it.
# The result is a new dataframe.


## Managing data with dplyr - Basic Tools
chicago <- readRDS("chicago.rds")

# Select function
head(select(chicago, city:dptp))
head(seelct(chicage, -(city:dptp)))

# Filter function
chic.g <- filter(chicage, pm25tmean2 > 30)

# Arrange function
chicago <- arrange(chicago, date)
chicago <- arrange(chicago, desc(date)) # descending order.

# Rename function
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)

# Mutate function
chicago <- mutate(chicago, pm25detrend = pm25-mean(pm25, na.rm = TRUE) )

## Mergin data
mergedData = merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)


## Edititng text variables
# Fixin character vectors
tolower(names(cameralData))
splitNames <- strsplit(names(cameraData), '\\.')
sub("_", "", names(reviews),) # replace first
gsub("_","") # replace all

# Finding values
grep("Alameda", cameraData$intersection)
table(grepl("Amaleda", cameraData$intersection))

# Usefule string functions
library(stringr)
nchar("Jeffrey")
substr("Jeffrey Leek", 1, 7)
paste("Hello", "world!")
str_trim("OpenData     ")


## Working with datas
d1 = date()
d2 = Sys.Date()
format(d2, "%a %b %d")
z = as.Date(x, "%d%b%Y")
weekdays(d2)
months(d2)
julian(d2)

library(lubridate)
ymd("20140108")