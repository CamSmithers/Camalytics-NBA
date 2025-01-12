# Checking Data Script
data_check <- all_team_data %>%
    dplyr::select(team_date, starts_with("league_cummean"))
#    filter( == )
View(data_check)