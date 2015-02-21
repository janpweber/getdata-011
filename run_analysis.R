setwd("INSERT YOUR WORKING DIRECTORY HERE")

library(plyr) # causes problems with group_by from dplyr package; will be detached before then
library(dplyr)

## 1. Merge the training and the test sets to create one data set.
## the dataframe will be called "df"

##read the train data set
trainData <- readLines("./dataset/train/X_train.txt")
trainSubjects <- readLines("./dataset/train/subject_train.txt")
trainActivities <- readLines("./dataset/train/y_train.txt")
# trainData = long vector: measurements separated by spaces
# trainSubjects = number corresponding to one of the 30 test subjects (here 21 levels, =70%)
# trainActivities = number corresponding to one of the 6 possible activities

## make a dataframe by joining the above training data: 
df_training <- as.data.frame(cbind(trainData, trainSubjects, trainActivities))

## same procedure with the test data set:
testData <- readLines("./dataset/test/X_test.txt")
testSubjects <- readLines("./dataset/test/subject_test.txt")
testActivities <- readLines("./dataset/test/y_test.txt")

df_test <- as.data.frame(cbind(testData, testSubjects, testActivities))

## assign the same variable names to both data frames, making merging easy 
names(df_test) <- c("rawdata", "subject", "activity")
names(df_training) <- c("rawdata", "subject", "activity")

## join train and test data sets:
df<- rbind(df_training, df_test)


## 2. Extract only the measurements on the mean and standard deviation for each measurement. 

## extract feature names and where they are in the rawdata vector (index)
features <- readLines("./dataset/features.txt") # reads the 561 feature labels for the raw data
meanindex<- grep("mean()", features)            # 46 features contain "mean", including "meanFreq()"
stdindex <- grep("std()", features)             # 33 features contain "std()"

## set-up of empty data frames that will be filled with mean and std data
meanframe <- data_frame()
stdframe  <- data_frame()

## the following loop will go through each observation of df
## will fill up the data frames containing only data for means and std of the original data set

endloop   <- length(df[,1]) 
for(i in 1:endloop){
        tempvec <- unlist(strsplit(as.character(df[i,1]), " ")) ## splits "rawdata" into numbers, however creates some empty fields
        tempvec <- as.numeric(tempvec) ## converts the strings into numbers, introduces NAs in empty fields
        tempvec <- tempvec[!is.na(tempvec)] ## removes NAs --> gives a vector with all (561) measurements
        
        ## need to extract the values for the means:
        j <- 1 
        for(k in meanindex){ # for every item in meanindex, hence should run 46 times
                meanframe[i,j] <- tempvec[k]
                j<- j+1
        }
        
        ## need to extract the values for the standard deviations:
        j <- 1
        for(k in stdindex){ # for every item in meanindex, hence should run 46 times
                stdframe[i,j] <- tempvec[k]
                j<- j+1
        }
}

## merge the original data frame with the data frames containing the separated variables
df <- cbind(df, meanframe, stdframe)

## 3. Use descriptive activity names to name the activities in the data set
## I did it manually, but you could of course also read these values automatically 
## from activity_labels.txt
df$activity <- revalue(df$activity, c("1" = "walking",
                       "2" = "walkingUpstairs",
                       "3" = "walkingDownstairs",
                       "4" = "sitting",
                       "5" = "standing",
                       "6" = "laying"))

## 4. Appropriately label the data set with descriptive variable names. 
## need to extract the names from the features vectors and add them to the df data_frame

meannames <- features[grep("mean()", features)] # returns the names of the mean data
meannames <- sub("[0-9]{1,3} ", "", meannames)  # removes the leading 1-3 digits
stdnames  <- features[grep("std()" , features)] # returns the names of the std data
stdnames <- sub("[0-9]{1,3} ", "", stdnames)    # removes the leading 1-3 digits

## assign the names to df; 
## preserve the names of the original df before amending means and std (columns 1:3)
names(df) <- c(names(df[,1:3]), meannames, stdnames)

## 5. From the data set in step 4, create a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

detach(package:plyr) # otherwise the next command does not properly "group_by"

#this job is actually very easy using the dplyr package
clean_df <- df %>%  
        select(-rawdata) %>%
        group_by(subject, activity) %>% 
        summarise_each(funs(mean))

## write a .txt file with the clean data frame to the workspace directory
write.table(clean_df, "cleandf.txt", row.name = F)

## to read that last file in:
## CAUTION: subject column is integers not classes (as in the original)
finaltable <- read.table("cleandf.txt", header = T)