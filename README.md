# Getting and Cleaning Data Course Project
## Programming Assignment: Getting and Cleaning Data Course Project

Course project for the course *Getting and Cleaning Data Course Project*

### The project consists of performing the following tasks

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The project uses the dataset in [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) that is described in [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### The project consists of the following files

The following provides a list of the important files included:

#### Data Inputs

- **data/activity_labels.txt**: List of activity identifiers and their names
- **data/features.txt**: List of feature identifiers and their names
- **data/test/subject_test.txt**: List of subject identifiers for each of the test measurements
- **data/test/X_test.txt**: Raw measurements for test dataset
- **data/test/y_test.txt**: Labels for each of the measurements of the test dataset
- **data/train/subject_train.txt**: List of subject identifiers for each of the train measurements
- **data/train/X_train.txt**: Raw measurements for train dataset
- **data/train/y_train.txt**: Labels for each of the measurements of the train dataset

#### R Scripts

- **run_analysis.R**: Script to get and clean the data

#### Output

- **output/summarized_data.txt**: output of point 5.



