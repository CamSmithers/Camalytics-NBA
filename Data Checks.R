# Checking Data Script
data_check <- daily_team_visual_data %>%
    dplyr::select(team_date, team_team, win_diff_from_daily_2,
                  winloss_2_predicted_values, team_cumrate_wins_favored,
                  team_cumrate_wins_nonfavored, win_diff_from_daily_2_exp_win,
                  win_diff_from_daily_2_exp_loss)
View(data_check)
