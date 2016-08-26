# this R code: 1-downlad the data linked to from the course website represent data collected 
# from the accelerometers from the Samsung Galaxy S smartphone
# 2-merges the training and the test sets to create one new data set "merged_data"
# 3-extracts only the measurements on the mean and standard deviation for each measurement from
#   the new data set to form "data_mean_std_only" data set
# 4-assigns descriptive activity names to name the activities in the "data_mean_std_only" data set
# 5-labels the "data_mean_std_only" data set with descriptive variable names
# 6-finally creates a tidy data set ("tidy_data") with the average of each variable
#   for each activity and each subject and writes this tidy data set in an output file
# called "AveragedTidyDataset.txt"

DataCleaner<-function(){
        #downloding the zip file
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "data.zip",method="curl")
        # unzipping the downloaded zip file
        unzip("data.zip",overwrite =TRUE)
        #creating train data set from subject_train.txt, y_train.txt and X_train.tx
        train_subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
        train_activity<-read.table("UCI HAR Dataset/train/y_train.txt")
        train_features<-read.table("UCI HAR Dataset/train/X_train.txt")
        data_train<-cbind(train_subject,train_activity,train_features)
        #creating test data set from subject_test.txt, y_test.txt and X_test.txt
        test_subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
        test_activity<-read.table("UCI HAR Dataset/test/y_test.txt")
        test_features<-read.table("UCI HAR Dataset/test/X_test.txt")
        data_test<-cbind(test_subject,test_activity,test_features)
        # merging two created data sets
        merged_data<-rbind(data_train,data_test)
        # changing repeated colnames at the first two columns
        merged_data_colnames<-colnames(merged_data)
        merged_data_colnames[1]<-"V01"
        merged_data_colnames[2]<-"V02"
        colnames(merged_data)<-merged_data_colnames
        # calling "dplyr" library to use "select" function
        library(dplyr)
        #selecting only the measurements on the mean and standard deviation for each measurement from
        # merged_data 
        data_mean_std_only<-select(merged_data,-c(V7:V40,V47:V80,V87:V120,V127:V160,V167:V200, V203:V213,
                                                  V216:V226, V229:V239, V242:V252, V255:V265, V272:V344,
                                                  V351:V423, V430:V502, V505:V515, V518:V528, V531:V541,
                                                  V544:V561))
        #assigning proper columnames to variables
        colnames(data_mean_std_only)<-c("SUBJECT",
                                        "ACTIVITY",
                                        "tBodyAccX-mean",
                                        "tBodyAccY-mean",
                                        "tBodyAccZ-mean",
                                        "tBodyAccX-std",
                                        "tBodyAccY-std",
                                        "tBodyAccZ-std",
                                        "tGravityAccX-mean",
                                        "tGravityAccY-mean",
                                        "tGravityAccZ-mean",
                                        "tGravityAccX-std",
                                        "tGravityAccY-std",
                                        "tGravityAccZ-std",
                                        "tBodyAccJerkX-mean",
                                        "tBodyAccJerkY-mean",
                                        "tBodyAccJerkZ-mean",
                                        "tBodyAccJerkX-std",
                                        "tBodyAccJerkY-std",
                                        "tBodyAccJerkZ-std",
                                        "tBodyGyroX-mean",
                                        "tBodyGyroY-mean",
                                        "tBodyGyroZ-mean",
                                        "tBodyGyroX-std",
                                        "tBodyGyroY-std",
                                        "tBodyGyroZ-std",
                                        "tBodyGyroJerkX-mean",
                                        "tBodyGyroJerkY-mean",
                                        "tBodyGyroJerkZ-mean",
                                        "tBodyGyroJerkX-std",
                                        "tBodyGyroJerkY-std",
                                        "tBodyGyroJerkZ-std",
                                        "tBodyAccMag-mean",
                                        "tBodyAccMag-std",
                                        "tGravityAccMag-mean",
                                        "tGravityAccMag-std",
                                        "tBodyAccJerkMag-mean",
                                        "tBodyAccJerkMag-std",
                                        "tBodyGyroMag-mean",
                                        "tBodyGyroMag-std",
                                        "tBodyGyroJerkMag-mean",
                                        "tBodyGyroJerkMag-std",
                                        "fBodyAccX-mean",
                                        "fBodyAccY-mean",
                                        "fBodyAccZ-mean",
                                        "fBodyAccX-std",
                                        "fBodyAccY-std",
                                        "fBodyAccZ-std",
                                        "fBodyAccJerkX-mean",
                                        "fBodyAccJerkY-mean",
                                        "fBodyAccJerkZ-mean",
                                        "fBodyAccJerkX-std",
                                        "fBodyAccJerkY-std",
                                        "fBodyAccJerkZ-std",
                                        "fBodyGyroX-mean",
                                        "fBodyGyroY-mean",
                                        "fBodyGyroZ-mean",
                                        "fBodyGyroX-std",
                                        "fBodyGyroY-std",
                                        "fBodyGyroZ-std",
                                        "fBodyAccMag-mean",
                                        "fBodyAccMag-std",
                                        "fBodyBodyAccJerkMag-mean",
                                        "fBodyBodyAccJerkMag-std",
                                        "fBodyBodyGyroMag-mean",
                                        "fBodyBodyGyroMag-std",
                                        "fBodyBodyGyroJerkMag-mean",
                                        "fBodyBodyGyroJerkMag-std")
        #replacing the activity values in each row by its corresponding activity name
        data_mean_std_only$ACTIVITY<-as.character(data_mean_std_only$ACTIVITY)
        data_mean_std_only$ACTIVITY[data_mean_std_only$ACTIVITY==1]<-"WALKING"
        data_mean_std_only$ACTIVITY[data_mean_std_only$ACTIVITY==2]<-"WALKING_UPSTAIRS"
        data_mean_std_only$ACTIVITY[data_mean_std_only$ACTIVITY==3]<-"WALKING_DOWNSTAIRS"
        data_mean_std_only$ACTIVITY[data_mean_std_only$ACTIVITY==4]<-"SITTING"
        data_mean_std_only$ACTIVITY[data_mean_std_only$ACTIVITY==5]<-"STANDING"
        data_mean_std_only$ACTIVITY[data_mean_std_only$ACTIVITY==6]<-"LAYING"
        
        # finding the range of SUBJECTS 
        last<-max(data_mean_std_only$SUBJECT)
        first<-min(data_mean_std_only$SUBJECT)
        activities<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
        
        #creating a matrix containing the averaged values of variable corresponding to each SUBJECT
        # and ACTIVITY
        for (i in c(first:last)){
                for (k in activities){
                        # subsetting
                        subset_vector<-data_mean_std_only[data_mean_std_only$SUBJECT==i & 
                                                                data_mean_std_only$ACTIVITY==k,]
                        #computing the mean for column
                        Mean_vector<-as.vector(colMeans(
                                subset_vector[3:ncol(data_mean_std_only)]))
                        #merging two first array to the vector
                        Mean_vector<-c(i,k,Mean_vector)
                        #merging the resultant row to the matrix
                        if (i==first && k=="WALKING"){
                                tidy_data<-Mean_vector
                        }else{
                                tidy_data<-rbind(tidy_data,Mean_vector)
                        }
                }
        }
        #converting the matrix to data frame
        tidy_data<-as.data.frame(tidy_data)
        #setting its column names
        colnames(tidy_data)<-colnames(data_mean_std_only)
        #writting the output file
        OutputFile<-"AveragedTidyDataset.txt"
        write.table(tidy_data, file=OutputFile, row.names=FALSE)
}