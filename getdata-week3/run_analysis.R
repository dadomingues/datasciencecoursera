# Daniel - dadomingues

# I need to set my WD: setwd("~/Coursera/getdata")
# I dont like files and folders with "space". ;P

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Use reshape2
library(reshape2)

runAnalysis <- function() {
    
    # folders base path
    base <- "UCI HAR Dataset\\";
    baseTrain <- paste(base,"train\\",sep="");
    baseTest <- paste(base,"test\\",sep="");
    
    # load dataframes: train and test
    trainData <- read.table(paste(baseTrain,"X_train.txt",sep=""))
    trainIds <- read.table(paste(baseTrain,"y_train.txt",sep=""))
    trainSubjects <- read.table(paste(baseTrain,"subject_train.txt",sep=""))
    testData <- read.table(paste(baseTest,"X_test.txt",sep=""))
    testIds <- read.table(paste(baseTest,"y_test.txt",sep=""))
    testSubjects <- read.table(paste(baseTest,"subject_test.txt",sep=""))
    
    # Step 1 - join "test" and "train" using "rbind"
    allData <- rbind(trainData, testData)
    allIds <- rbind(trainIds, testIds)
    allSubjects <- rbind(trainSubjects, testSubjects)
    
    # Give name to the columns : id and name
    features <- read.table(paste(base,"features.txt",sep=""))
    colnames(features) <- c("id", "name")
    colnames(allData) <- features$name
    
    # Step 2 - help by stackoverflow to use union and grep
    cols <- sort(union(grep("mean\\(\\)", features$name),
                       grep("std\\(\\)", features$name)))
    df <- allData[,cols]
    
    # Step 3 - naming activities
    labelIndex <- read.table(paste(base,"activity_labels.txt",sep=""))
    labels <- merge(allIds, labelIndex)
    colnames(labels) <- c("activity.id", "activity.label")
    
    # Step 4 - df with lables
    labeledDf <- cbind(df,
                       activity = labels$activity.label,
                       subject = allSubjects$V1)
    
    # Step 5 - average/mean of activity and subject
    tidyDf <- melt(labeledDf, c("activity", "subject"))
    dcast(tidyDf, activity + subject ~ variable, mean)
}

# function to be called to create the tidy dataset
createTidy <- function() {
    tidyData <- runAnalysis()
    write.table(tidyData, "tidyDataSet.txt")
}

# call createTidy, which calls runAnalysis; can be called again.
createTidy()
