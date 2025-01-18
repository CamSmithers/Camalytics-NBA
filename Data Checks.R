# Checking Data Script
data_check <- all_team_data %>%
    dplyr::select(team_date, team_team, team_gametotal)
View(data_check)