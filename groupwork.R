# ============================================================================
# DAT 511 Group Project: Human Activity Recognition Dataset Analysis
# GroupWork.R
# ============================================================================

# STEP 1: Load Required Libraries
# ============================================================================
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

# ============================================================================
# STEP 2: Download and Unzip Data (Automatic)
# ============================================================================
filename <- "UCI_HAR_Dataset.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

data_path <- "UCI HAR Dataset"

# ============================================================================
# STEP 3: Load Metadata Files
# ============================================================================
# Load activity labels
activity_labels <- read.table(file.path(data_path, "activity_labels.txt"), 
                              col.names = c("activity_id", "activity"))

# Load feature names
features <- read.table(file.path(data_path, "features.txt"), 
                       col.names = c("index", "feature_name"))

# ============================================================================
# STEP 4: Extract Mean and Standard Deviation Features
# ============================================================================
# We only want columns with "-mean()" or "-std()"
mean_std_features <- grep("-(mean|std)\\(\\)", features$feature_name)
selected_features <- features$feature_name[mean_std_features]

# ============================================================================
# STEP 5: Load and Process Training Data
# ============================================================================
X_train <- read.table(file.path(data_path, "train", "X_train.txt"))[, mean_std_features]
colnames(X_train) <- selected_features

y_train <- read.table(file.path(data_path, "train", "y_train.txt"), 
                      col.names = "activity_id")

subject_train <- read.table(file.path(data_path, "train", "subject_train.txt"), 
                            col.names = "subject")

# ============================================================================
# STEP 6: Load and Process Test Data
# ============================================================================
X_test <- read.table(file.path(data_path, "test", "X_test.txt"))[, mean_std_features]
colnames(X_test) <- selected_features

y_test <- read.table(file.path(data_path, "test", "y_test.txt"), 
                     col.names = "activity_id")

subject_test <- read.table(file.path(data_path, "test", "subject_test.txt"), 
                           col.names = "subject")

# ============================================================================
# STEP 7: Combine Training and Test Datasets
# ============================================================================
data_train <- cbind(subject_train, y_train, X_train)
data_test <- cbind(subject_test, y_test, X_test)

# Merge them together
data_combined <- rbind(data_train, data_test)

# ============================================================================
# STEP 8: Add Descriptive Activity Names
# ============================================================================
data_combined <- merge(data_combined, activity_labels, by = "activity_id", all.x = TRUE)

# Remove the numeric ID now that we have the names
data_combined$activity_id <- NULL

# ============================================================================
# STEP 9: Create Tidy Dataset with Averages
# ============================================================================
# Group by subject and activity, then calculate the mean of all measurements
tidy_data <- data_combined %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = 'drop')

# ============================================================================
# STEP 10: Save the Tidy Dataset
# ============================================================================
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)

# Final message to console
print("Process Complete! 'tidy_dataset.txt' has been saved to your folder.")