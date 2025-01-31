# Checking Data Script
data_check <- all_team_data %>%
    dplyr::select(team_date, team_team, team_game_outcome_2, 
                  team_cummean_plusminus_win, 
                  team_cummean_plusminus_loss, 
                  opponent_cummean_plusminus_win,
                  opponent_cummean_plusminus_loss)
View(data_check)