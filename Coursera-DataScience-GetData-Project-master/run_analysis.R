# This is a R script created for analysing Wearable devices acceptance tests.
# The script is divided into 3 main stages: 
#         The Util stage
#         The processing stage
#         The orchestrator stage
#
#
# The util stage contains some util fuctions that are applied in the processing stage
# The processing stage contains the functions that represents the steps taken for the analysis
# The orchestrator contains the main function that is responsible for putting all together
#
#
#
#   The main function:
#
#                     runAnalysis()
#
#
####### Util stage #################################################33

# Creates a string for a simple dir
dirString <- function(type){
  paste(type,"/", sep = "")
}

# Reads from a simple variable txt file
txt.read <- function(file, cname){
  read.table(file, sep = "\n", col.names = c(cname))
}

# Reads from a vectorized variable txt file
vec.txt.read <- function(file){
  feat <- read.table('features.txt', stringsAsFactors=FALSE )
  read.table(file, col.names = feat[,2])
}

# Helper function for txt.read()
txt <- function(..., type, cname){
  txt.read(paste(dirString(type), ..., type,'.txt',sep = ""), cname = cname)
}

# Helper function for vec.txt.read()
vec.txt <- function(..., type){
  vec.txt.read(paste(dirString(type), ..., type,'.txt',sep = ""))
}
######################################################################




####### Processing stage ###################################################

# Loads the basic dataset for one particular directory
readByDir <- function(dir){
  Activity <- txt('y_',type = dir, cname  = 'ActivityId')
  Subject <- txt('subject_',type = dir, cname  = 'SubjectId')
  X <- vec.txt('X_',type = dir)
  
  data.frame(Activity, Subject, X)
}

# Puts together the test and train datasets
readSet <- function(){
  rbind(readByDir('test'), readByDir('train'))
}

# Extract the means and stds of the dataset
extractFields <- function(dataset){
  dataset[,grep(colnames(dataset), ignore.case = TRUE, pattern = 'mean|std|ActivityId|SubjectId')]
}

# Merges the activityId with the activity label
mergeActivity <- function(dataset){
  activityMerge <- merge(read.table('activity_labels.txt', col.names = c("id", "Activity")), dataset, by.y = 'ActivityId', by.x = 'id')
  activityMerge[, !names(activityMerge) %in% c("id","ActivityId")]
}

# Prettyfy the colluns removing ugly dots
prettyColumns <- function(dataset){
  df <- dataset
  colnames(df) <- gsub('\\.\\.+', '.', colnames(df))
  colnames(df) <- gsub('\\.$', '', colnames(df))
  df
}

# Prettyfy the colluns adding the avg suffix
avgPrettyColumns <- function(dataset){
  df <- dataset
  colnames(df) <- gsub('$', '.Avg', colnames(df))
  colnames(df) <- gsub('Activity.*', 'Activity', colnames(df))
  colnames(df) <- gsub('SubjectId.*', 'SubjectId', colnames(df))
  df
}

# Takes the average of the distinct compound key of (Activity , Subject) 
avgByGroup <- function(dataset){
  library(dplyr)
  dataset %>% group_by(Activity, SubjectId) %>% summarise_each(funs(mean))
}
######################################################################




####### Orchestrator stage ###################################################

# Do the work
runAnalysis <- function() {
    dataset <- readSet()
    dataset <- extractFields(dataset)   
    dataset <- mergeActivity(dataset)
    dataset <- prettyColumns(dataset)
    dataset <- avgByGroup(dataset)
    dataset <- avgPrettyColumns(dataset)
    dataset
}