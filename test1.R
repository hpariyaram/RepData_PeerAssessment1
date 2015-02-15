test1 <- function() {
OriginalData <- read.csv("activity.csv", na.strings = "NA")
head(OriginalData, 10)

NumberOfNA <- nrow(OriginalData[is.na(OriginalData$steps),])
NumberOfNAMessage <- paste(" The Number of rows with NAs are = ",NumberOfNA)
NumberOfNAMessage


daysdata2 <- group_by(OriginalData, date)
sumdata3 <- summarise(daysdata2, mean(steps, na.rm=TRUE))
##sumdata3[,"MeanSteps"] <- suppressWarnings(as.numeric(sumdata3[, "MeanSteps"]))

colnames (sumdata3) <- c("date","MeanSteps")
sumdata3

##NAindexes <- is.na(OriginalData[,"steps"])
##NewImputedData <- OriginalData
##sumdata3[NewImputedData$date]$MeanSteps

##NewImputedData <- cbind("MeanSteps")

##NewImputedData[,"steps"] <- OriginalData["date"][,steps:=ifelse(is.na(steps),as.integer(sumdata3[date][MeanSteps]), steps)]

##head(NewImputedData,10)

}