## Set working directory to main data folder, probably: ".../UCI HAR Dataset"

## Loads dplyr library
library(dplyr)

##Loads test datasets
testData <- read.table("test/X_test.txt")
testActivities <- read.table("test/y_test.txt")
testSubjects <- read.table("test/subject_test.txt")

##Loads train datasets
trainData <- read.table("train/X_train.txt")
trainActivities <- read.table("train/y_train.txt") 
trainSubjects <- read.table("train/subject_train.txt")

## Creates an "id" column for test datasets
testData <- mutate(testData, id = seq.int(nrow(testData)), .before = V1)
testActivities <- mutate(testActivities, id = seq.int(nrow(testActivities)), .before = V1)
testSubjects <- mutate(testSubjects, id = seq.int(nrow(testSubjects)), .before = V1)

## Creates an "id" column for train datasets
trainData <- mutate(trainData, id = seq.int(nrow(trainData)), .before = V1)
trainActivities <- mutate(trainActivities, id = seq.int(nrow(trainActivities)), .before = V1)
trainSubjects <- mutate(trainSubjects, id = seq.int(nrow(trainSubjects)), .before = V1)

## Renames columns for activities and subjects in test datsasets
testSubjects <- rename(testSubjects, subject = V1)
testActivities <- rename(testActivities, activity = V1)

## Renames columns for activities and subjects in train datsasets
trainSubjects <- rename(trainSubjects, subject = V1)
trainActivities <- rename(trainActivities, activity = V1)

#Merges activities and subjects into test dataset
testData <- merge(testActivities, testData, by = "id")
testData <- merge(testSubjects, testData, by = "id")

#Merges activities and subjects into train dataset
trainData <- merge(trainActivities, trainData, by = "id")
trainData <- merge(trainSubjects, trainData, by = "id")

##Removes subjects and activities dataframes
rm(testSubjects, testActivities, trainSubjects, trainActivities)

##Merges test and train datasets, reorder rows and set new id values 
fullData <- rbind(testData, trainData)
fullData <- arrange(fullData, subject, activity)
fullData <- mutate(fullData, id = seq.int(nrow(fullData)))

##Removes old datasets
rm(testData, trainData)

## Renames feature columuns in full dataset with features description file
features <- read.table("features.txt")
names(fullData)[4:564] <- features$V2

##Removes features dataset
rm(features)

##Extracts mean and standard deviation columns
finalData <- select(fullData, id, subject, activity, grep("mean\\(|std", names(fullData)))

##Removes full dataset
rm(fullData)

#Recodes activity column based on activity labels file
activityLabels  <- read.table("activity_labels.txt")
finalData <- mutate(finalData, activity = as.factor(tolower(gsub("_", "", activityLabels[activity,2]))))

##Removes activity labels dataset
rm(activityLabels)

## Adjusts variables names to make them descriptive
names(finalData) <- sub("^t", "time", names(finalData))
names(finalData) <- sub("^f", "frequency", names(finalData))
names(finalData) <- sub("Acc", "accelerometer", names(finalData))
names(finalData) <- sub("Gyro", "gyroscope", names(finalData))
names(finalData) <- sub("Mag", "magnitude", names(finalData))
names(finalData) <- sub("BodyBody", "body", names(finalData))
names(finalData) <- sub("std", "standarddeviation", names(finalData))

##Removes hyphens and parentheses form variable names
names(finalData) <- gsub("-", "", names(finalData))
names(finalData) <- sub("\\(", "", names(finalData))
names(finalData) <- sub("\\)", "", names(finalData))

## Converts all variable names to lower case
names(finalData) <- tolower(names(finalData))

## Creates a dataset with the average of each variable for activity and subject
averageData <- select(finalData, -id)
averageData <- averageData %>% 
    group_by(subject, activity) %>%
    summarize_all(mean)

## Prints the output data
print(averageData)