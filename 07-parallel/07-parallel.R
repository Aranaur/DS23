if (!require('pacman')) install.packages('pacman')

pacman::p_load(tictoc, parallel, future, future.apply, tidyverse,
               furrr, pbapply)

# future::plan()
plan(multisession)

slow_squere <- function(x = 1){
  x_sq = x ** 2
  d = tibble(value = x, value_squared = x_sq)
  Sys.sleep(2)
  return(d)
}

tic()
serial_ex = lapply(1:12, slow_squere) %>% bind_rows()
toc()

detectCores()

tic()
future_ex = future_lapply(1:12, slow_squere) %>% bind_rows()
toc()

all_equal(serial_ex, future_ex)

tic()
furrr_ex = future_map_dfr(1:12, slow_squere)
toc()

# ------------------------------------------------------------------------------

set.seed(1234)
n = 1e6

our_data <- tibble(
  x = rnorm(n), 
  e = rnorm(n)
) %>% 
  mutate(
    y = 3 + 2*x + e
  )

bootstrp <- 
  function(i) {
    sample_data = slice_sample(our_data, n = 1e4, replace = TRUE)
    x_coef = lm(y ~ x, data = sample_data)$coef[2]
    return(tibble(x_coef = x_coef))
  }

# -----------

set.seed(1234)

tic()
sim_serial <- lapply(1:1e4, bootstrp) %>% bind_rows()
toc() # 51.15 sec elapsed

tic()
sim_future <- future_lapply(1:1e4, bootstrp, future.seed = 1234) %>% bind_rows()
toc() # 13.75 sec elapsed

tic()
sim_furrr <- future_map_dfr(1:1e4, bootstrp,
                            .options = furrr_options(seed = 1234)) %>% bind_rows()
toc() # 12.54 sec elapsed

sim_furrr %>% 
  ggplot(aes(x_coef)) +
  geom_density(col = NA, fill = 'gray25', alpha = 0.3) +
  geom_vline(xintercept = 2, col = 'red') +
  labs(
    title = 'Bootstraping sxample',
    x = 'Coef. values',
    y = 'Density',
    caption = 'Note: Density based on 10,000 draws with sample size of 10,000 each'
  )

sim_furrr %>% 
  summarise(mean_value = mean(x_coef))

# ------------------------------------------------------------------------------

tic()
sim_furrr <- pblapply(1:1e4, bootstrp, cl = parallel::detectCores())%>% bind_rows()
toc() # 51.7 sec elapsed




























