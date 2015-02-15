test1 <- function() {
idata <- read.csv("activity.csv", na.strings = "NA")
head(idata, 10)

intervaldata <- group_by(idata, interval)
sumdata1 <- summarise(intervaldata, mean(steps, na.rm=TRUE))
colnames (sumdata1) <- c("Interval","Average")

plot(sumdata1$Interval,sumdata1$Average, type = "l", xlab = "Time Intervals", ylab = "Average Steps", main = "Average Steps per Interval")

MaxStepsInterval <- sumdata1$Interval[which.max(sumdata1$Average)]
MaxIntervalOutData <- paste("Maximum Average Steps Occurs at Time Interval ", MaxStepsInterval)
MaxIntervalOutData
}