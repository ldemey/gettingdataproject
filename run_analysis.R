### Phase 0: read in all the data

features <- read.table("./UCI HAR Dataset/features.txt")

X_test  <- read.table("./UCI HAR Dataset/test/X_test.txt",   
                      col.names = features[,2], 
                      check.names = FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                      col.names = features[,2],
                      check.names = FALSE)

y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt",   col.names = "activity_type")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity_type")

subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")


### Phase 1: merge the training and the test sets to create one data set

testdata  <- cbind(subject_test,  y_test,  X_test)
traindata <- cbind(subject_train, y_train, X_train)

alldata <- rbind(testdata, traindata)


### Phase 2: extracts only the measurements 
###          on the mean and standard deviation for each measurement

relevantdata <- alldata[,c(1,2,  
                           2 + c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,
                                 227:228,240:241,253:254,266:271,294:296,345:350,
                                 373:375,424:429,452:454,503:504,513,516:517,526,
                                 529:530,539,542:543,552,555:561))]

# col 1: subject
# col 2: activity_type
# col 563:
# 2 + c(...): all the columns that contain the string "mean" or "std" (see features.txt)
# note: we do 2 + , because there's two columns to the left of them, viz. the subject column
# and the activity_type column
# e.g. tBodyAcc-mean()-X is number 1 in features.txt, 
# but only the third column in the alldata dataframe

### Phase 3: use descriptive activity names to name the activities in the data set

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                              col.names  = c("number","descriptive_name"), 
                              colClasses = c("numeric","character"))

relevantdata$activity_type <- factor(relevantdata$activity_type, 
                                     levels = 1:6, 
                                     labels = activity_labels$descriptive_name)


### Phase 4: appropriately label the data set with descriptive variable names

# this was already done in phase 0,
# by making use of the col.names attribute of the read.table function


### Phase 5: create a second, independent tidy data set with 
###          the average of each variable for each activity and each subject

outputdata <- aggregate(relevantdata[,3:88], 
                        by = list(relevantdata$subject,relevantdata$activity_type),
                        FUN = mean)

# assign labels to the columns of outputdata:
# first column is subject
# second column is activity_type
# third column onwards: the mean of [some measure from the original dataset]

colnames(outputdata)[1] <- "subject"
colnames(outputdata)[2] <- "activity_type"
for(i in 3:ncol(outputdata)){
    colnames(outputdata)[i] <- paste("MEAN_OF_", colnames(outputdata)[i], sep = "")
}

write.table(format(outputdata, justify = "right"),    # right justify: better handle of minus sign
            file = "ldemey_gettingdata_project_cleandata.txt", 
            quote = FALSE, 
            sep = "\t", 
            row.names = FALSE)


### the txt-file can be read into R again by the following command:
### df <- read.table("ldemey_gettingdata_project_cleandata.txt", header = TRUE, sep = "\t")