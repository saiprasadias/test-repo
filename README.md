## SCRIPT FOR run_analysis.R
## The R script called run_analysis.R does the following......

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable namesfrom the features.txt file
## 5. From the data set in step 4, creates a second, independent tidy 
##    data set with the average of each variable for each activity and each subject.

## The script starts by reading the THREE TEST DATA TABLES: VOLUNTEER, ACTIVITY, EXERCISE DATA 
## and the THREE TRAINING DATA TABLES: VOLUNTEER, ACTIVITY, EXERCISE DATA 
## READ FEATURES.TXT TO PROVIDE COLUMN NAMES FOR THE TRAING AND TESTDTA
## Using the names extracted from festures.txt the training and test data set columns are provided DESCRIPTIVE NAMES

##  Therafter, the TRAINING AND TEST SETS are merged to create ONE DATA SET
##  totaldata <- rbind(testdata, traindata)

## USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN DATA SET
## Descriptive names are provided for the six different activities performed by the subjects.
## the following code is used
## totaldata$activity <- gsub("1", "WALKING", totaldata$activity)
## totaldata$activity <- gsub("2", "WALKING_UPSTAIRS", totaldata$activity) 
## etc
## EXTRACT ONLY MEASUREMENTS ON MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT

## s1 <- grep("mean()", names(totaldata))
## s2 <- grep("std()", names(totaldata))
## onlymeanstd <- select(totaldata, "subject", "activity", s1, s2 )

## FROM DATA SET ABOVE CREATE A SECOND INDEPENDEDNT TIDY DATA SET 
## WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

## onlymeanstd %>%  group_by(activity, subject) %>% summarise_all("mean") %>%
## write.csv(file = "~/desktop/UCI HAR Dataset/exercisedata.txt")
## The tidy data set is written as exercisedata.txt

CODEBOOK

THE ACTIVITY LABELS ARE 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

THERE ARE 30 SUBJECTS WHO PERFORMED THE SIX ACTIVITIES ABOVE.

The column names of the tidy data set obtained after running the script
are as given given below

 [1] "activity"                        "subject"                        
 [3] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
 [5] "tBodyAcc-mean()-Z"               "tGravityAcc-mean()-X"           
 [7] "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
 [9] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
[11] "tBodyAccJerk-mean()-Z"           "tBodyGyro-mean()-X"             
[13] "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
[15] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[17] "tBodyGyroJerk-mean()-Z"          "tBodyAccMag-mean()"             
[19] "tGravityAccMag-mean()"           "tBodyAccJerkMag-mean()"         
[21] "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"        
[23] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[25] "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"          
[27] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"          
[29] "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
[31] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"      
[33] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[35] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
[37] "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"         
[39] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"         
[41] "fBodyAccMag-mean()"              "fBodyAccMag-meanFreq()"         
[43] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()" 
[45] "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"    
[47] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-meanFreq()"
[49] "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"               
[51] "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"            
[53] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[55] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"           
[57] "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"              
[59] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[61] "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"          
[63] "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"              
[65] "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"          
[67] "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"         
[69] "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
[71] "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"           
[73] "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"           
[75] "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
[77] "fBodyGyro-std()-Z"               "fBodyAccMag-std()"              
[79] "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"         
[81] "fBodyBodyGyroJerkMag-std()"

THE ORIGINAL DATA SET
The features selected for the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz, filtered with a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 



These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
and others. 
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
