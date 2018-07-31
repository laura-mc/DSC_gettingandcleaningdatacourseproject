# Load packages -----------------------------------------------------------
library(dplyr)
library(plyr)
library(tidyr)


# Read data ---------------------------------------------------------------
directory <- getwd()
features <- read.table(paste(directory, "/features.txt",sep=""))
x_train <- read.table(paste(directory, "/train/X_train.txt",sep=""))
y_train <- read.table(paste(directory,"/train/y_train.txt",sep=""))
subject_train <- read.table(paste(directory,"/train/subject_train.txt",sep=""))
x_test <- read.table(paste(directory,"/test/X_test.txt",sep=""))
y_test <- read.table(paste(directory,"/test/y_test.txt",sep=""))
subject_test <- read.table(paste(directory,"/test/subject_test.txt",sep=""))


# Set colnames ------------------------------------------------------------
colnames(x_train) <- as.character(features[,2])
colnames(x_test) <- as.character(features[,2])
colnames(y_train) <- "y"
colnames(y_test) <- "y"
colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"


# Merge training and test sets --------------------------------------------
x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test) 


# Extract measurements on the mean and standard deviation -----------------
x_mean_set <- select(data.frame(x), contains('mean'))
x_std_set <- select(data.frame(x), contains('std'))
x_stat <- cbind(x_mean_set,x_std_set)


# Name the activities and bind data ---------------------------------------
activities <- read.csv(paste(directory, "/activity_labels.csv",sep=""),header=FALSE, sep=";")
colnames(activities) <- (c("y","activity"))
Activity <- join(y,activities, by="y")
Activity$y <- NULL

data <- cbind(Activity,subject,x_stat)


# Label data --------------------------------------------------------------
colnames(data) <- sub("[.]{2,4}",".",colnames(data))      ##remove duplicated dots
colnames(data) <- sub("[.]$","",colnames(data))           ##remove dot at the end of the name
colnames(data) <- gsub("([a-z])([A-Z])","\\1.\\2",colnames(data))   ##separate words with dots


# Average of each variable for each activity and each subject -------------
grouped_data <- group_by(data,activity,subject)
avgd_data <-summarise_all(grouped_data, mean)
write.table(avgd_data, file=paste(directory, "/tidy_data.txt",sep=""), row.names = FALSE, col.names = TRUE)
