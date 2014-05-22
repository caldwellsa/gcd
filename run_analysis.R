## run_analysis.R 

# Coursera/John Hopkins, Getting and Cleaning Data class project

# The purpose of this project is to demonstrate your ability to
#collect, work with, and clean a data set. The goal is to prepare tidy data that
#can be used for later analysis. You will be graded by your peers on a series of
#yes/no questions related to the project. You will be required to submit: 1) a
#tidy data set as described below, 2) a link to a Github repository with your
#script for performing the analysis, and 3) a code book that describes the
#variables, the data, and any transformations or work that you performed to
#clean up the data called CodeBook.md. You should also include a README.md in
#the repo with your scripts. This repo explains how all of the scripts work and
#how they are connected.
#
#One of the most exciting areas in all of data science right now is wearable
#computing - see for example this article . Companies like Fitbit, Nike, and
#Jawbone Up are racing to develop the most advanced algorithms to attract new
#users. The data linked to from the course website represent data collected from
#the accelerometers from the Samsung Galaxy S smartphone. A full description is
#available at the site where the data was obtained:
#
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
#Here are the data for the project:
#
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#You should create one R script called run_analysis.R that does the following.
#
#Merges the training and the test sets to create one data set. Extracts only the
#measurements on the mean and standard deviation for each measurement. Uses
#descriptive activity names to name the activities in the data set Appropriately
#labels the data set with descriptive activity names. Creates a second,
#independent tidy data set with the average of each variable for each activity
#and each subject.
#
#Use:
#Download run_analysis.R into your working directory. From R console or R Studio 
#and run the command: 
#source("run_analysis.R")
##################################################################################

url<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
wd<-"gcd"           # working directory
output_file="tidydata.csv"
avg_output_file="avg_data.csv"

library("stringr")


#setup working directory
if (basename(getwd())!=wd) {
    dir.create(wd)
    setwd(wd)
}
#download and extract data
if (!file.exists("UCI HAR Dataset")) {
    download.file(url=url,destfile="dataset.zip")
    unzip("dataset.zip")
}

#read test data
data<-read.table("UCI HAR Dataset\\test\\subject_test.txt")
data<-data.frame(data,Dataset="TEST",stringsAsFactors=FALSE)
data<-cbind(data,read.table("UCI HAR Dataset\\test\\y_test.txt"))
data<-cbind(data,read.table("UCI HAR Dataset\\test\\X_test.txt"))

#read train data
data2<-read.table("UCI HAR Dataset\\train\\subject_train.txt")
data2<-data.frame(data2,Dataset="TRAIN",stringsAsFactors=FALSE)
data2<-cbind(data2,read.table("UCI HAR Dataset\\train\\y_train.txt"))
data2<-cbind(data2,read.table("UCI HAR Dataset\\train\\X_train.txt"))

#merge data
data<-rbind(data,data2)
data2<-NULL

#label data
activity_labels<-as.vector(read.table("UCI HAR Dataset\\activity_labels.txt")[,2])
feature_labels<-as.vector(read.table("UCI HAR Dataset\\features.txt")[,2])
feature_labels<-str_replace_all(feature_labels,"[()]","")
names(data)<-c("Subject","Dataset","Activity",feature_labels)
data$Activity<-activity_labels[data$Activity]

#select columns to keep in reduced dataset
column_labels<-feature_labels[str_detect(feature_labels,"mean") |
                                  str_detect(feature_labels,"std")]
data<-data[,c("Subject","Dataset","Activity", column_labels)]


#create dataset with averages grouped by Subject and Activity
avg_data<-data.frame(NULL)
for (s in min(data$Subject):max(data$Subject)) {
    for (a in activity_labels) {
        subdata<-data[data$Subject==s & data$Activity==a,]
        if (dim(subdata)[1]) {
            avgsub<-data.frame(c(subdata[1,1:3],sapply(subdata[,4:82],mean)))
            avg_data<-rbind(avg_data,avgsub)
        }
    }
}

#save data
write.table(data,output_file,sep=",",row.names=FALSE)
write.table(avg_data,avg_output_file,sep=",",row.names=FALSE)
