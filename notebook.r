
## 1. From epidemic to pandemic visualizing COVID19 

# Load the readr, ggplot2, and dplyr packages
library(readr)
library(ggplot2)
library(dplyr)

# Read datasets/confirmed_cases_worldwide.csv into confirmed_cases_worldwide
confirmed_cases_worldwide <- read_csv("confirmed_cases_worldwide.csv")
cols(
  date = col_date(format = ""),
  cum_cases = col_double()
)
# change the format of the rows

confirmed_cases_worldwide <- as.Date("01-22-2020")

# add names "date" and "number" to dataset
 names(confirmed_cases_worldwide) <- c("Date","No. cases")

# See the result
confirmed_cases_worldwide

# Viewing the corona virus cases using a line graph
# Draw a line plot of cumulative cases vs. date
# Label the y-axis
ggplot(confirmed_cases_worldwide, aes(x=date,y=cum_cases)) +
  geom_line() +
  ylab("Cumulative confirmed cases")

  # Read in datasets/confirmed_cases_china_vs_world.csv
confirmed_cases_china_vs_world <- read_csv("datasets/confirmed_cases_china_vs_world.csv")

# See the result
glimpse(confirmed_cases_china_vs_world)

# Draw a line plot of cumulative cases vs. date, grouped and colored by is_china
# Define aesthetics within the line geom
plt_cum_confirmed_cases_china_vs_world <- ggplot(confirmed_cases_china_vs_world) +
  geom_line(aes(x=date,y=cum_cases, color=is_china, group=is_china)) +
  ylab("Cumulative confirmed cases")

# See the plot
plt_cum_confirmed_cases_china_vs_worldwho_events <-
 tribble( ~ date, ~ event,
  2020-01-30, Global healthnemergency declared, 
  2020-03-11, Pandemicndeclared, 
  2020-02-13, China reportingnchange ) %>% mutate(date = as.Date(date)) 

# Using who_events, add vertical dashed lines with an xintercept at date 
# and text at date, labeled by event, and at 100000 on the y-axis
plt_cum_confirmed_cases_china_vs_world + geom_vline(aes(xintercept=date), who_events, lty=dashed) + geom_text(aes(x=date,label=event),who_events,y=100000)

## 5.
# Filter for China, from Feb 15
china_after_feb15 <- confirmed_cases_china_vs_world %>%
  filter(is_china=="China", date>="2020-02-15") 

# Using china_after_feb15, draw a line plot cum_cases vs. date
# Add a smooth trend line using linear regression, no error bars
ggplot(china_after_feb15, aes(x=date,y=cum_cases)) +
geom_line()+
geom_smooth(method="lm", se=FALSE) +
ylab("Cumulative confirmed cases")
