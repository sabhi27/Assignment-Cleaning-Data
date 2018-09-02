X_train <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/train/X_train.txt")
Y_train  <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/train/y_train.txt")
X_test <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/test/X_test.txt")
Y_test  <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/test/y_test.txt")
Sub_train <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/train/subject_train.txt")
Sub_test <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/test/subject_test.txt")
variable_names <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/features.txt")
activity_labels <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/activity_labels.txt")

#Question 1
X <- rbind(X_train,X_test)
Y <- rbind(Y_train,Y_test)

#Question 2

selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X <- X[,selected_var[,1]]

#Question 3
colnames(Y) <- "activity"
Y$activitylabel <- factor(Y$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y[,-1]

#Question 4
colnames(X) <- variable_names[selected_var[,1],2]
head(X)

#Question 5
Sub_train <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/train/subject_train.txt")
Sub_test <- read.table("D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/test/subject_test.txt")
Sub<- rbind(Sub_train,Sub_test)
colnames(Sub) <- "subject"
total <- cbind(X, activitylabel, Sub)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_all(funs(mean))
write.table(total_mean, file = "D:/Work/0_Online Courses/Data Science tool box/Cleaning Data - Week 4/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)