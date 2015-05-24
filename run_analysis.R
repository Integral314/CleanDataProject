## NOTE TO GRADERS: Steps are out of order and have been labeled accordingly
run_analysis <- function(){
## Read in the names of the files into a vector and select out the inertial folder
trainfiles <- list.files("./train")
testfiles <- list.files("./test")
trainfiles <- trainfiles[2:4]
testfiles <- testfiles[2:4]

## Creates a vector of the files names
vec <- c("./train/", "./test/")
for(i in 1:3){
        trainfiles[i] <- paste0(vec[1],trainfiles[i])
        testfiles[i] <- paste0(vec[2], testfiles[i])
}
files <- c(trainfiles, testfiles)

## Reads the data into R
ini <- c(1,2)
classes <- c(1,2)
for(i in 1:6){
        ini[i] <- read.table(files[i], nrows=100)
        classes[i]<-sapply(ini[i], class)
}
datasubtest <- read.table(files[1], colClasses=classes[1])
dataXtest <- read.table(files[2], colClasses=classes[2])
dataYtest <- read.table(files[3], colClasses=classes[3])
datasubtrain <- read.table(files[4], colClasses=classes[4])
dataXtrain <- read.table(files[5], colClasses=classes[5])
dataYtrain <- read.table(files[6], colClasses=classes[6])
actlabels <- read.table("activity_labels.txt")
actlabels <- as.matrix(actlabels)

## Combine the data by type (STEP 1)
data <- rbind(dataXtrain, dataXtest)
dataY <- rbind(dataYtrain, dataYtest)
dataSub <- rbind(datasubtrain, datasubtest)

## creates column of activity names for the Y data (STEP 3)
for(i in 1:10299){
        if(dataY[i,1] == actlabels[1,1]){
                dataY[i,2] <- actlabels[1,2]
        }else if(dataY[i,1] == actlabels[2,1]){
                dataY[i,2] <- actlabels[2,2]
        }else if(dataY[i,1] == actlabels[3,1]){
                dataY[i,2] <- actlabels[3,2]
        }else if(dataY[i,1] == actlabels[4,1]){
                dataY[i,2] <- actlabels[4,2]
        }else if(dataY[i,1] == actlabels[5,1]){
                dataY[i,2] <- actlabels[5,2]
        }else {dataY[i,2] <- actlabels[6,2]}
}

## Combine the data to a single object
data <- cbind(dataY[,2], dataSub, data)

## identifies the variable names (STEP 4)
feat <- read.table("features.txt") ## reads in the features data
ft<- as.matrix(feat)
names(data) <- c("activity", "Subject ID", ft[,2])

## identify all columns with "mean" and "Std Dev" in the title decription and extract (STEP 2)
mean <- grep("mean", feat[,2]) ## these two lines pull out the mean and std Dev from the names in the feature data
stD <- grep("std", feat[,2])
extract <-c(mean, stD)
extract <- sort(extract)
extract <- extract +2  ## shift the identified columns left 2 spaces to account for subject and activty columns
extract <- c(1,2,extract)
datameanSD <- data[, extract] ## Extract mean and std Dev columns

## Create separate tidy data set with the means (STEP 5)
final <- sapply(datameanSD, mean)
final
}