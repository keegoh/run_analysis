CodeBook for the tidy dataset
=============================

Data source: Human Activity Recognition Using Smartphones Data Set
------------------------------------------------------------------
This data set is collected from experiments collected from the accelerometers from the Samsung Galaxy S smartphone with a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Data set can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For each record in the dataset it is provided:

    1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
    2. Triaxial Angular velocity from the gyroscope. 
    3. A 561-feature vector with time and frequency domain variables. 
    4. Its activity label. 
    5. An identifier of the subject who carried out the experiment.


Features and Transformations performed to clean up the dataset
--------------------------------------------------------------

prefix 't' denote time
prefix 'f' indicate frequency domain signals
postfix '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
The acceleration signal was then separated into body and gravity acceleration signals.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyGyro-XYZ

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
* tBodyAccJerk-XYZ
* tBodyGyroJerk-XYZ

Magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag

Fast Fourier Transform (FFT) was applied to some of these signals producing:
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were extracted and used for this assignment are: 

* mean(): Mean value
* std(): Standard deviation

The final dataset was created by aggregating by activity and subject to get the average of each variable for each activity and each subject.