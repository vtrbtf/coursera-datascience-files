# CourseraDS getdata project
My Coursera Data Science get-data Course Project Repository

## Usage
```R
> source('run_analysis.R')
> runAnalysis()
```
---
---

## Description
This is a R script created for analysing Wearable devices acceptance tests.

The script is divided into 3 basic stages: 
###	- The Util stage
  The util stage contains some util fuctions that are applied in the processing stage
  
###	-The processing stage
  The processing stage contains the functions that represents the steps taken for the analysis.
  
###	-The main stage
  The main stage contains the main function that is responsible for putting all together.

---
---

##   The main stage function:
Responsible for putting all together and running the script.
```R
> source('run_analysis.R')
> runAnalysis()
```
---
---

##   The util stage functions:
#### Contains some util fuctions that are applied in the processing stage
* The txt.read and vec.txt.read functions are responsible for reading simple and vectorized data.
* The txt and vec.txt functions are helpers for reading data.

##### Code: 

```Bash
> txt.read(file, column_name)
> vec.txt.read(file)
> txt(..., type, name)
> vec.txt(..., type)
```
---
---

##   The processing stage functions:
#### Contains the functions that represents the steps taken for the analysis.


Function | Description
---|---
readByDir | Loads the basic dataset for one particular directory
readSet | Puts together the test and train datasets
extractFields | Extract the means and stds of the dataset
mergeActivity | Merges the activityId with the activity label
prettyColumns | Prettyfy the colluns removing ugly dots
avgPrettyColumns | Prettyfy the colluns adding the avg suffix
avgByGroup | Takes the average of the distinct compound key of (Activity , Subject)
