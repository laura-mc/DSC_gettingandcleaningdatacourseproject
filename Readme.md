The script is divided into 8 different sections. First section loads environment packages, second and third sections load data, and the following steps fulfill project requirements. In the following lines there is a description of each code section.

* Section 1: Load needed R specific packages
* Section 2: Read data from provided .txt files using read.table() function
* Section 3: Set data-set column names using the features read in the previous section 
* Section 4: Merges the training and the test sets for x, y and subject sets. It corresponds to the first requirement of the project. 
* Section 5: Select only columns with mean or standard deviation data. It corresponds to the second requirement of the project.
* Section 6: Replace the activity numbers (1,2,3,4,5,6) with their corresponding activity name. It corresponds to the third requirement of the project.
* Section 7: Set some normalization in column names; removes duplicated names, remove dots at the end of the name and separates names with dots, e.g: instead of ThisIs..An.Example..., This.Is.An.Example. It corresponds to the fourth requirement of the project.
* Section 8: Calculate average of each variable for each activity and each subject. Then, save this data set in a .txt file with "tidy_data" name. This corresponds to the fifth and last requirement of the project.
