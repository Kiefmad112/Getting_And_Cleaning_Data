    library(reshape2)
    filename <- "getdata_dataset.zip"
    
    
    # Download the dataset:
    if (!file.exists(filename)){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, filename)
    }  
    
    
    # Unzip the dataset:
    if (!file.exists("UCI HAR Dataset")) {unzip(filename)}
    
    
    # Upload labels and features
    labels <- read.table("UCI HAR Dataset/activity_labels.txt")
    features <- read.table("UCI HAR Dataset/features.txt")
    labels[,2] <- as.character(labels[,2])

    
    # Extract mean and standard deviation
    mnStd <- grep(".*mean.*|.*std.*", as.character(labels[,2]))
    names <- features[mnStd,2]
    names = gsub('[-()]', '', gsub('-mean', ' Mean ', (gsub('-std', ' StdDev ', names))))
    
    
    # Load training and testingg data
    xtrn <- read.table("UCI HAR Dataset/train/X_train.txt")[mnStd]
    xtst <- read.table("UCI HAR Dataset/test/X_test.txt")[mnStd]
    ytrn <- read.table("UCI HAR Dataset/train/y_train.txt")
    ytst <- read.table("UCI HAR Dataset/test/y_test.txt")
    subj_trn <- read.table("UCI HAR Dataset/train/subject_train.txt")
    subj_tst <- read.table("UCI HAR Dataset/test/subject_test.txt")

    
    # Merge all data
    training <- cbind(xtrn, ytrn,  subj_trn)
    testing  <- cbind(xtst, ytst,  subj_tst)
    all <- rbind(training, testing)
    colnames(all) <- c("Subject", "Activity", names)
    
    
    # Translate Activities and Subjects into factors
    all$Activity <- factor(all$Activity, levels = labels[,1], labels = labels[,2])
    all$Subject <- as.factor(all$Subject)
    
    
    # Restructure data and find mean
    merged <- melt(all, id = c("Subject", "Activity"))
    mean <- dcast(merged, Subject + Activity ~ variable, mean)
    
    
    # Write all mean data to file
    write.table(mean, "Mean_AllData.txt", row.names = FALSE, quote = FALSE)
    
    