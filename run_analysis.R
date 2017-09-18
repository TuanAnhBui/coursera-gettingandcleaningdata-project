library(dplyr)

# Workspace should been set to a appropriate folder
# Check if the data has already been downloaded

if (!file.exists("UCI HAR Dataset")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "data.zip",method="curl")
  unzip("data.zip")
  if (!file.exists("UCI HAR Dataset")) {
    stop("Problem with loading data")
  }
}
print("Data has been downloaded")

# Load data sets and assign them to variables

# Training sets
x_train<-read.table("./UCI HAR Dataset/train/x_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
# Test sets
x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
# Features
features<-read.table("./UCI HAR Dataset/features.txt")
# Activities
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")

# STEP 1. Merges the training and the test sets to create one data set.
x_full<-rbind(x_train,x_test)
y_full<-rbind(y_train,y_test)
subject_full<-rbind(subject_train,subject_test)

# STEP 2. Extracts only the measurements on the mean 
#         and standard deviation for each measurement.

# Extract the mean and std features
features_needed<-grep("-(mean|std)\\(\\)", features[, 2])
# Extract the values of the needed features
x_needed<-x_full[,features_needed]

# STEP 3. Uses descriptive activity names to name the activities in the data set

descriptive_activity<-data.frame(activity=lapply(y_full,function(i){activities[i,2]}))
names(descriptive_activity)<-c("activity")


# STEP 4. Appropriately labels the data set with descriptive variable names.
names(subject_full)<-c("subject")
names(x_needed)<-features[features_needed,2]
dataset<-cbind(subject_full,descriptive_activity,x_needed)

# STEP 5. From the data set in step 4, creates a second, independent tidy data set 
#         with the average of each variable for each activity and each subject.

by_activity_subject<-group_by(dataset,activity,subject)
second_dataset<-summarize_each(by_activity_subject,funs(mean))

# write the second tidy data set to a text file
write.table(second_dataset,"2nd_tidy_data.txt",row.names = FALSE,quote = FALSE,sep = "\t")


# Set the workspace backward to prevent creating data set in the next run
# setwd('..')
