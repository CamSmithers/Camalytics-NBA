# Checking Data Script
data_check <- all_team_data %>%
    dplyr::select(team_team, team_opponent, team_date, 
           close_win, close_loss, blowout_win, blowout_loss)
View(data_check)