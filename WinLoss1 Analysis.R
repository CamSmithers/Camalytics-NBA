# Loading in data
winloss1_folder <- "/Users/camsmithers/Desktop/NBA Project/Main/Model Predictions/WinLoss1"
winloss1_files <- list.files(winloss1_folder, pattern = "\\.csv", full.names = TRUE)

# Combing data into one frame
winloss1_outcome_data <- winloss1_files %>%
    lapply(read_csv) %>%
    bind_rows()
head(winloss1_outcome_data)

# Creating intermediate data frame to add 
winloss1_intermediate <- winloss1_outcome_data %>%
    select(team_date, team_team, winloss_team_prob) %>%
    rename("team_int" = "team_team", "winloss_team_prob_int" = "winloss_team_prob")

winloss1_outcome_data <- winloss1_outcome_data %>%
    left_join(winloss1_intermediate, by = c("team_opponent" = "team_int", "team_date" = "team_date")) %>%
    rename("winloss_opponent_team_prob" = "winloss_team_prob_int")

winloss1_outcome_data <- winloss1_outcome_data %>%
    mutate(winloss_model_pick = ifelse(winloss_team_prob > winloss_opponent_team_prob, 1, 0)) %>%
    mutate(winloss_model_range = winloss_team_prob - winloss_opponent_team_prob)

winloss_all_team_data <- all_team_data %>%
    select(team_team, team_date, team_winloss, team_favored)

winloss1_outcome_data <- winloss1_outcome_data %>%
    left_join(winloss_all_team_data, by = c("team_team", "team_date")) %>%
    filter(!is.na(team_winloss)) %>%
    mutate(my_predictions = ifelse(winloss_model_pick == team_winloss, 1, 0)) %>%
    mutate(fd_predictions = ifelse(team_favored == team_winloss, 1, 0))

#    filter((my_predictions != fd_predictions) & (my_predictions != team_winloss))

model_review <- winloss1_outcome_data %>%
    summarize(
        mymodel = sum(my_predictions, na.rm = TRUE),
        fanduel = sum(fd_predictions, na.rm = TRUE)
    ) 

model_review_long <- model_review %>%
    pivot_longer(cols = c(mymodel, fanduel),  # Explicitly list the columns
                 names_to = "Model", 
                 values_to = "Total_Predictions")

# Plot the data
ggplot(model_review_long, aes(x = Model, y = Total_Predictions, fill = Model)) +
    geom_col() +
    theme_minimal() +
    labs(title = "Prediction Totals by Model", x = "Model", y = "Total Predictions")

#ggplot(winloss1_outcome_data, aes(winloss_team_prob, winloss_model_range, color = as.factor(team_date))) +
#    geom_text_repel(aes(label = team_team), size = 5)