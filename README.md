# Getting-and-Cleaning-Data-Assignment
## Course project of the course Getting and Cleaning Data

The run_analysis.R script consists of 6 parts:

### Part 1: Set working directory and install required packages. 
- The packages are installed at the beginning but are loaded later, when they are required.  

### Part 2: Merge train and test sets 
(Assignment requirement 1)
- Load training and test data sets including subjects, activity types and features.
- Merge training sets with test sets to create one data set.

### Part 3: Extract measurements on mean and standard deviation
(Assignment requirement 2)
- Load feature column names to use as variable names in the data set.
- Assign loaded names as column names to the data set.
- Use the new column names to subset only the variables that correspond to measurements on mean and standard deviation.

### Part 4: Use descriptive activity names
(Assignment requirement 3)
- Use the activity labels to replace the numeric code of the activity types.

### Part 5: Label with descriptive variable names
(Assignment requirement 4)
- Create a unique data frame, binding the columns Subject and Activity to the data set.
- Give descriptive column names to the data frame.

### Part 6: Create tidy data set with the average of each variable for activity and subject
(Assignment requirement 5)
- Load the dplyr package
- Group the data frame by Subject and Activity factors.
- Compute variable means for each subject and activity type.
- Visualize the definitive, tidy data frame.
