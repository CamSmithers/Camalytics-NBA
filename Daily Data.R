#Outcomes 2: Daily Predictions
daily.predictions <- all_team_data %>%
    dplyr::select(team_date, team_team, team_opponent,
                  winloss_predicted_values, upset_predicted_values,
                  gametotal_predicted_values,
                  team_cumrate_win, team_cumsum_win, team_cumsum_game,
                  team_cumrate_upset, team_cumsum_upset, team_cumsum_favored) %>%
    mutate(team_team = case_when(
        #Atlantic Division
        team_team == "bos" ~ "Boston Celtics",
        team_team == "bkn" ~ "Brooklyn Nets",
        team_team == "nyk" ~ "New York Knicks",
        team_team == "phi" ~ "Philadelphia 76ers",
        team_team == "tor" ~ "Toronto Raptors",
        #Central Division
        team_team == "chi" ~ "Chicago Bulls",
        team_team == "cle" ~ "Cleveland Cavaliers",
        team_team == "det" ~ "Detroit Pistons",
        team_team == "ind" ~ "Indiana Pacers",
        team_team == "mil" ~ "Milwaukee Bucks",
        #Southeast Division
        team_team == "atl" ~ "Atlanta Hawks",
        team_team == "cha" ~ "Charlotte Hornets",
        team_team == "mia" ~ "Miami Heat",
        team_team == "orl" ~ "Orlando Magic",
        team_team == "was" ~ "Washington Wizards",
        #Northwest Division
        team_team == "den" ~ "Denver Nuggets",
        team_team == "min" ~ "Minnesota Timberwolves",
        team_team == "okc" ~ "Oklahoma City Thunder",
        team_team == "por" ~ "Portland Trail Blazers",
        team_team == "uta" ~ "Utah Jazz",
        #Pacific Division
        team_team == "gsw" ~ "Golden State Warriors",
        team_team == "lac" ~ "Los Angeles Clippers",
        team_team == "lal" ~ "Los Angeles Lakers",
        team_team == "phx" ~ "Phoenix Suns",
        team_team == "sac" ~ "Sacramento Kings",
        #Southwest Division
        team_team == "dal" ~ "Dallas Mavericks",
        team_team == "hou" ~ "Houston Rockets",
        team_team == "mem" ~ "Memphis Grizzlies",
        team_team == "nop" ~ "New Orleans Pelicans",
        team_team == "sas" ~ "San Antonio Spurs")) %>%
    mutate(team_opponent = case_when(
        #Atlantic Division
        team_opponent == "bos" ~ "Boston Celtics",
        team_opponent == "bkn" ~ "Brooklyn Nets",
        team_opponent == "nyk" ~ "New York Knicks",
        team_opponent == "phi" ~ "Philadelphia 76ers",
        team_opponent == "tor" ~ "Toronto Raptors",
        #Central Division
        team_opponent == "chi" ~ "Chicago Bulls",
        team_opponent == "cle" ~ "Cleveland Cavaliers",
        team_opponent == "det" ~ "Detroit Pistons",
        team_opponent == "ind" ~ "Indiana Pacers",
        team_opponent == "mil" ~ "Milwaukee Bucks",
        #Southeast Division
        team_opponent == "atl" ~ "Atlanta Hawks",
        team_opponent == "cha" ~ "Charlotte Hornets",
        team_opponent == "mia" ~ "Miami Heat",
        team_opponent == "orl" ~ "Orlando Magic",
        team_opponent == "was" ~ "Washington Wizards",
        #Northwest Division
        team_opponent == "den" ~ "Denver Nuggets",
        team_opponent == "min" ~ "Minnesota Timberwolves",
        team_opponent == "okc" ~ "Oklahoma City Thunder",
        team_opponent == "por" ~ "Portland Trail Blazers",
        team_opponent == "uta" ~ "Utah Jazz",
        #Pacific Division
        team_opponent == "gsw" ~ "Golden State Warriors",
        team_opponent == "lac" ~ "Los Angeles Clippers",
        team_opponent == "lal" ~ "Los Angeles Lakers",
        team_opponent == "phx" ~ "Phoenix Suns",
        team_opponent == "sac" ~ "Sacramento Kings",
        #Southwest Division
        team_opponent == "dal" ~ "Dallas Mavericks",
        team_opponent == "hou" ~ "Houston Rockets",
        team_opponent == "mem" ~ "Memphis Grizzlies",
        team_opponent == "nop" ~ "New Orleans Pelicans",
        team_opponent == "sas" ~ "San Antonio Spurs")) %>%
    rename("Game Date"="team_date", "Team"="team_team", 
           "Opponent"="team_opponent", 
           "Win Probability"="winloss_predicted_values",
           "Upset Probability"="upset_predicted_values",
           "Expected Game Total"="gametotal_predicted_values",
           "Current Win Pct"="team_cumrate_win", 
           "Current Upset Pct"="team_cumrate_upset",
           "No. Games Won"="team_cumsum_win", 
           "No. Games Played"="team_cumsum_game", 
           "No. Games Upset"="team_cumsum_upset", 
           "No. Games Favored"="team_cumsum_favored") %>%
    filter(`Game Date` == Sys.Date())
View(daily.predictions)

current_date <- format(Sys.Date(), "%m_%d_%y")

#write_csv(daily.predictions, 
#          paste0("/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/Daily/GameOutcome_", current_date, ".csv"))

#Outcome 2: Historical Predictions
historical.predictions <- all_team_data %>%
    dplyr::select(team_date, team_team, team_opponent,
                  winloss_predicted_values, upset_predicted_values,
                  gametotal_predicted_values,
                  team_cumrate_win, team_cumsum_win, team_cumsum_game,
                  team_cumrate_upset, team_cumsum_upset, team_cumsum_favored) %>%
    rename("Game Date"="team_date", "Team"="team_team", 
           "Opponent"="team_opponent", 
           "Win Probability"="winloss_predicted_values",
           "Upset Probability"="upset_predicted_values",
           "Expected Game Total"="gametotal_predicted_values",
           "Current Win Pct"="team_cumrate_win", 
           "Current Upset Pct"="team_cumrate_upset",
           "No. Games Won"="team_cumsum_win", 
           "No. Games Played"="team_cumsum_game", 
           "No. Games Upset"="team_cumsum_upset", 
           "No. Games Favored"="team_cumsum_favored") %>%
    filter(`Game Date` != Sys.Date()) %>%
    filter(`No. Games Played` >= 20)
    

#write_csv(historical.predictions,
#          "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/historical_predictions.csv")


#Data Export for Public R Markdown File

nba_team_24_25 <- all_team_data %>%
    filter(team_date != Sys.Date())
#write_csv(nba_team_24_25, 
#          "/Users/camsmithers/Desktop/NBA Project/Main/Data/nba_team_24_25.csv")