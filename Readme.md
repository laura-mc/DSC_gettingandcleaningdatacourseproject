# Coursera *Getting and Cleaning data* course project

This repository contains the following files:
-	`README.md`: this file, which provides an overview of the repository and how it works.
-	`CodeBook.md`: data code book, which describes the contents of the data set.
-	`run_analysis.R`: the R script of the project.
-	`tidy_data.txt`: the resulting data set of the run_analysis script.

## Project development

The project can be executed running run_analysis.R script in the same directory where the input data is.

The script is divided into 8 different sections. First section loads environment packages, second and third sections load data, and the following steps fulfill project requirements. In the following lines there is a description of each code section.

*	__Section 1:__ Load needed R specific packages
*	__Section 2:__ Read data from provided .txt files using read.table() function
*	__Section 3:__ Set data-set column names using the features read in the previous section 
*	__Section 4:__ Merges the training and the test sets for x, y and subject sets. It corresponds to the first requirement of the project. 
*	__Section 5:__ Select only columns with mean or standard deviation data. It corresponds to the second requirement of the project.
*	__Section 6:__ Replace the activity numbers (1,2,3,4,5,6) with their corresponding activity name. It corresponds to the third requirement of the project.
*	__Section 7:__ Set some normalization in column names; removes duplicated dots, remove dots at the end of the name and separates names with dots, e.g: instead of ThisIs..An.Example..., This.Is.An.Example. It corresponds to the fourth requirement of the project.
*	__Section 8:__ Calculate average of each variable for each activity and each subject. Then, save this data set in a .txt file with "tidy_data" name. This corresponds to the fifth and last requirement of the project.
