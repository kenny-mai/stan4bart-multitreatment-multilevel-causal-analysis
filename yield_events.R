# Load libraries
library(tidyverse)
library(dplyr)
library(stan4bart)
library(ggplot2)

# Load data and recode events
dat_raw <- read_csv('raw_yield_events.csv')
df <- dat_raw %>% 
  drop_na() %>% 
  mutate(events_attended = case_when(eva_event == 1 & new_family_day == 0 & open_house_tour == 0 & virtual_event == 0 & in_person_event == 0 ~ 'Event with Eva', 
                                     eva_event == 0 & new_family_day == 1 & open_house_tour == 0 & virtual_event == 0 & in_person_event == 0 ~ 'New Family Day',
                                     eva_event == 0 & new_family_day == 0 & open_house_tour == 1 & virtual_event == 0 & in_person_event == 0 ~ 'Open House or Tour',
                                     eva_event == 0 & new_family_day == 0 & open_house_tour == 0 & virtual_event == 1 & in_person_event == 0 ~ 'Virtual Event',
                                     eva_event == 0 & new_family_day == 0 & open_house_tour == 0 & virtual_event == 0 & in_person_event == 1 ~ 'In-Person Event',
                                     eva_event == 0 & new_family_day == 0 & open_house_tour == 0 & virtual_event == 0 & in_person_event == 0 ~ 'None',
                                     TRUE ~ 'More Than One Event Type'))

# Build test dataframe
test_df <- do.call("rbind", replicate(length(unique(df$events_attended)), df, simplify = FALSE))
test_z <- sort(rep(c('Event with Eva','New Family Day','Open House or Tour','Virtual Event','In-Person Event','None','More Than One Event Type'), nrow(df)))
test_df$events_attended <- test_z

# Fit BART model
fit <- stan4bart(yielded ~ events_attended + 
                   bart(events_attended + priority_group + top_choice + in_es + ell_status + homeless) + 
                   (1|school_applied), 
                 data = df,
                 test = test_df, 
                 cores = 8, 
                 chains = 8, 
                 iter = 2000)

# Sample predictions from distributions
test_predictions  <- extract(fit, sample = "test")

# Treatments vs None
samples_a <- test_predictions[test_df$events_attended == 'Event with Eva', ] - test_predictions[test_df$events_attended == 'None', ]
samples_b <- test_predictions[test_df$events_attended == 'New Family Day', ] - test_predictions[test_df$events_attended == 'None', ]
samples_c <- test_predictions[test_df$events_attended == 'Open House or Tour', ] - test_predictions[test_df$events_attended == 'None', ]
samples_d <- test_predictions[test_df$events_attended == 'Virtual Event', ] - test_predictions[test_df$events_attended == 'None', ]
samples_e <- test_predictions[test_df$events_attended == 'In-Person Event', ] - test_predictions[test_df$events_attended == 'None', ]
samples_f <- test_predictions[test_df$events_attended == 'More Than One Event Type', ] - test_predictions[test_df$events_attended == 'None', ]
ate_a <- apply(samples_a, 2, mean)
ate_b <- apply(samples_b, 2, mean)
ate_c <- apply(samples_c, 2, mean)
ate_d <- apply(samples_d, 2, mean)
ate_e <- apply(samples_e, 2, mean)
ate_f <- apply(samples_f, 2, mean)
results <- data.frame(event_type = c('Event with Eva','New Family Day','Open House or Tour','Virtual Event','In-Person Event','More Than One Event Type'),
                      average_treatment_effect = c(mean(ate_a),mean(ate_b),mean(ate_c),mean(ate_d),mean(ate_e),mean(ate_f)),
                      lower_bound = c(quantile(ate_a, 0.025),quantile(ate_b, 0.025),quantile(ate_c, 0.025),quantile(ate_d, 0.025),quantile(ate_e, 0.025),quantile(ate_f, 0.025)),
                      upper_bound = c(quantile(ate_a, 0.975),quantile(ate_b, 0.975),quantile(ate_c, 0.975),quantile(ate_d, 0.975),quantile(ate_e, 0.975),quantile(ate_f, 0.975)))

# Distribution of ate's
events <- c(rep('Event with Eva',400),rep('New Family Day',400),rep('Open House or Tour',400),rep('Virtual Event',400),rep('In-Person Event',400),rep('More Than One Event Type',400))
draws <- c(ate_a,ate_b,ate_c,ate_d,ate_e,ate_f)
hist_df <- data.frame(events,draws)

# Histograms of all the treatment effects
ggplot(hist_df,aes(x=draws, fill = events)) + 
  geom_histogram(bins=30) + 
  labs(title = 'Causal Effects of Yield Event Types', x = 'Increase in probability of yielding versus no events attended', y = 'Number of simulated results', fill = 'Event Types') + 
  scale_fill_brewer(palette="Set2") +
  facet_wrap(.~events) +
  theme_light()

# Spot check treatment effects between different treatments
mean(test_predictions[test_df$events_attended == 'Event with Eva', ] - test_predictions[test_df$events_attended == 'Virtual Event', ])

# Distribution for a single person 
hist(samples_a[1,])

# Predictions for each person
apply(samples_a, 1, mean)
