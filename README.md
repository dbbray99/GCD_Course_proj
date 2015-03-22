# Getting and Cleaning Data
## Course Project Objective
The purpose of this project repository is to demonstrate my ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis.
As per the course directive the R script called run_analysis.R does the following;   
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, I have created a second, independent tidy data set with the average of each variable for each activity and each subject.

## Methodology
Descriptions of the original data are provided in the following files;
 - activity_labels.txt: provides a lisitng of the 6 activities the test subjects were asked to perform and links the class labels with their activity name.
 - features.txt: provides a list of the original list of features tested.
 - features_info.txt: Shows information about the variables used on the feature vector.
 - README.txt: The original overall description file for the core data.  

It's is highly recommended that you familiorize yourself with this information before proceeding

The function run_analysis() downloads the zip file from the provided URL location and extracts the data into the current working directory. Files are extracted and loaded into a series of data frames and prepared for combining into a single data set. (Note I chose not do load and merge the inertia signal data sets for both train and test as this data is ultimatly removed in later steps anyway).

Once all files have been loaded, rbind is used to combine the data into three areas, subject, activity and results. Appropriate activity names are merged and a series of actions are performed to create more meaningful column names before all data sets are combined. 

A data subset is created for columns releated to mean and standard deviation. This reduces to the number of columns from the originla 561 to 66, two additonal columns for activity and subject are created making a final data set with 68 columns.

The final step sees the data summarized by the average (mean) for each of the subset columns by "activity" and "subject". This creates an output file where each row represets an activity (6) for each subject (30) across the selected feature columns (mean and std).

## Data Dictionary
A details that describes the variables, the data, and the transformations used to clean up the data is provided in the file CodeBook.md.

