#Outcome 1 (Primary): Game Outcome (w/ Magnitude)
daily.ppg_oppg_data <- ppg_oppg_data %>%
    dplyr::select(team_date, team_team, team_opponent, 
                  close_win, close_loss, blowout_win, blowout_loss) %>%
    filter(team_date == Sys.Date())

daily.offrtg_defrtg_data <- offrtg_defrtg_data %>%
    dplyr::select(team_date, team_team, team_opponent, 
                  close_win, close_loss, blowout_win, blowout_loss) %>%
    filter(team_date == Sys.Date())

View(daily.ppg_oppg_data)
View(daily.offrtg_defrtg_data)

#Outcomes 2 to 4
daily.predictions <- all_team_data %>%
    dplyr::select(team_date, team_team, team_opponent,
                  team_win_chance, team_blowout_chance, team_upset_chance) %>%
    filter(team_date == Sys.Date())
View(daily.predictions)