# Code Book
#### This Code book is provided for:
* script "run_analysis.R" 
* data set "AveragedTidyDataset.txt"
#### The raw data used by this script is available at:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
#### The inforamtion about this research study is provided in the following link:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
#### Steps to obtain tidy data:
1. Creating the train data set using `cbind` from following files in the following order:
  * subject_train.txt
  * y_train.txt 
  * X_train.txt
2. Creating the test data set using `cbind` from following files in the followi$
  * subject_test.txt
  * y_test.txt
  * X_test.txt
3. Merging these two data sets using `rbind` and creating `merged_data` data set
4. Selecting only the measurements on the mean and standard deviation for each measurement from `merged_data`
  * using `select` function from `dplyr` library
  * creating `data_mean_std_only` data set
5. Labeling the columns of `data_mean_std_only` as (here `t` for time and `f` for frequency):
  * SUBJECT
  * ACTIVITY
  * tBodyAccX-mean
  * tBodyAccY-mean
  * tBodyAccZ-mean
  * tBodyAccX-std
  * tBodyAccY-std
  * tBodyAccZ-std
  * tGravityAccX-mean
  * tGravityAccY-mean
  * tGravityAccZ-mean
  * tGravityAccX-std
  * tGravityAccY-std
  * tGravityAccZ-std
  * tBodyAccJerkX-mean
  * tBodyAccJerkY-mean
  * tBodyAccJerkZ-mean
  * tBodyAccJerkX-std
  * tBodyAccJerkY-std
  * tBodyAccJerkZ-std
  * tBodyGyroX-mean
  * tBodyGyroY-mean
  * tBodyGyroZ-mean
  * tBodyGyroX-std
  * tBodyGyroY-std
  * tBodyGyroZ-std
  * tBodyGyroJerkX-mean
  * tBodyGyroJerkY-mean
  * tBodyGyroJerkZ-mean
  * tBodyGyroJerkX-std
  * tBodyGyroJerkY-std
  * tBodyGyroJerkZ-std
  * tBodyAccMag-mean
  * tBodyAccMag-std
  * tGravityAccMag-mean
  * tGravityAccMag-std
  * tBodyAccJerkMag-mean
  * tBodyAccJerkMag-std
  * tBodyGyroMag-mean
  * tBodyGyroMag-std
  * tBodyGyroJerkMag-mean
  * tBodyGyroJerkMag-std
  * fBodyAccX-mean
  * fBodyAccY-mean
  * fBodyAccZ-mean
  * fBodyAccX-std
  * fBodyAccY-std
  * fBodyAccZ-std
  * fBodyAccJerkX-mean
  * fBodyAccJerkY-mean
  * fBodyAccJerkZ-mean
  * fBodyAccJerkX-std
  * fBodyAccJerkY-std
  * fBodyAccJerkZ-std
  * fBodyGyroX-mean
  * fBodyGyroY-mean
  * fBodyGyroZ-mean
  * fBodyGyroX-std
  * fBodyGyroY-std
  * fBodyGyroZ-std
  * fBodyAccMag-mean
  * fBodyAccMag-std
  * fBodyBodyAccJerkMag-mean
  * fBodyBodyAccJerkMag-std
  * fBodyBodyGyroMag-mean
  * fBodyBodyGyroMag-std
  * fBodyBodyGyroJerkMag-mean
  * fBodyBodyGyroJerkMag-std
6. Replacing the activity values in each row by its corresponding activity name:
  * "WALKING" for 1
  * "WALKING_UPSTAIRS" for 2
  * "WALKING_DOWNSTAIRS" for 3
  * "SITTING" for 4
  * "STANDING" for 5
  * LAYING" for 6
7. Creating a dataframe containing the averaged values of variable corresponding to each SUBJECT and ACTIVITY:
  * creating `tidy_data` data set
8. writting the output file `AveragedTidyDataset.txt`
 
## Fnal Tidy Data Set
#### This data set is a dataframe with the average of each variable for each activity and each subject
#### This data set is stored in `AveragedTidyDataset.txt`
#### The numbers of subjects and activities in this data set are 30 and 5 respectively.
#### The column names are the same as `step 5' in the process of cleaning the data
#### The activity labe are the same as `step 6` in the process of cleaning the data   

