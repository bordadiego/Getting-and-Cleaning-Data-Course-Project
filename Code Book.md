# Getting and Cleaning Data Course Project
## Code Book

### Source data code books

- **data/activity_labels.txt**: List of activity identifiers and their names
- **data/features.txt**: List of feature identifiers and their names

### Process of run_analysis.R
#### Load Data

All information is loaded into dplyr data frames.

The following is data **loaded** by run_analysis.R:

- **data/test/subject_test.txt**: List of subject identifiers for each of the test measurements
- **data/test/X_test.txt**: Raw measurements for test dataset
- **data/test/y_test.txt**: Labels for each of the measurements of the test dataset
- **data/train/subject_train.txt**: List of subject identifiers for each of the train measurements
- **data/train/X_train.txt**: Raw measurements for train dataset
- **data/train/y_train.txt**: Labels for each of the measurements of the train dataset

The script performs the following:

1. Load information
1. Merge test and train data
1. Select the columns containing mean and std (Standard Deviation) 
1. The dataset is merged with the activity label column
1. A join is performed to add descriptive label data. The resulting column is named 'FeatureName'
1. Loading the subject identifier. The new column name is 'Subject_Id'
1. Merged the subject indefier, group by subject identifier and activity type. The dataset is then aggregated using the mean function.

#### Output

- **output/summarized_data.txt**: output of the final summarized dataset.



