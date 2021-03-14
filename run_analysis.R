##
## Getting and Cleaning Data Course Project 
##  1. Merges the training and the test sets to create one data set.
##  2. Extracts only the measurements on the mean and standard deviation for each measurement.
##  3. Uses descriptive activity names to name the activities in the data set
##  4. Appropriately labels the data set with descriptive variable names.
##  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Functions

#   loadDataIntoDF is a function to load into data frames by using the format of the files
loadDataIntoDF <- function(path, cols){
    r_table <- read.delim(path, sep = "", header = FALSE, strip.white = TRUE, col.names = cols)
    dplyr_table <- tbl_df(r_table)
    dplyr_table
}

## Load Data

#Features
#   Load feature names. Two columns, index and feature name. Used as column name for the features
features <- loadDataIntoDF('data/features.txt', c('Index', 'FeatureName'))
#   Load features test data set
x_test <- loadDataIntoDF('data/test/X_test.txt', features$FeatureName)
#   Load train test data set
x_train <- loadDataIntoDF('data/train/X_train.txt', features$FeatureName)

# Activity Lables
activity_labels <- loadDataIntoDF('data/activity_labels.txt', c('Id', 'ActivityName'))
activities_test <- loadDataIntoDF('data/test/y_test.txt', c('Id'))
activities_train <- loadDataIntoDF('data/train/y_train.txt', c('Id'))

## 1) Merge the two data sets

x_merged <- bind_rows(x_test, x_train)

## 2) Extract the mean and sd for measurements

x_merged <- x_merged %>% select(matches('mean|std'))

## 3) Merge activity and labels

activity_ids <- bind_rows(activities_test, activities_train)
x_merged <- bind_cols(activity_ids, x_merged)

## 4) Labeling data with descriptive names
x_merged <- activity_labels %>% right_join(x_merged, by='Id')

## 5) Labeling data with descriptive names
#       Load subject information
subjects_test <- loadDataIntoDF('data/test/subject_test.txt', c('Subject_Id'))
subjects_train <- loadDataIntoDF('data/train/subject_train.txt', c('Subject_Id'))
subjects <- bind_rows(subjects_test, subjects_train)

#       Bind subject info, group by and summarize
x_summarized <- x_merged %>% bind_cols(subjects) %>% group_by(ActivityName, Subject_Id) %>% summarize_all(mean)

# Write table 
write.table(x_summarized, file='output/summarized_data.txt', row.names = FALSE)
