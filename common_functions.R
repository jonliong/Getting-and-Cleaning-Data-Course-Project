read <- function(file, sep="", header=TRUE, type = "") {
  df <- NULL
  if (type == "csv") {
    df <- read.csv(file, header)
  } else if (type == "RDS") {
    df <- readRDS(file)
  } else {
    df <- read.table(file, sep=sep, header=header)
  }
  df
}

getMeanStdVars <- function() {
  datadir <- "./data"
  file <- paste(datadir, "features.txt", sep="/")
  z <- read(file = file, header=FALSE)
  aa <- z[grep("mean|std", z$V2),]
  aa
}

getActivityLabels <- function() {
  datadir <- "./data"
  file <- paste(datadir, "activity_labels.txt", sep="/")
  df <- read(file = file, header=FALSE)
  actdesc <- c("Walking", "Walking Upstairs", "Walking Downstairs", 
               "Sitting", "Standing", "Laying")
  df <- cbind(df, actdesc)
  names(df) <- c("actId", "actCode", "actDesc")
  df
}

getYTest <- function() {
  datadir <- "./data/test"
  file <- paste(datadir, "y_test.txt", sep="/")
  df <- read(file = file, header=FALSE)
  names(df) <- c("activity")
  df
}

getXTest <- function() {
  datadir <- "./data/test"
  file <- paste(datadir, "X_test.txt", sep="/")
  df <- read(file = file, header=FALSE)
  df
}

getSubjectTest <- function() {
  datadir <- "./data/test"
  file <- paste(datadir, "subject_test.txt", sep="/")
  df <- read(file = file, header=FALSE)
  names(df) <- c("subject")
  df
}

getSubjectTrain <- function() {
  datadir <- "./data/train"
  file <- paste(datadir, "subject_train.txt", sep="/")
  df <- read(file = file, header=FALSE)
  names(df) <- c("subject")
  df
}

getYTrain <- function() {
  datadir <- "./data/train"
  file <- paste(datadir, "y_train.txt", sep="/")
  df <- read(file = file, header=FALSE)
  names(df) <- c("activity")
  df
}

getXTrain <- function() {
  datadir <- "./data/train"
  file <- paste(datadir, "X_train.txt", sep="/")
  df <- read(file = file, header=FALSE)
  df
}

replaceActivityId <- function(activitylabels, df) {
  df$activitydescription <- NA
  for (i in activitylabels$actId) {
    ##    print(i)
    desc <- (activitylabels[i,3])
    ##    print(class(desc))
    ##    print(desc)
    ##df$Desc <- df[df$activity == i,] <- desc
    df$activitydescription[df$activity == i] <- as.character(desc)
    ##    df$activity[df$activity == i] <- desc
    ##    print(unique(df$activity))
    ##    print(paste("Desc", unique(df$Desc)))
    
  }
  df
}

getFeatures <- function() {
  datadir <- "./data"
  file <- paste(datadir, "features.txt", sep="/")
  df <- read(file = file, header=FALSE)
  df
}

subsetbyCol <- function(df, coldf) {
  newdf <- df[,coldf[,1]]
  newdf
}
