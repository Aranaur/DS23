2 + 2
5 - 3 * 25

25 / 5

3 ^ 3

# залишок від ділення
5 %% 3

16 %/% 5 # цілочис. ділення

(2 + 3) * (4 / 5)

16 ^ 0.5
16 ^ (1/2)
sqrt(16)

abs(3 - 10)

exp(log(15))

log(x = 10, base = 3)
log(10, 3)
log(3, 10)

# # # # # # # # # # # # # # # # # # # # # # # 

two = 2
two

one <- 1
one + two

5 -> five
five

# # # # # # # # # # # # # # # # # # # # # # # 

one > two
one < two
one >= two
one <= two
one == two
one != two

# # # # # # # # # # # # # # # # # # # # # # # 

class(one)
typeof(one)
is.double(one)

one <- 1L
typeof(one)
is.double(one)


one_ring <- "Ash nazg durbatulûk, ash nazg gimbatul, ash nazg thrakatulûk, agh burzum-ishi krimpatul."

one_text <- '1'
typeof(one_text)


TRUE
FALSE
typeof(TRUE)

# # # # # # # # # # # # # # # # # # # # # # # 

vector_1 <- 1:5
vector_1

vector_2 <- c('one', 'two', 'five')
vector_2

vector_3 <- c(TRUE, FALSE, TRUE)
vector_3

vector_4 <- c(1:3)
vector_4

-5:5

5:-5

seq(from = 1, to = 100, length.out = 145)
seq_vec <- seq(1, 100, length.out = 45)
seq_vec

c(3, 3, 3, 3, 3)
rep(x = 3, times = 5)
rep(3, 10)

rep(1:5, 5)

rep(1:3, 1:3)

c(1, FALSE, "text")

c(1, FALSE)

five + TRUE

vector_1 - 2

(vector_1 + vector_4 * vector_1) / vector_4


vector_4 + 5:10

seq_vec[2:7] <- mean(seq_vec)
seq_vec

seq_vec[c(-1, -5, -45)]

# # # # # # # # # # # # # # # # # # # # # # # 

matrix_1 <- matrix(1:16, nrow = 4, byrow = TRUE)

matrix_1[1:2, 3:4] <- mean(matrix_1)

matrix_1[, 3]

# # # # # # # # # # # # # # # # # # # # # # # 

array(1:16, c(4, 2, 2))

# # # # # # # # # # # # # # # # # # # # # # # 

list_1 <- list(vec = 1:5,
               hello = "Hello, R!",
               matrix = matrix(1:16, nrow = 4, byrow = TRUE))

list_1[[3]]
list_1$hello
list_1$matrix[3, 4]

# # # # # # # # # # # # # # # # # # # # # # # 

df_1 <- data.frame(
  name = c('Frodo', 'Arwen', 'Legolas'),
  sex = c('male', 'female', 'male'),
  age = c(51, 2700, 2931),
  one_ring = c(TRUE, FALSE, FALSE)
)

str(df_1)

names(df_1)

df_1$name[2]

df_1[2, 3]

df_1[2, "name"]

# # # # # # # # # # # # # # # # # # # # # # # 

library(tidyverse)


dplyr::filter()







