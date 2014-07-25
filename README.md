#README.md for R coursera project
===========================================
This repository contains the following files

* README.md
* CODEBOOK.md
* cleaningdataproject.R 
* tidydataset.txt

The raw data used in this project comes from the Human Activity Recognition Using Smartphones Dataset experiments, the aim of which was to monitor the activities of 30 subjects performing 6 different activities using a smartphone (Samsung Galaxy S). The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The raw data can be obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The CODEBOOK.md describes (a) the steps involved in the data transformation from the raw data to the output in the tidydataset.txt file and (b) the names and types of variables and an explanation of what the variables mean

To use the R script (cleaningdataproject.R), the working directory should contain all files unzipped from the UCI HAR Dataset as downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The R script performs the following tasks:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The second, independent tidy data set is then written as the text file "tidydataset.txt", which can be opened in R using the command :
```
tidydataset <- read.table("tidydataset.txt", sep = "")
```

The tidydataset.txt file contains the average of each variable for each activity and each subject (i.e. 180 rows and 79 columns of data, plus 2 columns of variables (subject number and activity name)).