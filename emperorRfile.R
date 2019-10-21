emperors <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-08-13/emperors.csv")
library(tidyr)
library(ggplot2)
library(tidyverse)

# Dot plot for rise and birth_prv
ggplot(emperors, aes(rise, birth_prv)) + geom_count()
