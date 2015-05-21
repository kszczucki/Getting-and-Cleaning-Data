### DATA DICTIONARY - SAMSUNG (Getting and Cleaning Data)

#### features  [561 x 2] (all done by tbl_df(read.table("Dataset/UCI HAR Dataset/features.txt"))
                  List of all features - data from features.txt
                  
                   V1       V2
                     1 tBodyAcc-mean()-X
                     2 tBodyAcc-mean()-Y
                     3 tBodyAcc-mean()-Z
                     4  tBodyAcc-std()-X
                     5  tBodyAcc-std()-Y
                     6  tBodyAcc-std()-Z
                     7  tBodyAcc-mad()-X
                     8  tBodyAcc-mad()-Y
                     9  tBodyAcc-mad()-Z
                    10  tBodyAcc-max()-X
                   ...

#### activity_labels 6
                  Links the class labels with their activity name - data from activity_labels.txt
                  
                  V1                 V2
                  1  1            WALKING
                  2  2   WALKING_UPSTAIRS
                  3  3 WALKING_DOWNSTAIRS
                  4  4            SITTING
                  5  5           STANDING
                  6  6             LAYING

#### X_train   [7,352 x 561]
                  Training set - data from x_train.txt
  
          V1           V2         V3         V4         V5         V6         V7         V8         V9  ...
 1  0.2885845 -0.020294171 -0.1329051 -0.9952786 -0.9831106 -0.9135264 -0.9951121 -0.9831846 -0.9235270
 2  0.2784188 -0.016410568 -0.1235202 -0.9982453 -0.9753002 -0.9603220 -0.9988072 -0.9749144 -0.9576862
 3  0.2796531 -0.019467156 -0.1134617 -0.9953796 -0.9671870 -0.9789440 -0.9965199 -0.9636684 -0.9774686
 4  0.2791739 -0.026200646 -0.1232826 -0.9960915 -0.9834027 -0.9906751 -0.9970995 -0.9827498 -0.9893025
 5  0.2766288 -0.016569655 -0.1153619 -0.9981386 -0.9808173 -0.9904816 -0.9983211 -0.9796719 -0.9904411
 6  0.2771988 -0.010097850 -0.1051373 -0.9973350 -0.9904868 -0.9954200 -0.9976274 -0.9902177 -0.9955489
 7  0.2794539 -0.019640776 -0.1100221 -0.9969210 -0.9671859 -0.9831178 -0.9970027 -0.9660967 -0.9831163
 8  0.2774325 -0.030488303 -0.1253604 -0.9965593 -0.9667284 -0.9815853 -0.9964852 -0.9663131 -0.9829818
 9  0.2772934 -0.021750698 -0.1207508 -0.9973285 -0.9612453 -0.9836716 -0.9975958 -0.9572362 -0.9843793
 10 0.2805857 -0.009960298 -0.1060652 -0.9948034 -0.9727584 -0.9862439 -0.9954046 -0.9736632 -0.9856419  
 ..       ...          ...        ...        ...        ...        ...        ...        ...        ...

#### subject_train 7,352
                  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 - data from     subject_train.txt 
 
#### y_train 7,352
                  Training labels - data from y_train.txt
 
#### X_test [2,947 x 561]
                  Test set - data from X_test.txt
          V1          V2          V3         V4         V5         V6         V7         V8         V9 ...
1  0.2571778 -0.02328523 -0.01465376 -0.9384040 -0.9200908 -0.6676833 -0.9525011 -0.9252487 -0.6743022
2  0.2860267 -0.01316336 -0.11908252 -0.9754147 -0.9674579 -0.9449582 -0.9867988 -0.9684013 -0.9458234
3  0.2754848 -0.02605042 -0.11815167 -0.9938190 -0.9699255 -0.9627480 -0.9944034 -0.9707350 -0.9634827
4  0.2702982 -0.03261387 -0.11752018 -0.9947428 -0.9732676 -0.9670907 -0.9952743 -0.9744710 -0.9688974
5  0.2748330 -0.02784779 -0.12952716 -0.9938525 -0.9674455 -0.9782950 -0.9941114 -0.9659526 -0.9773460
6  0.2792199 -0.01862040 -0.11390197 -0.9944552 -0.9704169 -0.9653163 -0.9945851 -0.9694806 -0.9658969
7  0.2797459 -0.01827103 -0.10399988 -0.9958192 -0.9763536 -0.9777247 -0.9959961 -0.9736649 -0.9792526
8  0.2746005 -0.02503513 -0.11683085 -0.9955944 -0.9820689 -0.9852624 -0.9953409 -0.9814849 -0.9846096
9  0.2725287 -0.02095401 -0.11447249 -0.9967841 -0.9759063 -0.9865970 -0.9970293 -0.9737353 -0.9855565
10 0.2757457 -0.01037199 -0.09977589 -0.9983731 -0.9869329 -0.9910219 -0.9986629 -0.9871397 -0.9910843
..       ...         ...         ...        ...        ...        ...        ...        ...        ...
 
 
#### subject_test 2,947
                  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 - data from     subject_test.txt

#### y_test 2,947
                  Test labels - data from y_test.txt

#### X_all [10,299 x 561]
                  merged and renamed X_train and X_test data sets 
                  * rbind(X_train, X_test)
                  * names(X_all) <- features$V2
                  
####  grep_regexp  86 
                  columns with mean or std in label
                  * grep(names(X_all),pattern = ".*([Mm]ean|std)(.*)?")
                  
#### X_meanstd [10,299 x 86]
                  all observations with that fulfill grep_regexp
                  * X_meanstd <- X_all[,grep_regexp]

#### y_test_activ [2,947 x 2]
                  test labels joined with activity label names
                  * y_test_activ <- tbl_df(join(y_test,activity_labels, by = "V1")) 

#### y_train_activ [7,352 x 2]
                  train labels joined with activity label names
                  * y_train_activ <- tbl_df(join(y_train, activity_labels, by = "V1"))

#### y_sub_train_act [7,352 x 3]
                  train labels joined with subject performing activities
                  * y_sub_train_act <- tbl_df(cbind(y_train_activ, subject_train))

#### y_sub_test_act [2,947 x 3]   
                  test labels joined with subject performing activities
                  * y_sub_test_act <- tbl_df(cbind(y_test_activ, subject_test))

#### y_all [10,299 x 3]
                  joined and renamed all activities and subjects
                  * y_all <- tbl_df(rbind(y_sub_train_act,y_sub_test_act))
                  * names(y_all) <- c("activity_nr","activity_description","subject_nr")
        
#### Dataset [10,299 x 88]
                  Bind all data together
                  * Dataset <- tbl_df(cbind(y_all[,2:3], X_meanstd))
                  
#### dt_melt
                  Melting data with two main id's (column names : activity_description and subject_nr)
                  * dt_melt <- melt(Dataset, id = c("activity_description","subject_nr"))
                  
#### dt_cast      
                  to achive tidy data set with the average of each variable for each activity and each subject i've used dcast
                  * dt_cast <- dcast(dt_melt,activity_description + subject_nr ~ variable, mean)
                  
