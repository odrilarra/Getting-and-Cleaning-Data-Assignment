#################################################################
## PART 1: Set working directory and install required packages ##
#################################################################

## Set working directory
setwd("/Users/odrilarra/Documents/APUNTEAK/Coursera/3.Getting and Cleaning Data/ASSIGNMENT/UCI 
      HAR Dataset")     # Change as required

## Install required packages
install.packages("dplyr")

#######################################
## PART 2: Merge train and test sets ##
#######################################

## Load datasets
# Load training set
XTrain <- read.table("train/X_train.txt")
dim(XTrain)     #[1] 7352  561
# Load training labels
YTrain <- read.table("train/y_train.txt")
dim(YTrain)     #[1] 7352    1
# Load training subject
SubjectTrain <- read.table("train/subject_train.txt")
dim(SubjectTrain)       #[1] 7352    1
# Load test set
XTest <- read.table("test/X_test.txt")
dim(XTest)      #[1] 2947  561
# Load test labels
YTest <- read.table("test/y_test.txt")
dim(YTest)      #[1] 2947    1
# Load test subject
SubjectTest <- read.table("test/subject_test.txt")
dim(SubjectTest)       #[1] 2947    1

## Merge the training and test sets to create one dataset
mergedData <- rbind(XTrain,XTest)
mergedActivity <- rbind(YTrain,YTest)
mergedSubsects <- rbind(SubjectTrain,SubjectTest)

#################################################################
## PART 3: Extract measurements on mean and standard deviation ##
#################################################################

## Load features.txt to assign colnames to mergedData
features <- read.table("features.txt")
dim(features)
head(features)

## Assign variable names to mergedData
colnames(mergedData) <- features[,2]

## Extract measurements on mean and standard deviations
narrowData <- mergedData[,grepl("mean\\(\\)",names(mergedData))|grepl("std\\(\\)",names(mergedData))]
names(narrowData)

############################################
## PART 4: Use descriptive activity names ##
############################################
mergedActivity[mergedActivity==1] <- "WALKING"
mergedActivity[mergedActivity==2] <- "WALKING_UPSTAIRS"
mergedActivity[mergedActivity==3] <- "WALKING_DOWNSTAIRS"
mergedActivity[mergedActivity==4] <- "SITTING"
mergedActivity[mergedActivity==5] <- "STANDING"
mergedActivity[mergedActivity==6] <- "LAYING"

###################################################
## PART 5: Label with descriptive variable names ##
###################################################
## Create one data frame with mergedSubjects mergedActivity and narrowData
uniqueDF <- data.frame(Subject=mergedSubsects$V1,Activity=mergedActivity$V1,narrowData) 

## Descriptive variable names were set in a previous step. 
names(uniqueDF)

#############################################################################################
## Part 6: Create tidy data set with the average of each variable for activity and subject ##
#############################################################################################
library(dplyr)

groupedDF <- group_by(uniqueDF,Subject,Activity)
mean(groupedDF)
tidyDF <- groupedDF %>% 
        summarise_each(funs(mean)) 
View(tidyDF)
