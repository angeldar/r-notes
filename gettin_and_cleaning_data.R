## Data cleaning with R
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