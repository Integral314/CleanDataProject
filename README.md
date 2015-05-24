# CleanDataProject
Course Project for Data Science Specialization course "Getting and Cleaning Data"
OVERVIEW:
=======================================================================
This R script takes data from a Galaxy S smartphone as found at the link below. The data is read it to R.  It is then named with the appropriate activity and variable names that are available in the "features.txt" and "activity_lables.txt" files.  Then the data is combined to create a single dataframe.  From this dataframe, the variables dealing with means and standard deviations are extracted.  The means of the extracted set is taken and has been uploaded here along with the script, readMe.md and Codebook.md files.
=======================================================================

The first section of code reads the file names out of the working directory.  This is to create a vector of names to be used in to read the data into R.

The next section is the for loop that pastes the directory information on to the file names read in the last section.

The next section reads the data in. It uses a for loop to examine the data classes to speed up the system time to read in large data. The data being read in here is from the 'test' and 'train' folders. Each folder has a file of 'X' data, 'Y' data and 'subject' data.  The subject data is an identifier for the individual user of the Samsung phone.  At this time, the script also reads in the activity labels file.

In the next section, the code combines much of the data into an object. It leaves out the 'Y" data for further processing.

The next section is a for loop that takes the numbers from the 'Y' data and matches it to the activity name from activity_labels.txt.  This is to satisfy STEP 3.

The next section is the final combination of the data.  This completes STEP 1.

The next section of code satisfies STEP 4.  The features.txt file is read and using the names() function, it is used to appropriately label the variables. The "activity" and "Subject ID" labels are added to the feature.txt to account for the first two columns.

The next section satisfies STEP 2.  Data that is a mean or standard deviation is extracted from the data and stored separately.  The 'grep' function identifies any label from the feature.txt file using "mean" or "std".  It returns a vector of numbers correlating to the data.  Those are shifted left to account for the subject ID and Activity columns already added.  We then extract the means along with the Activity and Subject ID.  Variables are properly labeled from previous steps.

Finally, the mean is obtained using the sapply function.  This is output as the final data.


This script takes data from the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
