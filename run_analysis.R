run_analysis <- 
        
        library(dplyr)
        library(reshape2)

        if(!exists("features")) features <- tbl_df(read.table("Dataset/UCI HAR Dataset/features.txt"))
        if(!exists("activity_labels")) activity_labels <- tbl_df(read.table("Dataset/UCI HAR Dataset/activity_labels.txt"))
        if(!exists("X_train")) X_train <- tbl_df(read.table("Dataset/UCI HAR Dataset/train/X_train.txt"))
        if(!exists("subject_train")) subject_train <- tbl_df(read.table("Dataset/UCI HAR Dataset/train/subject_train.txt"))
        if(!exists("y_train")) y_train <- tbl_df(read.table("Dataset/UCI HAR Dataset/train/y_train.txt"))
        if(!exists("X_test")) X_test <- tbl_df(read.table("Dataset/UCI HAR Dataset/test/X_test.txt"))
        if(!exists("subject_test")) subject_test <- tbl_df(read.table("Dataset/UCI HAR Dataset/test/subject_test.txt"))
        if(!exists("y_test")) y_test <- tbl_df(read.table("Dataset/UCI HAR Dataset/test/y_test.txt"))

        if(!exists("X_all")) {
                X_all <- rbind(X_train, X_test)
                names(X_all) <- features$V2
        }

        if(!exists("grep_regexp")) grep_regexp <- grep(names(X_all),pattern = ".*([Mm]ean|std)(.*)?")
        if(!exists("X_meanstd")) X_meanstd <- X_all[,grep_regexp]

        if(!exists("y_test_activ")) y_test_activ <- tbl_df(join(y_test,activity_labels, by = "V1"))
        if(!exists("y_train_activ")) y_train_activ <- tbl_df(join(y_train, activity_labels, by = "V1"))

        if(!exists("y_sub_train_act")) y_sub_train_act <- tbl_df(cbind(y_train_activ, subject_train))
        if(!exists("y_sub_test_act")) y_sub_test_act <- tbl_df(cbind(y_test_activ, subject_test))

        if(!exists("y_all")) {
                y_all <- tbl_df(rbind(y_sub_train_act,y_sub_test_act))
                names(y_all) <- c("activity_nr","activity_description","subject_nr")
        }

        if(!exists("Dataset")) Dataset <- tbl_df(cbind(y_all[,2:3], X_meanstd))

dt_melt <- melt(Dataset, id = c("activity_description","subject_nr"))
dt_cast <- dcast(dt_melt,activity_description + subject_nr ~ variable, mean)
