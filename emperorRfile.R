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

#calculate age (doesn't work because of BC AD years)
ages <- age_calc(emperors$birth, enddate=emperors$death, units = "years", precise = TRUE) # dont think it works
emperors$birthage <- format(as.Date(emperors$birth, format="%d/%m/%Y"),"%Y")
emperors$deathage <- format(as.Date(emperors$death, format="%d/%m/%Y"),"%Y")
emperors$birthage <- as.numeric(emperors$birthage)
emperors$deathage <- as.numeric(emperors$deathage)
emperors$age <- ifelse(emperors$birthage > emperors$deathage,  emperors$birthage + emperors$deathage,  emperors$deathage - emperors$birthage)


# bar graph for ages and name
emperors %>% filter(emperors$age < 99) %>% ggplot(emperors, mapping = aes(y = age, x = name)) + geom_bar(stat = "identity")

# bar graph with age and name and colored with province and ordered
emperors %>% filter(emperors$age < 99) %>% ggplot(emperors, mapping = aes(y = age, x = reorder(name, -age), color= birth_prv)) + geom_bar(stat = "identity")

# bar graph with birth_prv only
ggplot(emperors, aes(birth_prv)) + geom_bar()

