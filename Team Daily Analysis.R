winloss_daily_analysis <- all_team_data %>%
    select(team_date, team_team, team_home, avg_team_offrating, avg_team_defrating, 
           team_opponent, avg_opponent_team_offrating, avg_opponent_team_defrating, winloss_team_prob) %>%
    filter(team_date == Sys.Date())
View(winloss_daily_analysis)
#write_csv(winloss_daily_analysis, "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/WinLoss1/winloss1_12_23_24.csv")

winloss_v2_daily_analysis <- all_team_data %>%
    select(team_date, team_team, team_home, team_weighted_offrating, team_weighted_defrating, 
           team_opponent, opponent_team_weighted_offrating, opponent_team_weighted_defrating, winloss_v2_team_prob) %>%
    filter(team_date == Sys.Date())
#View(winloss_v2_daily_analysis)
#write_csv(winloss_v2_daily_analysis, "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/WinLoss2/winloss2_12_23_24.csv")

upset_daily_analysis <- all_team_data %>%
    select(team_date, team_team, team_home, team_opponent, team_favored, team_upset_rate, team_spread,upset_team_prob) %>%
    filter(team_date == Sys.Date())
View(upset_daily_analysis)
#write_csv(upset_daily_analysis, "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/Upset1/upset1_12_23_24.csv")

close_win_daily_analysis <- all_team_data %>%
    select(team_date, team_team, team_home, avg_team_netrating, team_opponent, avg_opponent_team_netrating, close_win_prob) %>%
    filter(team_date == Sys.Date())
View(close_win_daily_analysis)
#write_csv(close_win_daily_analysis, "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/CloseWin1/closewin1_12_23_24.csv")

close_win_v2_daily_analysis <- all_team_data %>%
    select(team_date, team_team, team_home, team_weighted_netrating, team_opponent, opponent_team_weighted_netrating, close_win_v2_prob) %>%
    filter(team_date == Sys.Date())
#View(close_win_v2_daily_analysis)
#write_csv(close_win_v2_daily_analysis, "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/CloseWin2/closewin2_12_23_24.csv")