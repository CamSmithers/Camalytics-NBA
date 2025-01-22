# Checking Data Script
data_check <- team_visual_data %>%
    dplyr::select(team_date, team_team, team_opponent, 
                  upset_predicted_values, opponent_upset_predicted_values)
View(data_check)