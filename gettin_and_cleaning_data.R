## Getting and cleaning data with R
## From coursera Getting and Cleaning Data course

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