# Project Code Book

## [cite_start]Data Overview [cite: 11]
[cite_start]This data comes from the "Human Activity Recognition Using Smartphones" study[cite: 21]. It tracks 30 people doing 6 different activities using phone sensors.

## [cite_start]Variables [cite: 12]
* **Subject**: The ID of the person (1-30).
* **Activity**: What they were doing (Walking, Sitting, etc.).
* **Measurements**: 66 columns of sensor data (all averaged out). These are normalized between -1 and 1.

## [cite_start]Transformations [cite: 14]
1. [cite_start]Merged the Training and Test datasets[cite: 25].
2. [cite_start]Selected only Mean/Std columns[cite: 26].
3. [cite_start]Attached descriptive activity names[cite: 27].
4. [cite_start]Calculated the mean of each variable for each subject and activity[cite: 29].
