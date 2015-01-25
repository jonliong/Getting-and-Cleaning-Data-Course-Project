
main <- function() {
  library(dplyr)
  library(tidyr)
  
  variablenames <- getMeanStdVars()
  
  ##Get the Subject data frames
  subjecttrain <- getSubjectTrain()
  subjecttest <- getSubjectTest()
  subject <- rbind(subjecttrain, subjecttest)
  
  ##Get the activity data frames
  activitylabels <- getActivityLabels()
  activitytrain <- getYTrain()
  activitytest <- getYTest()

  ##All data frames have the same number of columns. A simple row bind will do 
  activity <- rbind(activitytrain, activitytest)
  activity <- replaceActivityId(activitylabels, activity)
  
  #Get features readings
  datatrain <- getXTrain()
  datatest <- getXTest()

  ##All data frames have the same number of columns. A simple row bind will do 
  data <- rbind(datatrain, datatest)
  data <- subsetbyCol(data, variablenames)
  regex = "[-() ]"
  covnertedvar <- gsub(regex, "", variablenames$V2)
  names(data) <- tolower(covnertedvar) 
  
  ##All data frames have the same number of rows. A simple column bind will do 
  fulldata <- cbind(subject, activity, data)
  fulldata <- select(fulldata, -activity)
  
  fulldata <- arrange(fulldata, subject, activity)

  fulldata <- gather(fulldata, feature, value, tbodyaccmeanx:fbodybodygyrojerkmagmeanfreq)
  
  ##Transform to long form for easier calculation
  fulldata <- group_by(fulldata, subject, activitydescription, feature)
  fulldata <- summarize(fulldata, value=mean(value, na.rm=TRUE))

  ##Tranform back to wide form for easier reading
  fulldata <- spread(fulldata, feature, value)
  fulldata
}