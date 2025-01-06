# Checking Data Script
data_check <- all_team_data %>%
    dplyr::select(team_team, team_date, team_opponent, team_date, 
           close_win, close_loss, blowout_win, blowout_loss) %>%
    filter(team_date == Sys.Date())
View(data_check)