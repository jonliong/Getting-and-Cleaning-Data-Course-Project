##Getting-and-Cleaning-Data-Course-Project

###Introduction

The program consists of 2 files

*run_analysis.R
*common_functions.R

common_functions.R contains all the supporting functions that 
will produce the final result required.
run_analysis.R only contains 1 function that calls all the 
other functions to build the final data frame.

I am assuming that all the required files are available in the 
"data" sub-directory, in the directory structure identical to 
the one in the zip file.

I have not included any code to check for the existence of the 
directory/files, and to create the directory, download the data 
and unzip the files if the directory doesn't exist.

I have taken all columns that contain the string "mean" or "std,
but leaving out all the "angle" measurements containing mean. 
I also removed all special characters and made the feature column 
headers all lower case. 
