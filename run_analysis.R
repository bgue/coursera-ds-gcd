# Load useful modules from CRAN
library(plyr)

# Download the data

localfile <- "jawbone.zip"
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

# Download and unzip only if the file isn't already local. 
if(!file.exists(localfile)){
  download.file(url,localfile, mode = "wb") # use binary mode since it's a zip file
}
if(!file.exists(dir)){
  unzip(localfile, files = NULL, exdir=".")
}

# load data.frames using the read.table method with default args.

# Subject files
subject_test <- read.table(paste(dir, "/test/subject_test.txt", sep=""))
subject_train <- read.table(paste(dir, "/train/subject_train.txt", sep=""))

# Features files
X_test <- read.table(paste(dir, "/test/X_test.txt", sep=""))
X_train <- read.table(paste(dir, "/train/X_train.txt", sep=""))

# Activity files
y_test <- read.table(paste(dir, "/test/y_test.txt", sep=""))
y_train <- read.table(paste(dir, "/train/y_train.txt", sep=""))

# metadata
labels <- read.table(paste(dir, "/activity_labels.txt", sep=""))
feature_labels <- read.table(paste(dir, "/features.txt", sep=""))  

# First requirement is  merged datasets
merged_features <- rbind(X_train, X_test)
merged_activities <- rbind(y_test, y_train)
merged_subject <- rbind(subject_test, subject_train)

# Assign the names that are stored in  feature_labels
names(merged_features) <- feature_labels$V2
# assign static names
names(merged_subject) <- c("subject")
names(merged_activities) <- c("activity")

data <- cbind(merged_features, (cbind(merged_subject, merged_activities)))

# Extract meaturements on mean and stdev
target_data <-data[,grepl("mean|std|subject|activity",colnames(data))]
                                  
# group the activity column
activity_group <- factor(target_data$activity)
levels(activity_group) <- labels$V2
target_data$activity <- activity_group


# independent averages in a tidy data set

output_tidy <- ddply(target_data, c("subject","activity"), numcolwise(mean))
write.table(output_tidy,file="tidydata.txt")