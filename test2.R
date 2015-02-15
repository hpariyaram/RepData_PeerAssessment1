test2 <- function() {
OriginalData <- read.csv("activity.csv", na.strings = "NA")


daysdata2 <- group_by(OriginalData, date)
sumdata3 <- summarise(daysdata2, mean(steps, na.rm=TRUE))

colnames (sumdata3) <- c("date","MeanSteps")


NewImputedData <- OriginalData
sumdata3[,"MeanSteps"] <- round(sumdata3$MeanSteps)
NewImputedData[,"steps"] <- sumdata3$MeanSteps

NewImputedData[,"Weekday"] <-  weekdays(as.Date(NewImputedData$date))

NewImputedWDData <- subset(NewImputedData,(Weekday != c("Sunday","Saturday")),"steps","date","interval")
##NewImputedWeekdayData <- NewImputedData

NewImputedWEData <- subset(NewImputedData,(Weekday == c("Sunday","Saturday")),"steps","date","interval")
##NewImputedWeekEndData <- NewImputedData
##head(NewImputedWeekEndData,10)
plot(NewImputedWDData$steps,NewImputedWDData$interval, type = "l", xlab = "Interval", ylab = "Number of Steps", main = "Steps per Interval")


}