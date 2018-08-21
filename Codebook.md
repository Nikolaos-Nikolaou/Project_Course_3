## Getting and Cleaning Data - peer assessment project

## The original data was transformed by the following steps:

  1. Merging the training and the test sets to create one data set.
  2. Extracting only the measurements on the mean and standard deviation    for each measurement. 
  3. Using descriptive activity names to name the activities in the data    set
  4. Appropriately labeling the data set with descriptive activity names. 
  5. Creating a second, independent tidy data set with the average of each   variable for each activity and each subject. 

## About R script
  File with R code "run_analysis.R" perform 5 following steps (in   accordance assigned task of course work):

  1. Merging the training and the test sets to create one data set.
  2. Extracting only the measurements on the mean and standard deviation    for each measurement. 
  3. Using descriptive activity names to name the activities in the data    set
  4. Appropriately labeling the data set with descriptive activity names. 
  5. Creating a second, independent tidy data set with the average of each    variable for each activity and each subject. 
  
## About variables:   
  * `X_tr`, `Y_tr`, `X_te`, `Y_te`, `Subject_tr` and `Subject_te` contain   the data from the downloaded files.
  * `X_data`, `Y_data` and `Subject_data` merge the previous datasets to    further analysis.
  * `f` contains the correct names for the `X_data` dataset, which are      applied to the column names stored in
