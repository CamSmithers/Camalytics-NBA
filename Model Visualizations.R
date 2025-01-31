# Packages
library(ggplot2)
library(tidyverse)
library(patchwork)
library(readxl)
library(ggimage)

#------------------------------------------------------------------------#

# Data and Global Vars
team_visual_data <- readRDS(
    "/Users/camsmithers/Desktop/NBA Project/Main/Data/cleaned_nba_data.rds")

camalytics_predictions <- read_excel(
    "/Users/camsmithers/Desktop/NBA Project/Main/Data/CamalyticsPicks.xlsx")

team_logos <- read_excel(
    "/Users/camsmithers/Desktop/NBA Project/Main/Data/LogoData.xlsx")

current_date <- format(Sys.Date(), "%m_%d_%y")

#------------------------------------------------------------------------#

# Post Modeling Cleaning
team_visual_data <- team_visual_data %>%
    mutate(outcome_2_estimates_categories = case_when(
        # Category 5
        winloss_predicted_values >= 65 & upset_predicted_values < 25 ~ 5,
        # Category 4
        (winloss_predicted_values > opponent_winloss_predicted_values 
         & winloss_predicted_values < 65 & upset_predicted_values < 25)
        | (winloss_predicted_values >= 65 & upset_predicted_values >= 25 
           & upset_predicted_values < 50) ~ 4,
        # Category 3
        winloss_predicted_values > opponent_winloss_predicted_values & 
            upset_predicted_values >= 25 & upset_predicted_values < 50 ~ 3,
        # Category 2
        winloss_predicted_values >= 65 & upset_predicted_values >= 50 ~ 2,
        # Category 1
        winloss_predicted_values > opponent_winloss_predicted_values & 
            winloss_predicted_values < 65 & upset_predicted_values >= 50 ~ 1,
        # Category 0
        TRUE ~ 0)) %>%
    mutate(outcome_2_estimates_factor = factor(outcome_2_estimates_categories,
                                               levels = c(0, 1, 2, 3, 4, 5),
                                               labels = c("NF", "VU", "UL",
                                                          "CF", "L", "VL"))) %>%
    mutate(
        outcome_1_factor = factor(team_game_outcome_1,
                                  levels = c(0, 1),
                                  labels = c("Win by ≥ 10",
                                             "Win by ≤ 11")),
        outcome_1_estimates_categories = 
               ifelse(outcome_margin_predicted_values >= 50, 1, 0),
        outcome_1_estimates_factor = factor(outcome_1_estimates_categories,
                                            levels = c(0, 1),
                                            labels = c("Est. Win by ≥ 10",
                                                       "Est. Win by ≤ 11"))) %>%
    mutate(team_name = case_when(
        #Atlantic Division
        team_team == "bos" ~ "Boston Celtics",
        team_team == "bkn" ~ "Brooklyn Nets",
        team_team == "nyk" ~ "New York Knicks",
        team_team == "phi" ~ "Philadelphia 76ers",
        team_team == "tor" ~ "Toronto Raptors",
        #Central Division
        team_team == "chi" ~ "Chicago Bulls",
        team_team == "cle" ~ "Cleveland Cavaliers",
        team_team == "det" ~ "Detroit Pistons",
        team_team == "ind" ~ "Indiana Pacers",
        team_team == "mil" ~ "Milwaukee Bucks",
        #Southeast Division
        team_team == "atl" ~ "Atlanta Hawks",
        team_team == "cha" ~ "Charlotte Hornets",
        team_team == "mia" ~ "Miami Heat",
        team_team == "orl" ~ "Orlando Magic",
        team_team == "was" ~ "Washington Wizards",
        #Northwest Division
        team_team == "den" ~ "Denver Nuggets",
        team_team == "min" ~ "Minnesota Timberwolves",
        team_team == "okc" ~ "Oklahoma City Thunder",
        team_team == "por" ~ "Portland Trail Blazers",
        team_team == "uta" ~ "Utah Jazz",
        #Pacific Division
        team_team == "gsw" ~ "Golden State Warriors",
        team_team == "lac" ~ "Los Angeles Clippers",
        team_team == "lal" ~ "Los Angeles Lakers",
        team_team == "phx" ~ "Phoenix Suns",
        team_team == "sac" ~ "Sacramento Kings",
        #Southwest Division
        team_team == "dal" ~ "Dallas Mavericks",
        team_team == "hou" ~ "Houston Rockets",
        team_team == "mem" ~ "Memphis Grizzlies",
        team_team == "nop" ~ "New Orleans Pelicans",
        team_team == "sas" ~ "San Antonio Spurs")) %>%
    mutate(opponent_name = case_when(
        #Atlantic Division
        team_opponent == "bos" ~ "Boston Celtics",
        team_opponent == "bkn" ~ "Brooklyn Nets",
        team_opponent == "nyk" ~ "New York Knicks",
        team_opponent == "phi" ~ "Philadelphia 76ers",
        team_opponent == "tor" ~ "Toronto Raptors",
        #Central Division
        team_opponent == "chi" ~ "Chicago Bulls",
        team_opponent == "cle" ~ "Cleveland Cavaliers",
        team_opponent == "det" ~ "Detroit Pistons",
        team_opponent == "ind" ~ "Indiana Pacers",
        team_opponent == "mil" ~ "Milwaukee Bucks",
        #Southeast Division
        team_opponent == "atl" ~ "Atlanta Hawks",
        team_opponent == "cha" ~ "Charlotte Hornets",
        team_opponent == "mia" ~ "Miami Heat",
        team_opponent == "orl" ~ "Orlando Magic",
        team_opponent == "was" ~ "Washington Wizards",
        #Northwest Division
        team_opponent == "den" ~ "Denver Nuggets",
        team_opponent == "min" ~ "Minnesota Timberwolves",
        team_opponent == "okc" ~ "Oklahoma City Thunder",
        team_opponent == "por" ~ "Portland Trail Blazers",
        team_opponent == "uta" ~ "Utah Jazz",
        #Pacific Division
        team_opponent == "gsw" ~ "Golden State Warriors",
        team_opponent == "lac" ~ "Los Angeles Clippers",
        team_opponent == "lal" ~ "Los Angeles Lakers",
        team_opponent == "phx" ~ "Phoenix Suns",
        team_opponent == "sac" ~ "Sacramento Kings",
        #Southwest Division
        team_opponent == "dal" ~ "Dallas Mavericks",
        team_opponent == "hou" ~ "Houston Rockets",
        team_opponent == "mem" ~ "Memphis Grizzlies",
        team_opponent == "nop" ~ "New Orleans Pelicans",
        team_opponent == "sas" ~ "San Antonio Spurs"))

dummy_data <- team_visual_data %>%
    select(team_date, team_team, upset_predicted_values) %>%
    rename("dummy_team"="team_team",
           "opponent_upset_predicted_values"="upset_predicted_values")

team_visual_data <- team_visual_data %>%
    left_join(dummy_data, by = c("team_opponent"="dummy_team", "team_date")) %>%
    left_join(team_logos, by = c("team_team"="team")) %>%
    mutate(
        nba_picks = case_when(
            upset_predicted_values < (5/13) * winloss_predicted_values ~ 3,
            upset_predicted_values < (1/2) * winloss_predicted_values ~ 2,
            upset_predicted_values < (2/3) * winloss_predicted_values ~ 1,
            TRUE ~ 0),
        nba_picks_factor = factor(nba_picks,
                                  levels = c(0, 1, 2, 3),
                                  labels = c("Worst", "Okay", "Great", "Best")),
        team_display = toupper(team_team)) %>%
    mutate(
        my_model_correct = ifelse(winloss_model_guess == team_game_outcome_2, 1, 0),
        diff_from_fanduel = ifelse(winloss_model_guess != team_favored, 1, 0),
        my_predicted_upset = ifelse(upset_predicted_values > 50, 1, 0),
        fanduel_correct = ifelse(team_favored == team_game_outcome_2, 1, 0)) %>%
    mutate(my_adjusted_model = case_when(
        (winloss_predicted_values > opponent_winloss_predicted_values
         & upset_predicted_values < 50) | 
            (winloss_predicted_values < opponent_winloss_predicted_values 
             & opponent_upset_predicted_values >= 50) ~ 1,
        TRUE ~ 0)) %>%
    mutate(my_adjusted_model_correct = 
               ifelse(my_adjusted_model == team_game_outcome_2, 1, 0)) %>%
    mutate(
        margin_correct = ifelse(outcome_1_estimates_categories == 
                                       team_game_outcome_1, 1, 0),
        margin_correct_factor = factor(margin_correct,
                                          levels = c(0, 1), 
                                          labels = c("Incorrect",
                                                     "Correct")))

#------------------------------------------------------------------------#
saveRDS(team_visual_data,
        "/Users/camsmithers/Desktop/NBA Project/Main/Data/visual_data.rds")
#------------------------------------------------------------------------#

# Daily Visual Data
## Data Cleaning
daily.team_visual_data <- team_visual_data %>%
    filter(team_cumsum_game >= 5) %>%
    filter(!is.na(upset_predicted_values)) %>%
    filter(team_date == Sys.Date())

## Visualizations
daily.outcome_plot_1 <- ggplot(daily.team_visual_data,
                               aes(x = winloss_predicted_values,
                                   y = upset_predicted_values)) + 
    geom_vline(xintercept = 65, color = "black", linetype = "dashed") +
    geom_hline(yintercept = 50, color = "black", linetype = "dashed") + 
    geom_hline(yintercept = 25, color = "black", linetype = "dashed") + 
    geom_abline(slope = 5/13, color = "springgreen3", linetype = "solid") +
    geom_abline(slope = 1/2, color = "gold3", linetype = "solid") +
    geom_abline(slope = 2/3, color = "red3", linetype = "solid") +
    geom_image(aes(image = image_path), size = 0.05) +
    annotate("text", x = 70, y = 90, label = "Win to Upset Ratio ≥ 2.6", 
             color = "springgreen3", hjust = 0) +  # For the springgreen3 line
    annotate("text", x = 70, y = 85, label = "Win to Upset Ratio ≥ 2", 
             color = "gold3", hjust = 0) +  # For the gold3 line
    annotate("text", x = 70, y = 80, label = "Win to Upset Ratio ≥ 1.5", 
             color = "red3", hjust = 0) + 
    theme_bw() +
    labs(
        title = "Win & Upset Probability", 
        x = "Win Probability", 
        y = "Upset Probability")
daily.outcome_plot_1

## Saving Plot
ggsave(filename = paste0("daily_win_vs_upset_scatter_", current_date, ".png"), 
       plot = daily.outcome_plot_1,
       path = "/Users/camsmithers/Desktop/NBA Project/Main/Visualizations", 
       width = 35, height = 20, units = "cm")

#------------------------------------------------------------------------#

# Daily Historic Cleaning
## Data Cleaning
all.team_visual_data <- team_visual_data %>%
    filter(
        !is.na(team_fgm),
        team_cumsum_game >= 5,
        !is.na(upset_predicted_values),
        team_date != Sys.Date(),
        team_team %in% daily.team_visual_data$team_team)

## Visualizations
all.outcome_plot_1 <- ggplot(all.team_visual_data,
                             aes(x = nba_picks_factor,
                                 fill = as.factor(team_game_outcome_2))) + 
    geom_bar(position = "dodge", color = "black") + 
    geom_text(stat = "count", 
              aes(label = after_stat(count)), 
              position = position_dodge(width = 0.9), 
              vjust = -0.5) + 
    facet_wrap(~team_name) +
    labs(
        title = "Win History in Pick Class",
        x = "Pick Class",
        y = "Count",
        fill = "Outcome") + 
    theme_bw() + 
    scale_fill_manual(values = c("0"="red3", "1"="cornflowerblue"),
                      labels = c("0"="Loss", "1"="Win")) + 
    scale_y_continuous(limits = c(0, 35))
all.outcome_plot_1

all.outcome_plot_2 <-  ggplot(all.team_visual_data, 
                              aes(x = winloss_predicted_values,
                                  y = upset_predicted_values,
                                  color = as.factor(team_game_outcome_2))) + 
    geom_vline(xintercept = 65, color = "black", linetype = "dashed") +
    geom_hline(yintercept = 50, color = "black", linetype = "dashed") + 
    geom_hline(yintercept = 25, color = "black", linetype = "dashed") + 
    geom_abline(slope = 5/13, color = "springgreen3", linetype = "solid") +
    geom_abline(slope = 1/2, color = "gold3", linetype = "solid") +
    geom_abline(slope = 2/3, color = "red3", linetype = "solid") +
    geom_point() +
    theme_bw() +
    labs(
        title = "Win & Upset Probability History",
        x = "Win Probability",
        y = "Upset Probability", 
        color = "Outcome") + 
    scale_color_manual(values = c("0"="red3", "1"="cornflowerblue"),
                       labels = c("0"="Loss", "1"="Win")) + 
    facet_wrap(~team_name)
all.outcome_plot_2

## Saving Plot
ggsave(filename = paste0("game_pick_ratio_count_", current_date, ".png"), 
       plot = all.outcome_plot_1,
       path = "/Users/camsmithers/Desktop/NBA Project/Main/Visualizations", 
       width = 35, height = 20, units = "cm")

ggsave(filename = paste0("daily_win_vs_upset_scatter_teams_", current_date, ".png"), 
       plot = all.outcome_plot_2,
       path = "/Users/camsmithers/Desktop/NBA Project/Main/Visualizations", 
       width = 35, height = 20, units = "cm")

#------------------------------------------------------------------------#

# General Historic
## Data Cleaning
historic.team_visual_data <- team_visual_data %>%
    filter(
        !is.na(team_fgm),
        team_cumsum_game >= 5,
        !is.na(upset_predicted_values),
        team_date != Sys.Date())

## Visualizations
historic.outcome_plot_1 <-  ggplot(historic.team_visual_data, 
                                   aes(x = winloss_predicted_values,
                                       y = upset_predicted_values,
                                       color = as.factor(team_game_outcome_2))) + 
    geom_vline(xintercept = 65, color = "black", linetype = "dashed") +
    geom_hline(yintercept = 50, color = "black", linetype = "dashed") + 
    geom_hline(yintercept = 25, color = "black", linetype = "dashed") + 
    geom_hline(yintercept = 37.5, color = "black", linetype = "dashed") + 
    geom_abline(slope = 5/13, color = "springgreen3", linetype = "solid") +
    geom_abline(slope = 1/2, color = "gold3", linetype = "solid") +
    geom_abline(slope = 2/3, color = "red3", linetype = "solid") +
    geom_point() +
    theme_bw() +
    labs(
        title = "Win & Upset Probability History",
        x = "Win Probability",
        y = "Upset Probability", 
        color = "Outcome") + 
    scale_color_manual(values = c("0"="red3", "1"="cornflowerblue"),
                       labels = c("0"="Loss", "1"="Win"))
historic.outcome_plot_1

historic.outcome_plot_2 <- ggplot(historic.team_visual_data,
                                  aes(x = nba_picks_factor,
                                      fill = as.factor(team_game_outcome_2))) + 
    geom_bar(position = "dodge", color = "black") + 
    geom_text(stat = "count", 
              aes(label = after_stat(count)), 
              position = position_dodge(width = 0.9), 
              vjust = -0.5) + 
    labs(
        title = "Win History in Relation to Zones",
        x = "Game Category",
        y = "Count",
        fill = "Outcome") + 
    theme_bw() + 
    scale_fill_manual(values = c("0"="red3", "1"="cornflowerblue"),
                      labels = c("0"="Loss", "1"="Win"))
historic.outcome_plot_2

historic.outcome_plot_a <- ggplot(historic.team_visual_data, 
                                  aes(x = my_adjusted_model_correct, 
                                      fill = as.factor(my_adjusted_model_correct))) +
    geom_bar(position = "dodge", color = "black") + 
    geom_text(stat = "count", 
              aes(label = after_stat(count)), 
              position = position_dodge(width = 0.9), 
              vjust = -0.5) + 
    labs(
        title = "Win Model Adjusted for Upset Probability",
        x = "Incorrect vs. Correct Picks",
        y = "Count",
        fill = "Picks") + 
    scale_y_continuous(limits = c(0, 475)) +
    #    facet_wrap(team_game_outcome_3~team_game_outcome_2) +
    theme_bw() + 
    scale_fill_manual(values = c("0"="red3", "1"="springgreen3"),
                      labels = c("0"="Incorrect", "1"="Correct"))
#historic.outcome_plot_a

historic.outcome_plot_c <- ggplot(historic.team_visual_data, 
                                  aes(x = fanduel_correct, 
                                      fill = as.factor(fanduel_correct))) +
    geom_bar(position = "dodge", color = "black") + 
    geom_text(stat = "count", 
              aes(label = after_stat(count)), 
              position = position_dodge(width = 0.9), 
              vjust = -0.5) + 
    labs(
        title = "Fanduel Model",
        x = "Incorrect vs. Correct Picks",
        y = "Count",
        fill = "Picks") + 
    scale_y_continuous(limits = c(0, 475)) +
    #    facet_wrap(team_game_outcome_3~team_game_outcome_2) +
    theme_bw() +
    scale_fill_manual(values = c("0"="red3", "1"="springgreen3"),
                      labels = c("0"="Incorrect", "1"="Correct"))
#historic.outcome_plot_c

cam_vs_fanduel <- historic.outcome_plot_a + historic.outcome_plot_c + 
    plot_layout(ncol = 2) + 
    plot_annotation(title = "Cam vs. Fanduel Models",
                    theme = theme(plot.title = element_text(hjust = 0.5)))
cam_vs_fanduel

## Saving Plot
if (FALSE) {
    ggsave(
        filename = paste0("game_splitting_history_2", current_date, ".png"), 
        plot = historic.outcome_plot_1,
        path = "/Users/camsmithers/Desktop/NBA Project/Main/Visualizations", 
        width = 100, height = 100, units = "cm"
    )
    
    ggsave(
        filename = paste0("game_splitting_ratio_", current_date, ".png"), 
        plot = all.outcome_plot_2,
        path = "/Users/camsmithers/Desktop/NBA Project/Main/Visualizations", 
        width = 35, height = 25, units = "cm"
    )
}

#------------------------------------------------------------------------#

#Win Margin Specific
## Data Cleaning
margin.team_visual_data <- team_visual_data %>%
    filter(
        !is.na(team_game_outcome_1),
        team_cumsum_game >= 5,
        team_date != Sys.Date(),
        team_team %in% daily.team_visual_data$team_team)

## Visualizations
margin.plot_1 <- ggplot(margin.team_visual_data,
                       aes(x = outcome_1_estimates_factor,
                           fill = margin_correct_factor)) + 
    geom_bar(position = "dodge", color = "black") + 
    geom_text(stat = "count", 
              aes(label = after_stat(count)), 
              position = position_dodge(width = 0.9), 
              vjust = -0.5) +
    facet_wrap(~team_name) +
    scale_fill_manual(values =
                          c("Incorrect"="red3", "Correct"="springgreen3")) + 
    labs(
        title = "Predicting Win Margin History",
        x = "Margins of Victor",
        y = "Count",
        fill = "Picks"
    )
margin.plot_1

if (TRUE) {
    ggsave(
        filename = paste0("win_margin_history_", current_date, ".png"),
        plot = margin.plot_1,
        path = "/Users/camsmithers/Desktop/NBA Project/Main/Visualizations",
        width = 35, height = 25, units = "cm"
    )
}