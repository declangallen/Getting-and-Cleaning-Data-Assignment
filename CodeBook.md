##Getting and Cleaning Data

### UCI HAR Dataset

Data set is derived from a set of experiments conducted on a group of 30 volunteers between the ages of 19 to 48.
There were 6 activities;

* Walking
* Walking upstairs
* Waling downstairs
* Sitting
* Standing
* Laying

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Each volunteer was wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

A detailed decription of the data collected is described here;

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Each individual record included the following;

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##Step 1. Combine each dataset

Two data sets were first created, "Train" and "Test". As stated previously, the "Train" dataset contained 70% of the data with the "Test" dataset containing 30%. The following files associated with both sets were read into R.

* subject_test  - volunteer IDs    
* x_test - large data set containing results      
* y_test - activities IDs
* subject_train - volunteer IDs    
* x_train - large data set containing results    
* y_train - activities IDs

Each data set was also combined with the general files "activity_labels.txt" and "features.txt". These files were also read into R.
The activity labels file provided a numbered ID that corresponded to IDs within each Train and Test observation.
The features file provided a variable name for the data recorded on each observation. 

##Step 2. Appropriately label each data set with descriptive variable names

To gain a better understanding of the dataset each variable was given a label. The volunteer ID variable (subject##.txt) was named "volunteer" and the activity ID (y##.txt) variable was named "activity".
The "features.txt" was used to name the variables containing the results for each observation (x##.txt).

##Step 3. Merge Test and Train

Test and Train where then merged and ordered based off the volunteer ID in ascending order.

##Step 4. Filter the variables by mean and std

The merged dataset was then filted by only taking the variables that described the mean and std for each observation.

##Step 5. Insert activity labels

As this point, the activity IDs where converted to their respective labels described in the activity_labels.txt file.

##Step 6. Create tidy dataset

A tidy dataset was then created that provided the mean of the filtered variables. A mean was provided for each activity carried out by each volunteer.
