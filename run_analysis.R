
# 1. Merges the training and the test sets to create one data set
# 2. Extracts only the measurements on the mean and standard deviation for each measurement
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


# 1. Merges the training and the test sets to create one data set.

# Create a directory for all the files
if(!file.exists("./GaCd_ASSIGNMENT")){dir.create("./GaCd_ASSIGNMENT")}

# Here are all the data gathered for this project:
myfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(myfile,destfile="./GaCd_ASSIGNMENT/dsr.zip")

# Unzip dsr to ./GaCd_ASSIGNMENT directory
unzip(zipfile="./GaCd_ASSIGNMENT/dsr.zip", exdir="./GaCd_ASSIGNMENT")

# Let's read the training tables:

library(readr)

X_tr <- read.table("./GaCd_ASSIGNMENT/UCI HAR Dataset/train/X_train.txt")
Y_tr <- read.table("./GaCd_ASSIGNMENT/UCI HAR Dataset/train/y_train.txt")
Subject_tr <- read.table("./GaCd_ASSIGNMENT/UCI HAR Dataset/train/subject_train.txt")

# Let's read the testing tables too:
X_te <- read.table("./GaCd_ASSIGNMENT/UCI HAR Dataset/test/X_test.txt")
Y_te <- read.table("./GaCd_ASSIGNMENT/UCI HAR Dataset/test/y_test.txt")
Subject_te <- read.table("./GaCd_ASSIGNMENT/UCI HAR Dataset/test/subject_test.txt")

# Let's read the feature vector f:
f <- read.table('./GaCd_ASSIGNMENT/UCI HAR Dataset/features.txt')

# Let's read the activity labels (actla) too:
actla <- read.table('./GaCd_ASSIGNMENT/UCI HAR Dataset/activity_labels.txt')

# Let's assign the column names:

colnames(X_tr) <- f[,2]
colnames(Y_tr) <- "activityId"
colnames(Subject_tr) <- "subjectId"

colnames(X_te) <- f[,2] 
colnames(Y_te) <- "activityId"
colnames(Subject_te) <- "subjectId"

colnames(actla) <- c('activityId','activityType')

# Let's merge all data in one set:

merge_tr <- cbind(Y_tr, Subject_tr, X_tr)
merge_te <- cbind(Y_te, Subject_te, X_te)
merge_all <- rbind(merge_tr, merge_te)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement

# Let's read the column names:

column_names <- colnames(merge_all)

# Let's create a vector for defining ID, mean and standard deviation:

ms <- (grepl("activityId" , column_names) | 
                   grepl("subjectId" , column_names) | 
                   grepl("mean.." , column_names) | 
                   grepl("std.." , column_names) 
)

# Let's make a nessesary subset from merge_all:

s_merge_all <- merge_all[ , ms == TRUE]

# 3. Uses descriptive activity names to name the activities in the data set

av <- merge(s_merge_all, actla, by='activityId', all.x=TRUE)

# 4. Appropriately labels the data set with descriptive variable names

# We are ok with this step

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# Let's make a second tidy data set:

second_tidy <- aggregate(. ~subjectId + activityId, av, mean)
second_tidy <- second_tidy[order(second_tidy$subjectId, second_tidy$activityId),]

# Let's write the second tidy data set as a txt file:

write.table(second_tidy, "second_tidy.txt", row.name=FALSE)






