###########################################
#                                         #
# GETTING AND CLEANING DATA -assignment 2 #
#                                         #
###########################################

# Set working directory to where the datasets are saved
setwd("C:/Users/.../UCI HAR Dataset")

# Read the data for test and create column names
label.test <- read.table("test/y_test.txt", col.names ="activity")
subject.test <- read.table("test/subject_test.txt", col.names = "id")
data.test <- read.table("test/X_test.txt")

# Read the data for train
label.train <- read.table("train/y_train.txt", col.names = "activity")
subject.train <- read.table("train/subject_train.txt", col.names = "id")
data.train <- read.table("train/X_train.txt")


# STEP 1: Merge the training and the test sets to create one data set, starting with id, activity and data

data <- rbind(cbind(subject.test, label.test, data.test),
              cbind(subject.train, label.train, data.train))


# STEP 2: Extract only the measurements on the mean and standard deviation for each measurement:

features <- read.table("features.txt", header=FALSE) # Read features data
mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ] # retains mean and std from features.txt
data2 <- data[, c(1, 2, mean.std$V1+2)] # Selects only mean and sd from the data


# STEP3: Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt", stringsAsFactors=FALSE) # read activity list
data2$activity <- factor(data2$activity, 
                         levels = c(activities$V1),
                         labels = c(activities$V2)) # replace activity column in data2 with activity names


# STEP 4: Appropriately label the data set with descriptive variable names

library(dplyr) # load library dplyr that allows selecting columns
data3 <- select(data2, id, activity, V1, V2 ) # select columns with the data
columns<- c("id", "activity", "mean", "sd") #name the columns
colnames(data3) <- columns #label with descriptive variable names


# STEP 5: From the data set in step 4, create a second, 
#independent tidy data set with the average of each variable for each activity and each subject.

final_data <- aggregate(data3[, 3:ncol(data3)],
                        by=list(id = data3$id,
                        activity = data3$activity), mean)

# Create file with tidy data
write.table(final_data, "cleanData.txt", row.name=F, col.names=T, sep='\t')
