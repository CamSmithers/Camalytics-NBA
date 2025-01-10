#Outcomes 2: Daily Predictions
daily.predictions <- all_team_data %>%
    dplyr::select(team_date, team_team, team_opponent,
                  team_win_chance, team_cumrate_win,
                  team_upset_chance, team_cumrate_upset) %>%
    rename("Game Date"="team_date", "Team"="team_team", "Opponent"="team_opponent",
           "Win Probability"="team_win_chance", "Current Win Pct"="team_cumrate_win", 
           "Upset Probability"="team_upset_chance", "Current Upset Pct"="team_cumrate_upset") %>%
    filter(`Game Date` == Sys.Date())
View(daily.predictions)

current_date <- format(Sys.Date(), "%m_%d_%y")

#write_csv(daily.predictions, 
#          paste0("/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/Game Outcome 2/Daily/go2_", current_date, ".csv"))

#Outcome 2: Historical Predictions
historical.predictions <- all_team_data %>%
    dplyr::select(team_date, team_team, team_opponent,
                  team_win_chance, team_cumrate_win,
                  team_upset_chance, team_cumrate_upset) %>%
    rename("Date" = "team_date", "Team" = "team_team", "Opponent" = "team_opponent",
           "Win Probability" = "team_win_chance", "Current Win Pct" = "team_cumrate_win", 
           "Upset Probability" = "team_upset_chance", "Current Upset Pct" = "team_cumrate_upset") %>%
    filter(Date != Sys.Date())

#write_csv(historical.predictions, "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/Game Outcome 2/historical_predictions.csv")