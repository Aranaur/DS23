library(tidyverse)
library(magrittr)

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

# dplyr

glimpse(cars)

sort(log(sqrt(abs(sin(1:10)))))

1:2 %>% sin()  # CTRL + SHIFT + M

1:10 %>% 
  sin() %>% 
  abs() %>% 
  sqrt() %>% 
  log() %>% 
  sort()

cars %>% 
  glimpse()

# filter()

cars_manual_10 <- cars %>% 
  dplyr::filter(transmission == 'Manual',
                cylinders == 10)
  
cars %>% 
  filter(transmission == 'Manual' | transmission == 'CVT',
         cylinders >= mean(cylinders))

cars %>% 
  filter(transmission %in% c('Manual', 'CVT'),
         cylinders >= mean(cylinders))
  
# slice()

cars %>% 
  slice(seq(1, nrow(cars), 2))
  
cars %>% 
  slice(-(1:50)) 

cars %>% 
  slice_head(n = 20)

cars %>% 
  head(n = 20)

cars %>% 
  slice_tail(n = 20)

cars %>% 
  slice_max(mpg, n = 3)

cars %>% 
  slice_min(mpg, n = 5)

set.seed(2023)
cars %>% 
  slice_sample(n = 10, replace = FALSE) %>% 
  arrange(desc(mpg))


cars %>% 
  filter(str_detect(model, "a$"))

# select()

cars %>% 
  select(model, mpg:recommended_fuel)

cars %>% 
  select(seq(1, ncol(cars), 2))

cars %>% 
  select(!c(model, mpg))

cars %>% 
  select(starts_with('m'))

cars %>% 
  select(ends_with('s'))

cars %>% 
  select(contains('x'))

cars %>% 
  select(matches('[oe]r'))

cars %>% 
  select(where(is.numeric), model)

cars %>% 
  select(model, where(is.numeric), everything())

# relocate()

cars %>% 
  relocate(where(is.numeric), .before = where(is.character))






























