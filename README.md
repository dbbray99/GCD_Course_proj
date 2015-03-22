# Getting and Cleaning Data
## Course Project Objective
The purpose of this project repository is to demonstrate my ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis.
As per the course directive the R script called run_analysis.R does the following; 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, I have created a second, independent tidy data set with the average of each variable for each activity and each subject.

## Methodology
Descriptions of the original data are provided in the following files;
 - activity_labels.txt: provides a lisitng of the 6 activities the test subjects were asked to perform and links the class labels with their activity name.
 - features.txt: provides a list of the original list of features tested.
 - features_info.txt: Shows information about the variables used on the feature vector.
 - README.txt: The original overall description file for the core data.
### It's is highly recommended that you familiorize yourself with this information before proceeding

The function run_analysis() downloads the zip file from the provided URL location and extracts them into the current working directory. Files are extracted and loaded into a series of data frames and prepared for combining int a single data set. I chose not do download and merge the inertia signal data sets for both the train and test 

