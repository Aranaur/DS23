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



