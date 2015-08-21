features_f <- "UCI HAR Dataset/features.txt"
activities_f <- "UCI HAR Dataset/activity_labels.txt"

test_f <- "UCI HAR Dataset/test/X_test.txt"
test_subject_f <- "UCI HAR Dataset/test/subject_test.txt"
test_activity_f <- "UCI HAR Dataset/test/y_test.txt"
train_f <- "UCI HAR Dataset/train/X_train.txt"
train_subject_f <- "UCI HAR Dataset/train/subject_train.txt"
train_activity_f <- "UCI HAR Dataset/train/y_train.txt"

if (!file.exists(test_f)) {
  stop("Stop")
}

Reload <- 1

if (Reload > 0) {
  # Read the column #s and feature names from features.txt (as described in features_info.txt)
  features_df <- read.table(features_f)
  
  # Read the activity descriptions
  activities_df <- read.table(activities_f)
  
  # Create a vector which only contains the name of the features
  #  We will use this vector for column names when we are reading from the data files
  features_v <- as.character(features_df[ , 2])
  
  # Use 'grepl' to select the 'mean()' and 'std()' columns we are interested in
  selected_cols <- grepl("mean\\(\\)|std\\(\\)", features_v)
  
  # Clean up the descriptions a bit, removing the excessive '.'s during the auto-renaming
  for (index in c(1:length(features_v))) {
    features_v[index] <- as.character(gsub("\\(\\)", "", features_v[index]))
    features_v[index] <- as.character(gsub("-", ".", features_v[index]))
  }
  
  # Merge the test and train subject tables
  subject_df <- rbind(read.table(test_subject_f, col.names = c('subject')),
                      read.table(train_subject_f, col.names = c('subject')))
  
  # Merge the test and train activity tables
  activity_df <- rbind(read.table(test_activity_f, col.names = c('activity')),
                       read.table(train_activity_f, col.names = c('activity')))
  
  # Merge the test and train data tables
  df <- cbind(subject_df,
              activity_df,
              rbind(read.table(test_f, col.names = features_v),
                    read.table(train_f, col.names = features_v)))
  
  # Subsetting to the columns we are interested in
  selected_cols <- c(c(TRUE, TRUE), selected_cols)
  df <- df[ , selected_cols]
}

# Create an empty data frame for our tiny data
avg_df <- data.frame()

# Evaluate the averages for each subject and each activity
for (subject in sort(unique(subject_df$subject))) {
  for (activity in sort(unique(activity_df$activity))) {
    avg_df <- rbind(avg_df, colMeans(df[df$subject == subject & df$activity == activity , ]))
  }
}

# Renaming the activity columns to meaningful descriptions
avg_df[,2] = activities_df[avg_df[,2], 2]

# Assigning the meaningful column names
colnames(avg_df) <- colnames(df)

# Write the tiny data to a text file
write.table(avg_df, file = 'tiny.data.txt', row.name=FALSE)
