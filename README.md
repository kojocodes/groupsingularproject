# groupsingularproject
### Cellphone Logic: Getting a Handle on How We Move

## What’s this all about?
How does your phone know if you are sitting, standing, or climbing stairs? This is accomplished by sensors known as Accelerometer. The purpose of this project to take a huge, messy collection of data gathered from Samsung Galaxy phone accelerometers and organize the raw data into a format that is easier to read.

## The Goal
1. To consolidate and merge all of the many different files and folders into one single file.
2. To remove all "noise" from the dataset and retain only the measurements that we consider important, which are the averages.
3. To convert all the confusing numbers into meaningful, everyday language. For example, we will be converting "1" into "Walking".

## How the script works:
### THE SIMPLE VERSION
1. Merge: I merged the Training and Test data sets together, giving us a complete representation of all 30 of our participants.
2. Filter: My original dataset had over 500 different types of measurements; however, I deleted all unneeded measurements, keeping only the Means and Standard Deviations.
3. Cleanup: I renamed the columns and replaced activity IDs with descriptive words, so you no longer have to use a codebook to read the table.
4. The Summary.** Finally, I calculated the average for every measurement for each person and each activity. 

## How to see the results
1. Run the `GroupWork.R` script in RStudio.
2. Look for a file called `tidy_dataset.txt` in your folder.
3. That’s the "Tidy" version—one row for every person/activity combo with all their stats averaged out.
