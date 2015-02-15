test2 <- function() {
OriginalData <- read.csv("activity.csv", na.strings = "NA")


daysdata2 <- group_by(OriginalData, date)
sumdata3 <- summarise(daysdata2, mean(steps, na.rm=TRUE))

colnames (sumdata3) <- c("date","MeanSteps")


NewImputedData <- OriginalData
sumdata3[,"MeanSteps"] <- round(sumdata3$MeanSteps)
NewImputedData[,"steps"] <- sumdata3$MeanSteps

NewImputedData[,"Weekday"] <-  weekdays(as.Date(NewImputedData$date))

NewImputedWeekdayData <- subset(NewImputedData,(Weekday != c("Sunday","Saturday")),"steps","date","interval")


NewImputedWeekEndData <- subset(NewImputedData,(Weekday == c("Sunday","Saturday")),"steps","date","interval")

head(NewImputedWeekEndData,10)
}