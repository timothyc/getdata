## Data frame variables
#### `features_df`
Stores the column #s and feature names from `features.txt` (as described in `features_info.txt`)
#### `activities_df`
Stores the descriptions of the activities
#### `subject_df`
Stores the merged subjects data in test and training
#### `activity_df`
Stores the merged activities data in test and training
#### `df`
Stores the merged data in test and training, then merge with subject_df and activity_df to create a 'grand' 1:1 corresponding data frame between the data, subjects and activities
#### `avg_df`
Stores the tiny data


## Factor variables
#### `features_v`
Stores the increased-readability feature names
#### `selected_cols`
Stores the columns used in tiny data 


## Filename variables
#### `features_f`
Filename of the features (`UCI HAR Dataset/features.txt`)
#### `activities_f`
Filename of the activities (`UCI HAR Dataset/activity_labels.txt`)
#### `test_f`
Filename of the data collected in test (`UCI HAR Dataset/test/X_test.txt`)
#### `test_subject_f`
Filename of the subjects corresponding to the data collected in test (`UCI HAR Dataset/test/subject_test.txt`)
#### `test_activity_f`
Filename of the activities corresponding to the data collected in test (`UCI HAR Dataset/test/y_test.txt`)
#### `train_f`
Filename of the data collected in training (`UCI HAR Dataset/train/X_train.txt`)
#### `train_subject_f`
Filename of the subjects corresponding to the data collected in training (`UCI HAR Dataset/train/subject_train.txt`)
#### `train_activity_f`
Filename of the activities corresponding to the data collected in training (`UCI HAR Dataset/train/y_train.txt`)
