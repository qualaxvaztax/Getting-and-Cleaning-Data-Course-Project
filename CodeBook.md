## Code Book for Getting and Cleaning Data Course Project

### Original data 
The original data for this project came from a set of experiments carried out by researchers from the University of Genoa and BarcelonaTech with a group of 30 volunteers within an age range of 19-48 years. The researchers measured the patterns of motion of subjects while performing six different activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) by means of the accelerometer and gyroscope embedded in the smartphone (Samsung Galaxy S II) the participants were wearing in their waists. The researchers collected measurements of 3-axial linear acceleration and 3-axial angular velocity. After further classifying the data (separating body motion from gravitational components) and calculating time and frequency for their measurements, along with transformations such as jerk or vector magnitude, the researchers arranged their data into two datasets: *test* and *train*.

Both datasets, containing 561 measurements variables and a sum of 10,299 observations, were distributed along the following files:

1. **X_test.txt**: Test set.
2. **y_test.txt**: Test labels.
3. **subject_test.txt**: Each row identifies the subject who performed the activity.
4. **X_train.txt**: Training set.
5. **y_train.txt**: Training labels.
6. **subject_train.txt**: Each row identifies the subject who performed the activity.

Additionally, the full dataset included the following files with labels for the variables and the activities:

1. **features.txt**: List of all features.
2. **activity_labels.txt**: Links the class labels with their activity name.

### Purpose of this analysis
To create a tidy dataset (according to the parameters described in *Procedure*) from the data files of the aforementioned study.

### Procedure
As also described in the comment sections of *run_analysis.R* script, the main steps taken in order to create the output dataset for this project were the following:

1. Load the *test* and *train* datasets into R dataframes, including the files containing information about subjects and activities.
2. Append the columns for subjects and activities to its corresponding (*test* or *train*) main dataset after creating index columns in each dataframe and renaming the *subject* and *activity* variables accordingly.
3. Merge the *test* and *train* main datasets into a single one and reorder it by *subject* and *activity*.
4. Rename measurements variables using the features description file.
5. Create a new dataframe containing only the measurements variables for the mean and the standard deviation, along with the subjects and activities data.
6. Adjust variable names of the new dataframe in order to make them descriptive. The following criteria from the course materials were applied:
    1. All lower case.
    2. With no abbreviations.
    3. Not duplicated.
    4. With no special characters.
7. Finally, create a new summary dataset with the average of each variable for each subject and each activity.

### Selected variables
Bellow appears the list of the 68 variables included in the output dataset for this project. The list contains a description of the variables names, its data type and a description of its contents. In the case of *activity* (the only categorical variable in the dataset), its levels are also shown.  

1. **subject**: Integer variable identifying each of the 30 subjects in the study.
2. **activity**: Factor variable identifying the activities performed by the subjects during the study according to the following six categories:
    1. walking
    2. walkingupstairs
    3. walkingdownstairs
    4. sitting
    5. standing
    6. laying
3. **timebodyaccelerometermeanx**: Numeric variable indicating the mean time of body acceleration in x axis.
4. **timebodyaccelerometermeany**: Numeric variable indicating the mean time of body acceleration in y axis.
5. **timebodyaccelerometermeanz**: Numeric variable indicating the mean time of body acceleration in z axis.
6. **timebodyaccelerometerstandarddeviationx**: Numeric variable indicating the standard deviation time of body acceleration in x axis.
7. **timebodyaccelerometerstandarddeviationy**: Numeric variable indicating the standard deviation time of body acceleration in y axis.
8. **timebodyaccelerometerstandarddeviationz**: Numeric variable indicating the standard deviation time of body acceleration in z axis.
9. **timegravityaccelerometermeanx**: Numeric variable indicating the mean time of gravity acceleration in x axis.
10. **timegravityaccelerometermeany**: Numeric variable indicating the mean time of gravity acceleration in y axis.
11. **timegravityaccelerometermeanz**: Numeric variable indicating the mean time of gravity acceleration in z axis.
12. **timegravityaccelerometerstandarddeviationx**: Numeric variable indicating the standard deviation time of gravity acceleration in x axis.
13. **timegravityaccelerometerstandarddeviationy**: Numeric variable indicating the standard deviation time of gravity acceleration in y axis.
14. **timegravityaccelerometerstandarddeviationz**: Numeric variable indicating the standard deviation time of gravity acceleration in z axis.
15. **timebodyaccelerometerjerkmeanx**: Numeric variable indicating the mean time of body jerk in x axis.
16. **timebodyaccelerometerjerkmeany**: Numeric variable indicating the mean time of body jerk in y axis.
17. **timebodyaccelerometerjerkmeanz**: Numeric variable indicating the mean time of body jerk in z axis.
18. **timebodyaccelerometerjerkstandarddeviationx**: Numeric variable indicating the standard deviation time of body jerk in x axis.
19. **timebodyaccelerometerjerkstandarddeviationy**: Numeric variable indicating the standard deviation time of body jerk in y axis.
20. **timebodyaccelerometerjerkstandarddeviationz**: Numeric variable indicating the standard deviation time of body jerk in z axis.
21. **timebodygyroscopemeanx**: Numeric variable indicating the mean time of body angular velocity in x axis.
22. **timebodygyroscopemeany**: Numeric variable indicating the mean time of body angular velocity in y axis.
23. **timebodygyroscopemeanz**: Numeric variable indicating the mean time of body angular velocity in z axis.
24. **timebodygyroscopestandarddeviationx**: Numeric variable indicating the standard deviation time of body angular velocity in x axis.
25. **timebodygyroscopestandarddeviationy**: Numeric variable indicating the standard deviation time of body angular velocity in y axis.
26. **timebodygyroscopestandarddeviationz**: Numeric variable indicating the standard deviation time of body angular velocity in z axis.
27. **timebodygyroscopejerkmeanx**: Numeric variable indicating the mean time of body jerk in x axis.
28. **timebodygyroscopejerkmeany**: Numeric variable indicating the mean time of body jerk in y axis.
29. **timebodygyroscopejerkmeanz**: Numeric variable indicating the mean time of body jerk in z axis.
30. **timebodygyroscopejerkstandarddeviationx**: Numeric variable indicating the standard deviation time of body jerk in x axis.
31. **timebodygyroscopejerkstandarddeviationy**: Numeric variable indicating the standard deviation time of body jerk in y axis.
32. **timebodygyroscopejerkstandarddeviationz**: Numeric variable indicating the standard deviation time of body jerk in z axis.
33. **timebodyaccelerometermagnitudemean**: Numeric variable indicating the mean time of body acceleration magnitude.
34. **timebodyaccelerometermagnitudestandarddeviation**: Numeric variable indicating the standard deviation time of body acceleration magnitude.
35. **timegravityaccelerometermagnitudemean**: Numeric variable indicating the mean time of gravity acceleration magnitude.
36. **timegravityaccelerometermagnitudestandarddeviation**: Numeric variable indicating the standard deviation time of gravity acceleration magnitude.
37. **timebodyaccelerometerjerkmagnitudemean**: Numeric variable indicating the mean time of body jerk magnitude.
38. **timebodyaccelerometerjerkmagnitudestandarddeviation**: Numeric variable indicating the standard deviation time of body jerk magnitude.
39. **timebodygyroscopemagnitudemean**: Numeric variable indicating the mean time of body angular velocity magnitude.
40. **timebodygyroscopemagnitudestandarddeviation**: Numeric variable indicating the standard deviation time of body angular velocity magnitude.
41. **timebodygyroscopejerkmagnitudemean**: Numeric variable indicating the mean time of body jerk magnitude.
42. **timebodygyroscopejerkmagnitudestandarddeviation**: Numeric variable indicating the standard deviation time of body jerk magnitude.
43. **frequencybodyaccelerometermeanx**: Numeric variable indicating the mean frequency of body acceleration in x axis.
44. **frequencybodyaccelerometermeany**: Numeric variable indicating the mean frequency of body acceleration in y axis.
45. **frequencybodyaccelerometermeanz**: Numeric variable indicating the mean frequency of body acceleration in z axis.
46. **frequencybodyaccelerometerstandarddeviationx**: Numeric variable indicating the standard deviation frequency of body acceleration in x axis.
47. **frequencybodyaccelerometerstandarddeviationy**: Numeric variable indicating the standard deviation frequency of body acceleration in y axis.
48. **frequencybodyaccelerometerstandarddeviationz**: Numeric variable indicating the standard deviation frequency of body acceleration in z axis.
49. **frequencybodyaccelerometerjerkmeanx**: Numeric variable indicating the mean frequency of body jerk in x axis.
50. **frequencybodyaccelerometerjerkmeany**: Numeric variable indicating the mean frequency of body jerk in y axis.
51. **frequencybodyaccelerometerjerkmeanz**: Numeric variable indicating the mean frequency of body jerk in z axis.
52. **frequencybodyaccelerometerjerkstandarddeviationx**: Numeric variable indicating the standard deviation frequency of body jerk in x axis.
53. **frequencybodyaccelerometerjerkstandarddeviationy**: Numeric variable indicating the standard deviation frequency of body jerk in y axis.
54. **frequencybodyaccelerometerjerkstandarddeviationz**: Numeric variable indicating the standard deviation frequency of body jerk in z axis.
55. **frequencybodygyroscopemeanx**: Numeric variable indicating the mean frequency of body angular velocity in x axis.
56. **frequencybodygyroscopemeany**: Numeric variable indicating the mean frequency of body angular velocity in y axis.
57. **frequencybodygyroscopemeanz**: Numeric variable indicating the mean frequency of body angular velocity in z axis.
58. **frequencybodygyroscopestandarddeviationx**: Numeric variable indicating the standard deviation frequency of body angular velocity in x axis.
59. **frequencybodygyroscopestandarddeviationy**: Numeric variable indicating the standard deviation frequency of body angular velocity in y axis.
60. **frequencybodygyroscopestandarddeviationz**: Numeric variable indicating the standard deviation frequency of body angular velocity in z axis.
61. **frequencybodyaccelerometermagnitudemean**: Numeric variable indicating the mean frequency of body acceleration magnitude.
62. **frequencybodyaccelerometermagnitudestandarddeviation**: Numeric variable indicating the standard deviation frequency of body acceleration magnitude.
63. **frequencybodyaccelerometerjerkmagnitudemean**: Numeric variable indicating the mean frequency of body jerk magnitude.
64. **frequencybodyaccelerometerjerkmagnitudestandarddeviation**: Numeric variable indicating the standard deviation frequency of body jerk magnitude.
65. **frequencybodygyroscopemagnitudemean**: Numeric variable indicating the mean frequency of body angular velocity magnitude.
66. **frequencybodygyroscopemagnitudestandarddeviation**: Numeric variable indicating the standard deviation frequency of body angular velocity magnitude.
67. **frequencybodygyroscopejerkmagnitudemean**: Numeric variable indicating the mean frequency of body jerk magnitude.
68. **frequencybodygyroscopejerkmagnitudestandarddeviation**: Numeric variable indicating the standard deviation frequency of body jerk magnitude.