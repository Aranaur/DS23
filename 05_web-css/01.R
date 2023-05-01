library(rvest)
library(tidyverse)
library(janitor)
library(lubridate)

m100 <- read_html('http://en.wikipedia.org/wiki/Men%27s_100_metres_world_record_progression')
m100

IAAF <- m100 %>% 
  html_element('div+ .wikitable :nth-child(1)') %>% 
  html_table() %>% 
  clean_names() %>% 
  mutate(date = mdy(date))

IAAF

# ---------------------------------------------------

#mw-content-text > div.mw-parser-output > table:nth-child(11)

IAAF_76 <- m100 %>% 
  html_element('#mw-content-text > div.mw-parser-output > table:nth-child(17)') %>% 
  html_table() %>% 
  clean_names() %>% 
  select(-ref) %>% 
  mutate(date = mdy(date),
         wind = as.numeric(wind))

IAAF_76


#mw-content-text > div.mw-parser-output > table:nth-child(22)

IAAF_modern <- m100 %>% 
  html_element('#mw-content-text > div.mw-parser-output > table:nth-child(22)') %>% 
  html_table() %>% 
  clean_names() %>% 
  mutate(date = mdy(date),
         wind = as.numeric(wind))

IAAF_modern

# ---------------------------------------------------

wr_100 <- rbind(
  IAAF %>% select(time, athlete, nationality, date) %>% 
    mutate(era = 'Pre_IAAF'),
  IAAF_76 %>% select(time, athlete, nationality, date) %>% 
    mutate(era = 'Pre_automatic'),
  IAAF_modern %>% select(time, athlete, nationality, date) %>% 
    mutate(era = 'Modern')
)

wr_100

# ---------------------------------------------------

wr_100 %>% 
  ggplot(aes(date, time)) +
  geom_point(aes(col = fct_reorder2(era, date, time))) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Men's 100m World Record",
    x = 'Date',
    y = 'Time',
    caption = 'Source: Wikipedia'
  ) +
  theme_bw() +
  theme(legend.title = element_blank())

wr_100 %>% 
  ggplot(aes(era, time)) +
  geom_boxplot()

wr_100 %>% 
  ggplot(aes(time, fill = era)) +
  geom_density(alpha = 0.5)

# ---------------------------------------------------

base_url = "https://rozetka.com.ua/kompyuternie-kolonki/c4671536/"

craiglist = read_html(base_url)

speakers = 
  craiglist %>% 
  html_elements(".goods-tile__title , .goods-tile__price-value")


speakers = html_text(speakers)  ## parse as text
head(speakers, 20)              ## show the first 20 entries

as_tibble(t(matrix(speakers, nrow=2)))

dates = as.Date(speakers, format = '%b %d')  ## Try to coerce to date of form "Jan 01"
idates = which(!is.na(dates)) 









