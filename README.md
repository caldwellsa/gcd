Getting and Cleaning Data Course Project
========================================================

Source Code: run_analysis.R

Instructions: 
<ol>
<li>Download run_analysis.R into your working directory. </li>
<li>From R console or R Studio run the command: <code>source("run_analysis.R")</code>
</ol>

Original data source and description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data source for project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Project objectives:

<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set</li>
<li>Appropriately labels the data set with descriptive activity names.</li>
<li>Creates a second, independent tidy data set with the average of each variable for each activity and each subject. </li>
</ol>

Reference: https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions

<p>Program Output:</p>
<ul>
<li>tidydata.csv - Tidy data containing average and standard deviation measurements for each observation.</li>
<li>avg_data.csv - Mean values of the observations from tidydata.csv, grouped by subject and activity.</li>
</ul>

Dependencies:
<code>library("stringr")</code>

Program operation:

<ol>
<li>Create and change to working directory "gcd"</li>
<li>Download and extract data</li>
<li>Read Test dataset</li>
<li>Read Train dataset.</li>
<li>Merge datasets</li>
<li>Label columns</li>
<li>Replace numeric activity labels with descriptive strings.</li>
<li>Select data to keep in final dataset (average and standard deviation values)</li>
<li>Create second dataset with averages grouped by subject and activity.</li>
<li>Save the datasets to disk.</li>
</ol>

