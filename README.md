# COURSERA getdata-011 Course Project 
## Contents

*Introduction
*R script run_analysis.R
*Code book
*References

## Introduction
This repo contains a run_analysis.R file which was written for the Course Project of the coursera getdata-011 course in February 2015.

## R script run_analysis.R

### Prerequisites
To execute the script, you will need the unzipped data available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data needs to be extracted and available in a folder called "dataset" within your working directory. The working directory should be specified in the first line of the script.

### what does run_analysis.R do?

As by the project description, the R script does the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### data returned by run_analysis.R

The script creates a tidy data set with the average of each variable for each activity and each subject of the original data set for variables containing "mean" or "std" in their name.

The script will create a text file called cleandf.txt. This file contains a data frame that can be loaded back into R using the following command:
read.table("cleandf.txt", header = T)
Note: when reading the file in, the data frame obtained will have in the first column subjects designated by integers instead of factors.

## CODE BOOK

following variables are contained in the data set:
* subject: [factor] each subject is identified by an index between 1 and 30
* activity: [factor] each subject 

The following variables are the means of the measurements from the original data set per subject and activity. 
The original data were normalised, hence they do not have units (1). For a more detailed description of the measurements please consult the README and features_info text files contained in the data set.

*tBodyAcc-mean()-X
*tBodyAcc-mean()-Y
*tBodyAcc-mean()-Z
*tGravityAcc-mean()-X
*tGravityAcc-mean()-Y
*tGravityAcc-mean()-Z
*tBodyAccJerk-mean()-X
*tBodyAccJerk-mean()-Y
*tBodyAccJerk-mean()-Z
*tBodyGyro-mean()-X
*tBodyGyro-mean()-Y
*tBodyGyro-mean()-Z
*tBodyGyroJerk-mean()-X
*tBodyGyroJerk-mean()-Y
*tBodyGyroJerk-mean()-Z
*tBodyAccMag-mean()
*tGravityAccMag-mean()
*tBodyAccJerkMag-mean()
*tBodyGyroMag-mean()
*tBodyGyroJerkMag-mean()
*fBodyAcc-mean()-X
*fBodyAcc-mean()-Y
*fBodyAcc-mean()-Z
*fBodyAcc-meanFreq()-X
*fBodyAcc-meanFreq()-Y
*fBodyAcc-meanFreq()-Z
*fBodyAccJerk-mean()-X
*fBodyAccJerk-mean()-Y
*fBodyAccJerk-mean()-Z
*fBodyAccJerk-meanFreq()-X
*fBodyAccJerk-meanFreq()-Y
*fBodyAccJerk-meanFreq()-Z
*fBodyGyro-mean()-X
*fBodyGyro-mean()-Y
*fBodyGyro-mean()-Z
*fBodyGyro-meanFreq()-X
*fBodyGyro-meanFreq()-Y
*fBodyGyro-meanFreq()-Z
*fBodyAccMag-mean()
*fBodyAccMag-meanFreq()
*fBodyBodyAccJerkMag-mean()
*fBodyBodyAccJerkMag-meanFreq()
*fBodyBodyGyroMag-mean()
*fBodyBodyGyroMag-meanFreq()
*fBodyBodyGyroJerkMag-mean()
*fBodyBodyGyroJerkMag-meanFreq()
*tBodyAcc-std()-X
*tBodyAcc-std()-Y
*tBodyAcc-std()-Z
*tGravityAcc-std()-X
*tGravityAcc-std()-Y
*tGravityAcc-std()-Z
*tBodyAccJerk-std()-X
*tBodyAccJerk-std()-Y
*tBodyAccJerk-std()-Z
*tBodyGyro-std()-X
*tBodyGyro-std()-Y
*tBodyGyro-std()-Z
*tBodyGyroJerk-std()-X
*tBodyGyroJerk-std()-Y
*tBodyGyroJerk-std()-Z
*tBodyAccMag-std()
*tGravityAccMag-std()
*tBodyAccJerkMag-std()
*tBodyGyroMag-std()
*tBodyGyroJerkMag-std()
*fBodyAcc-std()-X
*fBodyAcc-std()-Y
*fBodyAcc-std()-Z
*fBodyAccJerk-std()-X
*fBodyAccJerk-std()-Y
*fBodyAccJerk-std()-Z
*fBodyGyro-std()-X
*fBodyGyro-std()-Y
*fBodyGyro-std()-Z
*fBodyAccMag-std()
*fBodyBodyAccJerkMag-std()
*fBodyBodyGyroMag-std()
*fBodyBodyGyroJerkMag-std()

## References
(1) https://class.coursera.org/getdata-011/forum/thread?thread_id=249