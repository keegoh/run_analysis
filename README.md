Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
This repository contains the submissions required for the Coursera course "Getting and Cleaning data" course project.
It include 3 files:

	1) README.md - Describes the contents of the repo and the run_analysis.R script
	2) run_analysis.R - R script that generates the tidy data set from the "Human Activity Recognition Using Smartphones Data Set"
	3) CodeBook.md - A code book that describes the variables, the data, and any transformations or work performed to clean up the data


Human Activity Recognition Using Smartphones Data Set
-----------------------------------------------------
This data set is collected from experiments collected from the accelerometers from the Samsung Galaxy S smartphone with a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

For each record in the dataset it is provided:

    1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
    2. Triaxial Angular velocity from the gyroscope. 
    3. A 561-feature vector with time and frequency domain variables. 
    4. Its activity label. 
    5. An identifier of the subject who carried out the experiment.


run_analysis.R
--------------
The run_analysis.R script does the following:

    1. Merges the training and the test sets to create one data set
    2. Extracts only the measurements on the mean and standard deviation for each measurement
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The script works as follows to perform the tasks above:

    1. loadAndLabel function that:
        a. Loads:
	        - 561-feature vector (X_train.txt/X_test.txt)
	        - activities (y_train.txt/y_test.txt)
	        - subjects (subject_train.txt/subject_test/txt)
	    b. labels the data with descriptive variable names extracted from "features.txt"
	    c. Labels the activities with descriptive activity names extracted from "activity_labels.txt"
    2. Call loadAndLabel function to load and label the training and testing data set
    3. Merge the training and testing data set with rbind(trainData, testData)
    4. Extract only the measurements on the mean and standard deviation using grep("(subject|activity|mean\\(|std)", colnames(data_all)) to extract columns with "mean" and "std". Column names with "mean" refers to measurements on the mean while Column names with "std" refers to measurements on the standard deviation
    5. Create the tidy data set with the aggregate() function which aggregates the data by the activity and the subject using the average of each variable


CodeBook.md
-----------
A code book that describes the variables, the data, and any transformations or work performed to clean up the data. More details can be found in CodeBook.md. 