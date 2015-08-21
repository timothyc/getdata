## README
1. run_analysis.R first reads and stores the features and activity labels.
2. Uses `grepl()` to select the columns (all `mean()` and `std()` columns) we are interested in.
3. Increases the readability of the feature names by removing the `'-'`s and `'()'`s because these symbol will be converted to `'.'`s when making data frames.
4. Reads the subjects in test and training, merges the data and stores it in the `subject_df` data frame.
5. Reads the activities in test and training, merges the data and stores it in the `activity_df` data frame.
6. Reads the sensor data in test and training, merges the data and stores it in the `df` data frame.
7. Merges the sensor data with subjects and activities and stores it back in `df`.
8. Subsets the sensor data with the selected columns data frame.
9. Loops through the sensor data, finds the means and standard deviations of each subject of each activity in the sensor data then stores them in the tiny data frame.
10. Assigns meaningful column names to the tiny data.
11. Uses `write.table()` and dumps the tiny data in `tiny.data.txt`.
