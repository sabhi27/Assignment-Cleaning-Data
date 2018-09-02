# Assignment-Cleaning-Data
Getting and Cleaning Data Course Projectless The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Code

#Reading data

X_train <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/train/X_train.txt") Y_train <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/train/y_train.txt") X_test <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/test/X_test.txt") Y_test <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/test/y_test.txt") Sub_train <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/train/subject_train.txt") Sub_test <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/test/subject_test.txt") variable_names <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/features.txt") activity_labels <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/activity_labels.txt")

#Question 1 X <- rbind(X_train,X_test) Y <- rbind(Y_train,Y_test)

#Question 2

selected_var <- variable_names[grep("mean\(\)|std\(\)",variable_names[,2]),] X <- X[,selected_var[,1]]

#Question 3 colnames(Y) <- "activity" Y$activitylabel <- factor(Y$activity, labels = as.character(activity_labels[,2])) activitylabel <- Y[,-1]

#Question 4 colnames(X) <- variable_names[selected_var[,1],2] head(X)

#Question 5 Sub_train <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/train/subject_train.txt") Sub_test <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/test/subject_test.txt") Sub<- rbind(Sub_train,Sub_test) colnames(Sub) <- "subject" total <- cbind(X, activitylabel, Sub) total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_all(funs(mean)) write.table(total_mean, file = "D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
