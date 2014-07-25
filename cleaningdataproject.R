Xtrain <- read.table("X_train.txt", sep = "")
subtrain <- read.table("subject_train.txt", sep = "")
ytrain <- read.table("y_train.txt", sep = "")
traindata <- data.frame(subtrain, ytrain, Xtrain)
Xtest <- read.table("X_test.txt", sep = "")
subtest <- read.table("subject_test.txt", sep = "")
ytest <- read.table("y_test.txt", sep = "")
testdata <- data.frame(subtest, ytest, Xtest)
alldata <- rbind(traindata, testdata)
features <-read.table("features.txt", sep = "", stringsAsFactors = FALSE)
featureshead <- features$V2
colnames(alldata) [3:563] <- featureshead
## This completed step 1 in the data transformation
locmean <- grep("mean()", featureshead)
locstd <- grep("std", featureshead)
precolsreq <- c(locmean, locstd)
colsreq <- precolsreq + 2
colsreq <- sort(colsreq)
first2rows <- alldata[ , 1:2]
data <- alldata[ , colsreq]
mesreq <- cbind(first2rows, data)
## This completed step 2 in the data transformation
actlabels <- read.table("activity_labels.txt", sep = "", stringsAsFactors=FALSE)
actlabelsreq <- actlabels$V2
id <- 1:6
for (i in id) {
        mesreq$V1.1[mesreq$V1.1 == i] <- actlabelsreq[i]
}
## This completed step 3 in the data transformation
colnames(mesreq) [1] <- c("Subject")
colnames(mesreq) [2] <- c("Activity")

test <- gsub("-", "", names(mesreq), )
test2 <- gsub("meanFreq()", "MeanFrequency", test, )
test3 <- sub("^t", "Time", test2, )
test4 <- sub("^f", "FFT", test3, )
test5 <- sub("\\()", "", test4, )
test6 <- sub("BodyBody", "Body", test5, )
test7 <- sub("mean", "Mean", test6, )
test8 <- sub("std", "StdDev", test7, )
test9 <- sub("Mag", "Magnitude", test8, )
test10 <- sub("Acc", "Acceleration", test9, )
colnames(mesreq) <- test10
## This completed step 4 in the data transformation
tidydataset <- aggregate(mesreq, by=list (mesreq$Subject, mesreq$Activity),FUN=mean)
tidydataset <- tidydataset[ , -3]
tidydataset <- tidydataset[ , -3]
colnames(tidydataset) [1] <- c("Subject")
colnames(tidydataset) [2] <- c("Activity")
## This completed step 5 in the data transformation
write.table(tidydataset, file = "tidydataset", sep = " ", row.names=FALSE)