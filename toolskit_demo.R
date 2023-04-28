now <- Sys.time()

later <- now + 10000

later

time_difference <- difftime(later, now)

time_difference

time_difference <- difftime(later, now, units = "mins")

time_difference

class(time_difference)

str(time_difference)

time_difference <- as.numeric(difftime(later, now, units = "mins"))

str(time_difference)

class(time_difference)

class(time_difference)

numbers <- 1:10

numbers

library("dplyr")

lead(numbers)

lead(numbers) - numbers

lead(numbers, n = 2)

lag(numbers)

wildschwein <- tibble(
  TierID = c(rep("Hans", 5), rep("Klara", 5)),
  DatetimeUTC = rep(as.POSIXct("2015-01-01 00:00:00", tz = "UTC") + 0:4 * 15 * 60, 2)
)

wildschwein

lead(wildschwein$DatetimeUTC) - wildschwein$DatetimeUTC

wildschwein$timelag <- as.numeric(difftime(lead(wildschwein$DatetimeUTC), wildschwein$DatetimeUTC))

wildschwein

wildschwein <- group_by(wildschwein, TierID)

wildschwein <- mutate(wildschwein, timelag = as.numeric(difftime(lead(DatetimeUTC), DatetimeUTC)))

wildschwein

wildschwein |> # Take wildschwein...
  group_by(TierID) |> # ...group it by TierID
  summarise( # Summarise the data...
    mean_timelag = mean(timelag, na.rm = T) # ...by calculating the mean timelag
  )



