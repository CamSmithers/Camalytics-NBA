# Checking Data Script
data_check <- all_team_data %>%
    select(team_team, team_opponent, team_date, 
           team_cummean_offrating, team_cummean_defrating, 
           opponent_cummean_offrating, opponent_cummean_defrating)
View(data_check)