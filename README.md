Getting-and-cleaning-data assignment 2
======================================
The code in run_analysis.R follows the steps outlined in the instructions for the assigment 2 for course Getting and cleaning data.
Each step in the code is annotated and explained in the .R file itself.

The steps in the code:

1) Set working directory to where the datasets are saved
2) Read the data for test (y_test, subject_test, X_test) and create column names activity and id
3) Read the data for train (y_train, subject_train, X_train)  and create column names activity and id
4) Merge the training and the test sets to create one data set, starting with id, activity and data
5) Read features data
6) create data frame that retains mean and std from features.txt
7) select only mean and sd from the data
8) read activity list
9) replace activity column in data2 with activity names
10) load library dplyr that allows selecting columns
11) select columns with the data
12) name the columns
13) label columns with descriptive variable names
14) create a tidy data set with the average of each variable for each activity and each subject.
15) Create file with tidy data


