#Project Week 3 - getdata Coursera

This folder contain the files of the __week 3 project__ to the __getdata coursera course__.
To execute or run the script, you have to do:

1. Download this file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Extract this "zip" file in your computer. In my case, a folder named "Coursera/getdata" in "Documents" main folder was created.
3. You will see a new folder called "UCI HAR Dataset" with files and folder inside it.
4. In R enviorment, set the work directory to the extracted folder parent. In my case: _setwd("~/Coursera/getdata")_.
5. Look: in the "run_analysis.R" there are 2 functions and a call to one of them in the last line. This command will execute the analysis when you load the script.
6. The functions inside the script read the tables in the ".txt" files inside the "UCI HAR Dataset" folder, combine and merge to generate a tidy dataset.
7. When the script finish the execution, you will get a tidyDataSet.txt in your work directory.

