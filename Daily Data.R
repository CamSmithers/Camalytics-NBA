daily.ppg_oppg_data <- ppg_oppg_data %>%
    dplyr::select(team_date, team_team, team_opponent, 
                  close_win, close_loss, blowout_win, blowout_loss) %>%
    filter(team_date == Sys.Date())

daily.offrtg_defrtg_data <- offrtg_defrtg_data %>%
    dplyr::select(team_date, team_team, team_opponent, 
                  close_win, close_loss, blowout_win, blowout_loss) %>%
    filter(team_date == Sys.Date())

test.offrtg_defrtg_data <- offrtg_defrtg_data %>%
    dplyr::select(team_date, team_team, team_opponent,
                  close_win, close_loss, blowout_win, blowout_loss,
                  team_game_outcome)

View(daily.ppg_oppg_data)
View(daily.offrtg_defrtg_data)
View(test.offrtg_defrtg_data)