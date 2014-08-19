### Contents

This repo contains the following files:

1. `run_analysis.R`: an R-script that processes the data as instructed in the project description
2. `CodeBook.md`: a code that describes the variables, the data, and cleaning performed on the data
3. `README.md`: this file
  
### Explanation of the script

All data processing is done by a single script: `run_analysis.R`. This script assumes that the ZIP-file given in the project description has been unzipped in the working directory, thus yielding the directory structure `./UCI HAR Dataset/...`. The output of the script is a clean dataset, which is written to the file `ldemey_gettingdata_project_cleandata.txt` and stored in the working directory. This file can be read into R again by means of the following command:

`cleandata <- read.table("ldemey_gettingdata_project_cleandata.txt", header = TRUE, sep = "\t")`

The script is divided up into phases 0, 1, 2, 3, 4, 5. 

#### Phase 0

This phase merely involves reading all of the raw data into R. The feature names given in `features.txt` are immediately used as column names when reading in `X_test.txt` and `X_train.txt`. Furthermore, `y_test.txt` and `y_train.txt` are read in with the column name 'activity_type'; finally, `subject_test.txt` and `subject_train.txt` are read in with the column name 'subject'.

Phases 1 to 5 perform the 5 steps listed in the project description:

1. Merge the training and the test sets to create one data set.  
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.  
4. Appropriately label the data set with descriptive variable names.  
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.  

#### Phase 1

First we recombine the columns of the test data and the training data. Next, we put the test data and the training data under each other in one big data set.

#### Phase 2
  
The instructions in the project description are somewhat vague; for example, do we only want those measurements whose name (as listed in `features.txt`) literally ends in `mean()` (such as `tBodyAcc-mean()-X`), or do we also want to select the measurements whose name contains `mean()` anywhere at all (such as `fBodyAcc-meanFreq()-X`)? 

In order to avoid throwing away potentially relevant data, I have taken the most 'liberal' approach, selecting all measurements that have `mean()` _anywhere_ in their name. (Similar for `std()`, of course.) If during the later stages of the project, any of these measurements turn out to be irrelevant after all, they can still easily be deleted from the dataset.  

The relevant measurements (i.e. columns) are selected from the data frame by simply listing their column numbers. The column numbers correspond to the listing of features in `features.txt`.

#### Phase 3
 
This was done by reading in the descriptive activity labels from `activity_labels.txt` and using them as factor labels of the factor `activity_type` in the dataframe.
  
#### Phase 4 

This was already accomplished in phase 0 (by making use of the `col.names` attribute of the `read.table` function). 

#### Phase 5
 
This is done using the `aggregate` function. There are 30 subjects and 6 activities, thus yielding a dataframe with 30 x 6 = 180 rows: one row for each subject/activity pair. Because the columns now contain averages (grouped by subject and activity), their names are changed by putting 'MEAN OF' in front of them. For example, the first numeric column is no longer labeled `tBodyAcc-mean()-X`, but rather `MEAN_OF_tBodyAcc-mean()-X`. 

Finally, this clean dataset is written to the file `ldemey_gettingdata_project_cleandata.txt`.