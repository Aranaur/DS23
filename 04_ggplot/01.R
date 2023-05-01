library(tidyverse)
library(palmerpenguins)

penguins

# ggplot2 -----------------------------------------

ggplot(penguins,
       mapping = aes(x = bill_length_mm,
                     y = bill_depth_mm)) +
  geom_point()

penguins %>% 
  ggplot(aes(bill_length_mm, bill_depth_mm)) +
  geom_point() +
  geom_line()

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm)) +
  geom_smooth(aes(bill_length_mm, bill_depth_mm))

penguins %>% 
  ggplot(aes(bill_length_mm, bill_depth_mm)) +
  geom_point(size = 3, shape = 5)

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, shape = species), size = 3) +
  scale_shape(solid = FALSE)

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, shape = species), size = 3) +
  scale_shape_manual(values = c('plus', 'cross', 'asterisk'))

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm),
             shape = 21,
             size = 2.5,
             stroke = 1.1,
             color = 'yellow',
             fill = 'blue')


penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = species)) + 
  scale_color_manual(values = c("#19a6b3","#f26c0d","#5e3894"))

library(RColorBrewer)

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = species)) +
  scale_color_brewer(palette = 'Set2')

library(ggthemes)

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = species)) +
  scale_color_excel_new()


penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = body_mass_g)) +
  scale_color_gradient(low = 'yellow', high = 'red')

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = body_mass_g)) +
  scale_color_gradient2(midpoint = 6000)

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = species)) + 
  theme_bw() +
  labs(x= 'Довжина клюва, мм',
       y = 'Ширина клюва, мм') +
  theme(axis.title.x = element_text(vjust = 0,
                                    size = 15,
                                    color = 'red'),
        axis.title.y = element_text(vjust = 2, 
                                    size = 15))

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = species)) + 
  theme_bw() +
  labs(x= 'Довжина клюва, мм',
       y = 'Ширина клюва, мм') + 
  scale_x_continuous(limits = c(40, 50)) +
  scale_y_continuous(limits = c(15, 20))

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = species)) + 
  theme_bw() +
  labs(x= 'Довжина клюва, мм',
       y = 'Ширина клюва, мм') + 
  expand_limits(x = 0, y = 0)

penguins %>% 
  ggplot() +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = species)) + 
  scale_color_manual(values = c("#19a6b3","#f26c0d","#5e3894")) +
  theme_bw() +
  labs(x= 'Довжина клюва, мм',
       y = 'Ширина клюва, мм',
       title = 'Характеристики типів пінгвінів',
       subtitle = 'Види пінгвінів зі станції Палмер',
       caption = 'Дані: Long Term Ecological Research Network') +
  theme(legend.position = c(0.1, 0.2),
        legend.title = element_blank())


penguins %>% 
  ggplot(aes(bill_length_mm, bill_depth_mm, color = species)) +
  geom_point() + 
  geom_label(aes(label = species)) + 
  scale_color_manual(values = c("#19a6b3","#f26c0d","#5e3894")) +
  theme_bw() +
  labs(x= 'Довжина клюва, мм',
       y = 'Ширина клюва, мм',
       title = 'Характеристики типів пінгвінів',
       subtitle = 'Види пінгвінів зі станції Палмер',
       caption = 'Дані: Long Term Ecological Research Network') +
  theme(legend.position = c(0.1, 0.2),
        legend.title = element_blank())

penguins %>% 
  ggplot(aes(bill_length_mm, bill_depth_mm, color = species)) +
  geom_point() + 
  geom_smooth(se = FALSE, method = 'lm') +
  scale_color_manual(values = c("#19a6b3","#f26c0d","#5e3894")) +
  theme_bw() +
  labs(x= 'Довжина клюва, мм',
       y = 'Ширина клюва, мм',
       title = 'Характеристики типів пінгвінів',
       subtitle = 'Види пінгвінів зі станції Палмер',
       caption = 'Дані: Long Term Ecological Research Network') +
  theme(legend.position = c(0.1, 0.2),
        legend.title = element_blank())

# bubble plot -----------------------------------------

penguins %>% 
  ggplot(aes(bill_length_mm, bill_depth_mm, color = species)) +
  geom_point(aes(size = body_mass_g), alpha = 0.4) + 
  scale_color_manual(values = c("#19a6b3","#f26c0d","#5e3894")) +
  theme_bw()


penguins %>% 
  ggplot(aes(bill_length_mm, bill_depth_mm, color = species)) +
  geom_point(aes(size = body_mass_g), alpha = 0.4) + 
  scale_color_manual(values = c("#19a6b3","#f26c0d","#5e3894")) +
  theme_bw() +
  scale_size(range = c(.2,5), guide = guide_legend()) +
  labs(x= 'Довжина клюва, мм',
       y = 'Ширина клюва, мм',
       title = 'Характеристики типів пінгвінів',
       subtitle = 'Види пінгвінів зі станції Палмер',
       caption = 'Дані: Long Term Ecological Research Network') +
  theme(legend.title = element_blank())

# bar plot -----------------------------------------

penguins %>% 
  count(species, sort = TRUE) %>% 
  ggplot() +
  geom_bar(aes(x=n, fill = species)) +
  scale_fill_manual(values = c("#19a6b3","#f26c0d","#5e3894")) +
  theme_bw()

penguins %>% 
  ggplot() +
  geom_bar(aes(x=species, fill = species)) +
  scale_fill_manual(values = c("#19a6b3","#f26c0d","#5e3894")) +
  theme_bw() +
  coord_flip()

penguins %>% 
  ggplot() +
  geom_bar(aes(x=species, fill = species)) +
  scale_fill_manual(values = c("#19a6b3","#f26c0d","#5e3894")) +
  theme_bw() +
  coord_polar('y')

penguins %>% 
  count(species) %>% 
  # mutate(prop = n / sum(n)) %>% 
  ggplot(aes(x = n, y = fct_reorder(species, n))) +
  geom_col()

penguins %>% 
  ggplot() +
  geom_bar(aes(x=island, fill=species),
           position = 'fill')

penguins %>% 
  filter(sex == 'female') %>% 
  count(species) %>% 
  ggplot() +
  geom_bar(aes(x='', y = n, fill = species), stat = 'identity') +
  coord_polar('y') +
  theme_void()

# lolipop plot -----------------------------------------

ggplot(penguins %>% 
         count(species) %>% 
         arrange(n) %>% 
         mutate(species = factor(species, levels = species))) +
  geom_segment(aes(x = species, xend = species,
                   y = 0, yend = n), linewidth = 1) +
  geom_point(aes(x = species, y = n, color = species), size = 4) +
  coord_flip()

# hist plot -----------------------------------------

penguins %>% 
  ggplot() +
  geom_histogram(aes(x=bill_length_mm, fill = species), alpha = 0.5)

penguins %>% 
  ggplot() + 
  geom_density(aes(x=bill_length_mm, fill = species), alpha = 0.5)

penguins %>% 
  drop_na() %>% 
  filter(species == 'Adelie') %>% 
  ggplot() +
  geom_density(aes(x=bill_length_mm, fill = sex), alpha = 0.5)


library(ggridges) # joyplot | ridgeline

penguins %>% 
  ggplot() +
  geom_density_ridges(aes(x=bill_length_mm, y = species, fill = species), alpha = 0.5, color = NA) +
  theme_minimal()

penguins %>% 
  drop_na() %>% 
  ggplot() +
  geom_density_ridges(aes(x = body_mass_g, y = species, fill = sex),
                      alpha = 0.5, color = NA, scale = 1)

# penguins %>% 
#   drop_na() %>% 
#   ggplot() +
#   stat_density_ridges(aes(x = body_mass_g, y = species, fill = species),
#                       alpha = 0.5, color = NA, scale = 1, quantile_lines = TRUE)
  
# boxplot plot -----------------------------------------

penguins %>% 
  ggplot() +
  geom_boxplot(aes(y = bill_length_mm, fill = species))

penguins %>% 
  ggplot(aes(y = bill_length_mm, x = species)) +
  geom_violin(aes(fill = species), alpha = 0.5, color = NA) +
  geom_jitter(aes(color = species), width = 0.2, alpha = 0.5) + 
  geom_boxplot(color = '#e5e3e3', fill = NA, size = 1, width = 0.5) +
  theme_bw()
















