cover_pts_daily_analysis <- all_data %>%
    select(player_date, player_team, player_player, team_opponent, avg_player_pts,
           player_gen_player_pts, avg_opponent_team_defrating, cover_pts_prob) %>%
    filter(player_date == Sys.Date())
View(cover_pts_daily_analysis)
#write_csv(cover_pts_daily_analysis, "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/PlayerPts1/12_23_24.csv")

cover_pts_v2_daily_analysis <- all_data %>%
    select(player_date, player_team, player_player, team_opponent, avg_player_pts,
           player_gen_player_pts, avg_opponent_team_defrating, player_cover_pts_rate,cover_pts_v2_prob) %>%
    filter(player_date == Sys.Date())
View(cover_pts_v2_daily_analysis)
#write_csv(cover_pts_daily_analysis, "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/PlayerPts2/12_23_24.csv")

