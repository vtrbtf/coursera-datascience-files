# CodeBook


This code book describes the variable names and units of the data generated from the run_Analysis.r script

## Major Variables 


### - Activity
The type of activity that was performed.

Types:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING


### - Subject
The subject ids that did the action.
The ids range is [1:30]




## Measurement Variables 

 The measurement variables are divided by diferent signals. Each signal is represented as the **average** measure by each __Activity and Subject__ 

### Pattern 

Each variable is based on the pattern

		[signal].[measure-operation].[axis!optional].Avg

---


### Signals 

These signals come from the accelerometer and gyroscope 3-axial raw signals tAcc and tGyro. These time domain signals (prefix 't' to denote time) were captured at a constant rate. The acceleration signal was  separated into body and gravity acceleration signals (tBodyAcc and tGravityAcc).

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk and tBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the __Euclidean norm__ (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 


#### With axis
* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* fBodyAcc
* fBodyAccJerk
* fBodyGyro

#### Without axis
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


---

### Measure Operation

Each signal is represented as the __Mean or the Standard deviation__.   

Name | Variable Name
---|---
Mean | mean
Standard Deviation | std

---

### Axis [ Optional ]

Each signal __can be__ attached to an axis. 
The surported axis are the following:
- X
- Y
- Z