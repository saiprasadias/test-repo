## You should create one R script called run_analysis.R that 
## does the following.

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy 
##    data set with the average of each variable for each activity and 
##    each subject.

## READ THREE TEST DATA TABLES: VOLUNTEER, ACTIVITY, EXERCISE DATA 
## READ THREE TRAINING DATA TABLES: VOLUNTEER, ACTIVITY, EXERCISE DATA 
## READ FEATURES.TXT TO PROVIDE COLUMN NAMES FOR THE TRAING AND TESTDTA
## NAME THE DATA SET WITH DESCRIPTIVE NAMES

mynames <- read.table("~/desktop/uci har dataset/features.txt")
mynamesvector <- mynames$V2

testsubject <- read.table("~/desktop/UCI HAR Dataset/test/subject_test.txt")
names(testsubject) <- c("subject")
testdata <- read.table("~/desktop/UCI HAR Dataset/test/x_test.txt")
colnames(testdata) <- mynamesvector
testactivity <- read.table("~/desktop/UCI HAR Dataset/test/y_test.txt")
names(testactivity) <- c("activity")
testdata <- cbind(testsubject, testactivity, testdata)



trainsubject <- read.table("~/desktop/UCI HAR Dataset/train/subject_train.txt")
names(trainsubject) <- c("subject")
traindata <- read.table("~/desktop/UCI HAR Dataset/train/x_train.txt")
colnames(traindata) <- mynamesvector
trainactivity <- read.table("~/desktop/UCI HAR Dataset/train/y_train.txt")
names(trainactivity) <- c("activity")
traindata <- cbind(trainsubject, trainactivity, traindata)


##  MERGE THE TRAINING AND TEST SETS TO CREATE ONE DATA SET

totaldata <- rbind(testdata, traindata)

## USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN DATA SET

totaldata$activity <- gsub("1", "WALKING", totaldata$activity)
totaldata$activity <- gsub("2", "WALKING_UPSTAIRS", totaldata$activity)
totaldata$activity <- gsub("3", "WALKING_DOWNSTAIRS", totaldata$activity)
totaldata$activity <- gsub("4", "SITTING", totaldata$activity)
totaldata$activity <- gsub("5", "STANDING", totaldata$activity)
totaldata$activity <- gsub("6", "LAYING", totaldata$activity)

## EXTRACT ONLY MEASUREMENTS ON MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT

s1 <- grep("mean()", names(totaldata))
s2 <- grep("std()", names(totaldata))
onlymeanstd <- select(totaldata, "subject", "activity", s1, s2 )

## FROM DATA SET ABOVE CREATE A SECOND INDEPENDEDNT TIDY DATA SET 
## WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

 
 onlymeanstd %>%  group_by(activity, subject) %>% summarise_all("mean") %>%
 write.csv(file = "~/desktop/UCI HAR Dataset/exercisedata.txt")


