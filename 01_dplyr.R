library(tidyverse)

iris
typeof(iris)
class(iris)
str(iris)

iris

iris_tbl <- as_tibble(iris)
iris_tbl
class(iris_tbl)

##############################


cars <- read_delim('00_data/cars2018.csv', delim=';')
cars

cars_url <- read_delim('https://raw.githubusercontent.com/Aranaur/datasets/main/datasets/cars2018.csv', delim=';')
cars_url

files <- dir(path = '00_data', pattern = '\\.csv$')
filepath <- paste0('00_data/', files)

cars_all <- read_delim(file = filepath, delim = ';')
cars_all

library(readxl)
excel_sheets('00_data/cars2018.xlsx')
cars_xlsx <- read_excel('00_data/cars2018.xlsx', sheet = "cars2018")
cars_xlsx

##############################