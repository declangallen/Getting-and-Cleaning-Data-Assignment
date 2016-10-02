
#Set the Directory

setwd("./Course 3/Week 4/UCI HAR Dataset")

#Read the label files

activity_labels <- read.table("activity_labels.txt", stringsAsFactors = F)

features <- read.table("features.txt", stringsAsFactors = F)

#Read the train data

x_test <- read.table("./test/x_test.txt", stringsAsFactors = F)

y_test <- read.table("./test/y_test.txt", stringsAsFactors = F)

subject_test <- read.table("./test/subject_test.txt", stringsAsFactors = F)

#Read the train data

x_train <- read.table("./train/x_train.txt", stringsAsFactors = F)

y_train <- read.table("./train/y_train.txt", stringsAsFactors = F)

subject_train <- read.table("./train/subject_train.txt", stringsAsFactors = F)

#Combine all the test data into one file. Name each variable.

test_data <- cbind(subject_test,y_test,x_test)

names(test_data) = c('volunteer', 'activity', features$V2)

#Combine all the train data into one file. Name each variable

train_data <- cbind(subject_train,y_train,x_train)

names(train_data) = c('volunteer', 'activity', features$V2)

#Combine the rows of test and train

merge <- rbind(test_data, train_data)

#order data

merge <- merge[order(merge$volunteer),]

#create a new dataset that filters for mean and std in the features variable names

merge1 <- merge[c(1,2,grep('mean|std', names(merge)))]

#convert the activity labels from IDs to the relevant names

merge1$activity <- factor(merge1$activity, 
                labels=c("Walking", "Walking Upstairs", 
                        "Walking Downstairs", "Sitting", 
                         "Standing", "Laying"))

#develop tidy data set that shows the mean for 
#each activity carried out by each volunteer

tidy <- aggregate(. ~ activity + volunteer, data = merge1, mean)