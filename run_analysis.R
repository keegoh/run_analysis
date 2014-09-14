##1. Merges the training and the test sets to create one data set.
##3. Uses descriptive activity names to name the activities in the data set
##4. Appropriately labels the data set with descriptive variable names. 

## Read in the features labels and activities labels
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels) <- c("activity", "activity_label")

## Function to load and label the data set with descriptive activity and variable names
loadAndLabel <- function (x, y, subject) {
  featureValues <- read.table(x)
  colnames(featureValues) <- features$V2 #Label data set with descriptive variable names
  
  activityValues <- read.table(y)
  activityValues <- merge(activityValues, activity_labels, by.x="V1", by.y="activity", all=TRUE) #Name activities with descriptive activity names
  colnames(activityValues) <- c("activity", "activity_label")
  
  subjectValues <- read.table(subject)
  colnames(subjectValues) <- "subject"
  
  return (cbind(subjectValues, activityValues, featureValues))
}

## Read in training data
trainData <- loadAndLabel("train/X_train.txt", "train/y_train.txt", "train/subject_train.txt")
## Read in testing data
testData <- loadAndLabel("test/X_test.txt", "test/y_test.txt", "test/subject_test.txt")
## Merge training and testing data
data_all <- rbind(trainData, testData)


##2. Extracts only the measurements on the mean and standard deviation for each measurement.
data_meanStd <- data_all[,grep("(subject|activity|mean\\(|std)", colnames(data_all))]


##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data_meanStd <- data_meanStd[, colnames(data_meanStd) != "activity_label"]
colNames <- names(data_meanStd)
data_tidy <- with(data_meanStd, aggregate(data_meanStd, by=list(activity, subject), FUN=mean, na.rm=TRUE))
data_tidy <- data_tidy[, colNames]
data_tidy <- merge(data_tidy, activity_labels, by="activity", all.x=TRUE)

## Export the tidy data set 
write.table(data_tidy, './tidy_data.txt',row.name=FALSE,sep='\t')

