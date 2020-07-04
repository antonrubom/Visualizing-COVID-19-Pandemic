
## 1. From epidemic to pandemic

# Load the readr, ggplot2, and dplyr packages
library(readr)
library(ggplot2)
library(dplyr)

# Read datasets/confirmed_cases_worldwide.csv into confirmed_cases_worldwide
confirmed_cases_worldwide <- read_csv("datasets/confirmed_cases_worldwide.csv")
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
