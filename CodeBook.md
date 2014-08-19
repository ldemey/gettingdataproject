### Meaning of the rows

The dataset gives the means per subject/activity pair. Since there are 30 subjects and 6 activity types, there are 30 x 6 = 180 rows.

### Meaning of the columns

Starting with the column names (features) as described in the code book `features.txt` of the original dataset, we select only those whose name contains the string `mean` or the string `std`, i.e. those that are concerned with means or standard deviations. For each of these features `f`, we calculate the mean (per  subject/activity pair) and store it under the feature `MEAN_OF_f`. For example, the means (per subject/activity pair) of the original `tBodyAcc-mean()-X` are stored in `MEAN_OF_tBodyAcc-mean()-X`. 

More information about the physical interpretation of the original features (i.e. before averaging them  per subject/activity pair) can be found in the file `features_info.txt` that accomponies the original dataset. The original features were normalized and bounded within [-1,1]. 

The original dataset contained 561 features (as listed in `features.txt`). Of these 561, a total number of 86 contain either the string `mean` or the string `std`. Together with the two features `subject` and `activity_type`, the new dataset thus contains 86 + 2 = 88 columns.

### Column names

1. `subject` Range: 1 to 30.                                
2. `activity_type` Range: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`.
3. `MEAN_OF_tBodyAcc-mean()-X`
4. `MEAN_OF_tBodyAcc-mean()-Y`
5. `MEAN_OF_tBodyAcc-mean()-Z`
6. `MEAN_OF_tBodyAcc-std()-X`                    
7. `MEAN_OF_tBodyAcc-std()-Y`                 
8. `MEAN_OF_tBodyAcc-std()-Z`               
9. `MEAN_OF_tGravityAcc-mean()-X`            
10. `MEAN_OF_tGravityAcc-mean()-Y`                
11. `MEAN_OF_tGravityAcc-mean()-Z`             
12. `MEAN_OF_tGravityAcc-std()-X`                 
13. `MEAN_OF_tGravityAcc-std()-Y`               
14. `MEAN_OF_tGravityAcc-std()-Z`               
15. `MEAN_OF_tBodyAccJerk-mean()-X`          
16. `MEAN_OF_tBodyAccJerk-mean()-Y`               
17. `MEAN_OF_tBodyAccJerk-mean()-Z`            
18. `MEAN_OF_tBodyAccJerk-std()-X`            
19. `MEAN_OF_tBodyAccJerk-std()-Y`   
20. `MEAN_OF_tBodyAccJerk-std()-Z`                
21. `MEAN_OF_tBodyGyro-mean()-X`               
22. `MEAN_OF_tBodyGyro-mean()-Y`                  
23. `MEAN_OF_tBodyGyro-mean()-Z`               
24. `MEAN_OF_tBodyGyro-std()-X`                   
25. `MEAN_OF_tBodyGyro-std()-Y`                 
26. `MEAN_OF_tBodyGyro-std()-Z`                   
27. `MEAN_OF_tBodyGyroJerk-mean()-X`            
28. `MEAN_OF_tBodyGyroJerk-mean()-Y`              
29. `MEAN_OF_tBodyGyroJerk-mean()-Z`
30. `MEAN_OF_tBodyGyroJerk-std()-X`          
31. `MEAN_OF_tBodyGyroJerk-std()-Y`
32. `MEAN_OF_tBodyGyroJerk-std()-Z`           
33. `MEAN_OF_tBodyAccMag-mean()`
34. `MEAN_OF_tBodyAccMag-std()`                   
35. `MEAN_OF_tGravityAccMag-mean()`
36. `MEAN_OF_tGravityAccMag-std()`                
37. `MEAN_OF_tBodyAccJerkMag-mean()`             
38. `MEAN_OF_tBodyAccJerkMag-std()`               
39. `MEAN_OF_tBodyGyroMag-mean()`                
40. `MEAN_OF_tBodyGyroMag-std()`                 
41. `MEAN_OF_tBodyGyroJerkMag-mean()`          
42. `MEAN_OF_tBodyGyroJerkMag-std()`              
43. `MEAN_OF_fBodyAcc-mean()-X`                  
44. `MEAN_OF_fBodyAcc-mean()-Y`                   
45. `MEAN_OF_fBodyAcc-mean()-Z`                  
46. `MEAN_OF_fBodyAcc-std()-X`                    
47. `MEAN_OF_fBodyAcc-std()-Y`                   
48. `MEAN_OF_fBodyAcc-std()-Z`                    
49. `MEAN_OF_fBodyAcc-meanFreq()-X`              
50. `MEAN_OF_fBodyAcc-meanFreq()-Y`               
51. `MEAN_OF_fBodyAcc-meanFreq()-Z`         
52. `MEAN_OF_fBodyAccJerk-mean()-X`               
53. `MEAN_OF_fBodyAccJerk-mean()-Y`           
54. `MEAN_OF_fBodyAccJerk-mean()-Z`               
55. `MEAN_OF_fBodyAccJerk-std()-X`               
56. `MEAN_OF_fBodyAccJerk-std()-Y`                
57. `MEAN_OF_fBodyAccJerk-std()-Z`                
58. `MEAN_OF_fBodyAccJerk-meanFreq()-X`           
59. `MEAN_OF_fBodyAccJerk-meanFreq()-Y`           
60. `MEAN_OF_fBodyAccJerk-meanFreq()-Z`           
61. `MEAN_OF_fBodyGyro-mean()-X`                   
62. `MEAN_OF_fBodyGyro-mean()-Y`                  
63. `MEAN_OF_fBodyGyro-mean()-Z`                   
64. `MEAN_OF_fBodyGyro-std()-X`                   
65. `MEAN_OF_fBodyGyro-std()-Y`                    
66. `MEAN_OF_fBodyGyro-std()-Z`                   
67. `MEAN_OF_fBodyGyro-meanFreq()-X`               
68. `MEAN_OF_fBodyGyro-meanFreq()-Y`              
69. `MEAN_OF_fBodyGyro-meanFreq()-Z`               
70. `MEAN_OF_fBodyAccMag-mean()`                  
71. `MEAN_OF_fBodyAccMag-std()`                   
72. `MEAN_OF_fBodyAccMag-meanFreq()`              
73. `MEAN_OF_fBodyBodyAccJerkMag-mean()`           
74. `MEAN_OF_fBodyBodyAccJerkMag-std()`           
75. `MEAN_OF_fBodyBodyAccJerkMag-meanFreq()`       
76. `MEAN_OF_fBodyBodyGyroMag-mean()`             
77. `MEAN_OF_fBodyBodyGyroMag-std()`               
78. `MEAN_OF_fBodyBodyGyroMag-meanFreq()`         
79. `MEAN_OF_fBodyBodyGyroJerkMag-mean()`         
80. `MEAN_OF_fBodyBodyGyroJerkMag-std()`          
81. `MEAN_OF_fBodyBodyGyroJerkMag-meanFreq()`     
82. `MEAN_OF_angle(tBodyAccMean,gravity)`         
83. `MEAN_OF_angle(tBodyAccJerkMean),gravityMean)`
84. `MEAN_OF_angle(tBodyGyroMean,gravityMean)`    
85. `MEAN_OF_angle(tBodyGyroJerkMean,gravityMean)` 
86. `MEAN_OF_angle(X,gravityMean)`                
87. `MEAN_OF_angle(Y,gravityMean)`                
88. `MEAN_OF_angle(Z,gravityMean)` 