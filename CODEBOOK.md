#CODEBOOK for tidydataset.txt

This CODEBOOK describes (a) the steps involved in the data transformation from the raw data to the output in the tidydataset.txt file and (b) the names and types of variables and an explanation of what the variables mean

##Steps involved in data transformation

The data was transformed in the following manner:
* The training data from the X_train, subject_train and y_train files were read in separately as txt files using the read.table function
* These files were then stacked horizontally by creating a dataframe (called traindata, dimension 7352*561)
* The test data from the X_test, subject_test and y_test files were read in separately as txt files using the read.table function
* These files were then stacked horizontally by creating a dataframe (called testdata, dimension 2947 * 561)
* Traindata and testdata were then stacked vertically using the rbind function to give the complete dataset alldata
* Column names was read in from the features and assigned to columns 3:563

### This completed step 1 in the data transformation

* All column names containing either the string "mean()" or "std" were identified, and a vector created with the numbers of these columns
* A new dataset, called first2rows, was created, containing the first 2 columns from the alldata dataframe (Subject and Activity fields)
* A new dataset, called data, was created, containing the columns previously identified as containing "mean()" or "std"
* The 2 datasets (first2rows and data) were combined to form the new dataset mesreq

### This completed step 2 in the data transformation

* The activity labels were read in from the activity_labels.txt file.
* A for loop was used to pass through the numbers (1-6) in the Activity column and replace the number with the text field in the corresponding position in the activity_labels.txt file

### This completed step 3 in the data transformation

* Column names were added to the Subject and Activity columns
* Sub and gsub were then used to replace and expand the definition of column names of the measurements, for example, the letter "t"  at the start of a name was replaced with "Time" using the command
```
test3 <- sub("^t", "Time", test2, )
```
* This was repeated until the variable names were thought to be readable and conform to the standards outlined in the course lectures

### This completed step 4 in the data transformation

* The aggregate function was used to collapse the data in the mesreq dataframe by the Subject and Activity using the function MEAN, and the result was assigned to tidydataset
* Additional columns, corresponding to the columns used in the "by" part of the aggregate function, were created after passing the aggregate function while the values of Activity in the original dataset were returned as NA
* To rectify this, the original Subject and Activity columns were removed, and the newly created columns were re-labelled Subject and Activity

### This completed step 5 in the data transformation

The tidydataset was written to a text file, making sure to set row.names=FALSE to avoid adding line numbers.

## Names and types of variables and an explanation of what the variables mean

The means of the means and standard deviations of measurements obtained for each volunteer and each activity are presented in the tidydataset.

The tidydataset is formatted as follows:

Variable Name | Variable type | Explanation
--------------------|--------------|----------------------------------------------------------------
Subject | integer (1:30) | Subject number from 1 to 30
Activity | chr (6 unique) | Character string detailing the activity conducted
Time.....| numeric (-1:+1) | Time measurement obtained (see details below)
FFT.....| numeric (-1:+1) | Fast Fourier Transform of Measurement obtained (see details below)


Each measurement is reported in 3 axes, X, Y and Z (final letter of each variable)

TimeBodyAcceleration - Body acceleration time
TimeGravityAcceleration - Gravity acceleration time
TimeBodyAccelerationJerk - Derivation of Body acceleration time
TimeBodyGyro - Body gyroscope time
TimeBodyGyroJerk - Derivation of Body gyroscope time
FFTBodyAcceleration - Fast Fourier Transform of Body acceleration time
FFTBodyAccelerationMeanFrequency - Weighted average of the frequency components following the FFT of the Body acceleration time
FFTGyroMean - Fast Fourier Transform of Body gyroscope time
FFTBodyAccelerationMagnitudeMean - Weighted average of the FFT of the Body acceleration time
FFTBodyAccelerationMagnitudeMeanFrequency - Weighted average of the frequency components following the FFT of the Body acceleration time
FFTGyroMagnitude - Fast Fourier Transform of Body gyroscope magnitude
FFTGyroJerkMagnitude - Derivation of the Fast Fourier Transform of Body gyroscope magnitude
FFTGyroJerkMagnitudeMeanFrequency - Weighted average of the frequency components following the FFT of the Fast Fourier Transform of Body gyroscope magnitude