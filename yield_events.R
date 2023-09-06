library(tidyverse)
library(dplyr)
library(stan4bart)
library(bartCause)

setwd("~/yield_events")
dat_raw <- read_csv('raw_yield_events.csv')
df <- dat_raw %>% drop_na()

df %>% group_by(priority_group)     %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(top_choice)         %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(in_es)              %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(ell_status)         %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(homeless)           %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(gender_female)      %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(eva_event)          %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(virtual_event)      %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(open_house_tour)    %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(new_family_day)     %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% group_by(in_person_event)    %>% summarise(yield = sum(yielded), total = n(), percentage = mean(yielded))
df %>% filter(eva_event==0 & virtual_event==0 & in_person_event==0 & new_family_day==0 & open_house_tour==0) %>% summarise(total = n())
df %>% filter(eva_event==1 & virtual_event==1 & in_person_event==1 & new_family_day==1 & open_house_tour==1) %>% summarise(total = n())

fit <- bartc(response = yielded,
             treatment = new_family_day,
             confounders = (priority_group + top_choice + in_es),
             data = df,
             estimand = "att",
             group.by = school_applied,
             group.effects = TRUE,
             use.ranef = TRUE,
             seed = 0,
             verbose = TRUE)
summary(fit)
