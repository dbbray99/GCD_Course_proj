# Getting and Cleaning Data Course Project
## Code Book for function run_analysis() used for this course project.
## Assumptions
The README.md file describes the methodology used to perform the data analysis and cleaning.
The documents provided with the original data set should be used to describe the variables and computational theories applied to the original data. This code book will therefore not attempt to redefine or recreate those definitions. This code book will describe the variables, the data, and the transformations I have used during this project.  
## Data Frames 
 - testData - stores test result data  
 - trainData - stores train result data  
 - subTestData - stores the subject test data  
 - subTrainData - stores the subject train data  
 - actTestData - stores the activity test data  
 - actTrainData  - stores the activity train data  
 - features  - stores the list of features tested  
 - actlabel - stores the activity to code mapping  
 - combined_data - stores the final combined data set comprising the "subject", "activity" and "results" data sets  
 - all_data_frame -  Table created based on combined data sets for the purpose of final data summarization  
 - subset_data_frame - uses "all_data_frame" for the creation of the subset data based on ?mean? and ?standard deviation? variables only. See table 1 for selected fields  
## Preliminary Combined Data
 - subject - stores the combined subject test and train data sets
 - activity - stores the combined activity test and train data sets
 - results - stores the combined test results
 - namedAct - uses ?activity? and ?actlabel?, creates activity name to activity number mapping
# Methodology used for the creation of ?appropriate? data set variable names 
To create variable names that were somewhat more descriptive the following changes and assumptions were made. 
featureNames ? used to hold the modified variable feature names derived by the following and applied to the ?results? data frame to replace the original column variable names;
- The word ?body? was redundant and in fact repeated multiple times in many cases so should be removed to shorten the variable name.
- The letter ?t? used at the beginning of many variable names should be replaced with the word ?time? to improve understanding.
- The letter ?f? used at the beginning of many variable names should be replaced with the word ?frequency? (abbreviated to ?freq?) to improve understanding.
- Insert underscore (?_?) to improve readability
- Remove dots (??? ) to reduce variable length and improve understanding
## Final Tidy Data Output
A data subset is created for columns related to mean and standard deviation. This reduces to the number of columns from the original 561 down to 66, two additional columns for activity and subject are created making a final data set with 68 columns.
The final step sees the data summarized by the average (mean) for each of the subset columns by "activity" and "subject". This creates an output file where each row represents an activity (6) for each subject (30) across the selected "feature" columns (mean and std).
feature_averages.txt ? final output file

## Modified Column Names


