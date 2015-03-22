#####################################################################################################################################################
# Gathering and Cleaning Data course project
# March 2015
# Using the data found here 
#        
#        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# The function run_analysis() does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####################################################################################################################################################

run_analysis <- function(){
        library(plyr)
        library(tidyr)
        library(dplyr)
        setwd("~/data-science/Getting and Cleaning Data/GCD_Course_proj")
        # download and unzip datasets
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile ="./dataset.zip", method = "curl")
        unzip("./dataset.zip", exdir="./")
        # Get raw data and prepare for merge
        testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
        trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
        subTestData <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        subTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        actTestData <- read.table("./UCI HAR Dataset/test/y_test.txt")
        actTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt")
        features <- read.table("./UCI HAR Dataset/features.txt")
        actlabel <- read.table("./UCI HAR Dataset/activity_labels.txt")
# 1. Merges the training and the test sets to create one data set.
        subject <- rbind(subTestData, subTrainData)
        activity <- rbind(actTestData, actTrainData)
        results <- rbind(testData, trainData)
# 3. Uses descriptive activity names to name the activities in the data set
<<<<<<< HEAD
        # Call to inner_join, effectively using actlabel as lookup and applying to activity list 
        namedAct <- inner_join(activity, actlabel, by="V1")
        #       Clean and add column hearders
# 4. Appropriately labels the data set with descriptive variable names. 
        featureNames <- make.unique(make.names(as.character(features$V2)))
        featureNames <- gsub("tBody", "time_", featureNames, fixed=TRUE)
        featureNames <- gsub("tGravity", "time_Gravity", featureNames, fixed=TRUE)
        featureNames <- gsub("fBody", "freq_", featureNames, fixed=TRUE)
        featureNames <- gsub("freq_Body", "freq_", featureNames, fixed=TRUE)
        featureNames <- gsub("...", "_", featureNames, fixed=TRUE)
        featureNames <- gsub("..", "", featureNames, fixed=TRUE)
        colnames(results) <- featureNames
        combined_data <- cbind(namedAct$V2, subject, results)
        colnames(combined_data)[1] <- "activity"
        colnames(combined_data)[2] <- "subject"
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
        all_data_frame <- tbl_df(combined_data)
        subset_data_frame <- all_data_frame %>% 
                select(activity, subject, contains("mean", ignore.case=FALSE), contains("std", ignore.case=FALSE), -contains("meanFreq"))
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        feature_averages_table <- subset_data_frame %>% 
                group_by(activity, subject) %>%
                summarise_each(funs(mean), 3:ncol(subset_data_frame)) 
        write.table(feature_averages_table, "feature_averages.txt", sep=" " ,row.name=FALSE, eol="\r\n")
}





=======
# Call to inner_join, effectively using actlabel as lookup and applying to activity list 
        namedAct <- inner_join(activity, actlabel, by="V1")
#       Clean and add column hearders
# 4. Appropriately labels the data set with descriptive variable names. 
        featureNames <- make.unique(make.names(as.character(features$V2)))
        colnames(results) <- featureNames
        mergeData <- cbind(namedAct$V2, subject, results)
        colnames(mergeData)[1] <- "activity"
        colnames(mergeData)[2] <- "subject"
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
        measurementData <- tbl_df(mergeData)
        measurementData %>% 
                select(activity, subject, contains("mean", ignore.case=FALSE), contains("std", ignore.case=FALSE), -contains("meanFreq"))
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        tidyTbl <- measurementData %>% 
        group_by(activity, subject) %>%
        summarise_each(funs(mean), 3:563) %>%
        print
}
>>>>>>> origin/master
