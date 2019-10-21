emperors <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-08-13/emperors.csv")
library(tidyr)
library(ggplot2)
library(tidyverse)

# Dot plot for rise and birth_prv
ggplot(emperors, aes(rise, birth_prv)) + geom_count()

# bar chart for rise
ggplot(emperors, aes(rise)) + geom_bar()

# killer label for cause and reign_end
ggplot(emperors, aes(cause, reign_end, "year", colour = killer)) + geom_point() + theme(legend.position = "bottom")

# killer label for cause and reign_end with color
ggplot(emperors, aes(cause, reign_end, "year", color= killer, label=emperors$killer)) + geom_point() + geom_text(aes(label = emperors$killer), hjust=0, vjust=0) + theme(legend.position = "bottom")