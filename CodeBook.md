# Introduction

 `run_analysis.R` completes all 5 steps described in the course project's description.

* 1st all the data is merged using the `rbind()` function. 
* 2nd the mean and standard deviation measures are extracted and renamed based on the names taken from `features.txt`.
* 3rd activity data is identified 1:6 with names and IDs from `activity_labels.txt` and added to the dataset.
* 4th indescript column names are addressed.
* 5th a final dataset is generated and upoaded to this repository with the average measures for each subject and activity type under the name: 'Mean_AllData.txt'

# Variables

* `xtrn`, `ytrn`, `xtst`, `ytst`, `subj_trn` and `subj_tst` contain the the downloaded files.
* `x_all`, `y_all` and `subj_all` merge the datasets.
* `features` contains the correct names for the `x_all` dataset, which are applied to the column names stored in `mnStd`, a numeric vector used to extract the desired data.
* The same process used for the `Activities` variable.
* `all` merges `x_all`, `y_all` and `subj_all` into a combined dataset.
* `Mean_AllData` contains the relevant averages in a '.txt' file.
