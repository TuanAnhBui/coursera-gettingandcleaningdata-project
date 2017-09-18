# Getting and Cleaning Data Project
This repo is meant for the final project of the module "Getting and Cleaning data" in Coursera.

## Original Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data can be downloaded by the link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Tidy Data
The original data had been transformed by using scripts in r_analysis.r file by following the instruction:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Details
Repo containing 4 files:
1. README.md: this file gives a brief information about the project
2. CodeBook.md: this contains a fully description of variables
3. r_analysis.r: this contains scripts for getting and cleaning data and exporting required data set.
4. 2nd_tidy_data.txt: the required tidy data set
