# Checking Data Script
data_check <- camalytics_predictions_data %>%
    dplyr::select(date, camalytics_picks, team_opponent, 
                  my_adjusted_model_correct, fanduel_correct)
View(data_check)