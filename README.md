# Getting-and-Cleaning-Data

I assume that the data for this project (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) is downloaded and unziped into working directory.
We need to download two additional packages : dplyr and reshape2

Steps of processing the raw data:

1. Create variables containing data from all data files (e.g. features.txt, activity_labels.txt)
2. Join the training and the test sets to create one data set. (e.g with rbind)
3. Label the data set with descriptive variable names from features.txt (second column)
4. Extract only the measurements on the mean and standard deviation for each measurement (e.g with grep function and regex pattern - I took into account all the variables that contain mean or std string, so also variables like angle(Z,gravityMean))
5. Merge activity labels (y_train / y_test) with activity name (activity_labels) and subject who performed the activity (subject_train / subject_test)
6. Rename variables for previous data set (y_all)
7. Join both sets (X_all and y_all)
8. Melt our output set for id = activity and subject
9. Cast our melted set to obtain mean for all other columns and assign it to new tidy data set
