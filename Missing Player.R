#Atlanta Hawks
atl_best_player <- all_player_data %>%
    filter(player_player == "Trae Young")
atl_games <- all_team_data_12 %>%
    filter(team_team == "atl") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% atl_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Brooklyn Nets
bkn_best_player <- all_player_data %>%
    filter((player_player == "Dennis Schroder" & player_date <= "2024-12-14")|
               (player_player == "Cameron Johnson" & player_date > "2024-12-14"))
bkn_games <- all_team_data_12 %>%
    filter(team_team == "bkn") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% bkn_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Boston Celtics
bos_best_player <- all_player_data %>%
    filter(player_player == "Jayson Tatum")
bos_games <- all_team_data_12 %>%
    filter(team_team == "bos") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% bos_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Charlotte Hornets
cha_best_player <- all_player_data %>%
    filter(player_player == "LaMelo Ball")
cha_games <- all_team_data_12 %>%
    filter(team_team == "cha") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% cha_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Chicago Bulls
chi_best_player <- all_player_data %>%
    filter(player_player == "Zach LaVine")
chi_games <- all_team_data_12 %>%
    filter(team_team == "chi") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% chi_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Cleveland Cavaliers
cle_best_player <- all_player_data %>%
    filter(player_player == "Donovan Mitchell")
cle_games <- all_team_data_12 %>%
    filter(team_team == "cle") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% cle_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Dallas Mavericks
dal_best_player <- all_player_data %>%
    filter(player_player == "Luka Doncic")
dal_games <- all_team_data_12 %>%
    filter(team_team == "dal") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% dal_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Denver Nuggets
den_best_player <- all_player_data %>%
    filter(player_player == "Nikola Jokic")
den_games <- all_team_data_12 %>%
    filter(team_team == "den") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% den_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Detroit Pistons
det_best_player <- all_player_data %>%
    filter(player_player == "Cade Cunningham")
det_games <- all_team_data_12 %>%
    filter(team_team == "det") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% det_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Golden State Warriors
gsw_best_player <- all_player_data %>%
    filter(player_player == "Stephen Curry")
gsw_games <- all_team_data_12 %>%
    filter(team_team == "gsw") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% gsw_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Houston Rockets
hou_best_player <- all_player_data %>%
    filter(player_player == "Alperen Sengun")
hou_games <- all_team_data_12 %>%
    filter(team_team == "hou") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% hou_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Indiana Pacers
ind_best_player <- all_player_data %>%
    filter(player_player == "Tyrese Haliburton")
ind_games <- all_team_data_12 %>%
    filter(team_team == "ind") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% ind_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Los Angeles Clippers
lac_best_player <- all_player_data %>%
    filter(player_player == "Kawhi Leonard")
lac_games <- all_team_data_12 %>%
    filter(team_team == "lac") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% lac_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)


lal_best_player <- all_player_data %>%
    filter(player_player == "LeBron James")
lal_games <- all_team_data_12 %>%
    filter(team_team == "lal") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% lal_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)


#Memphis Grizzlies
mem_best_player <- all_player_data %>%
    filter(player_player == "Ja Morant")
mem_games <- all_team_data_12 %>%
    filter(team_team == "mem") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% mem_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Miami Heat
mia_best_player <- all_player_data %>%
    filter(player_player == "Jimmy Butler")
mia_games <- all_team_data_12 %>%
    filter(team_team == "mia") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% mia_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Milwaukee Bucks
mil_best_player <- all_player_data %>%
    filter(player_player == "Giannis Antetokounmpo")
mil_games <- all_team_data_12 %>%
    filter(team_team == "mil") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% mil_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Minnesota Timberwolves
min_best_player <- all_player_data %>%
    filter(player_player == "Anthony Edwards")
min_games <- all_team_data_12 %>%
    filter(team_team == "min") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% min_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#New Orleans Pelicans
nop_best_player <- all_player_data %>%
    filter(player_player == "Zion Williamson")
nop_games <- all_team_data_12 %>%
    filter(team_team == "nop") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% nop_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#New York Knicks
nyk_best_player <- all_player_data %>%
    filter(player_player == "Jalen Brunson")
nyk_games <- all_team_data_12 %>%
    filter(team_team == "nyk") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% nyk_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Oklahoma City Thunder
okc_best_player <- all_player_data %>%
    filter(player_player == "Shai Gilgeous-Alexander")
okc_games <- all_team_data_12 %>%
    filter(team_team == "okc") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% okc_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Orlando Magic
orl_best_player <- all_player_data %>%
    filter(player_player == "Paolo Banchero")
orl_games <- all_team_data_12 %>%
    filter(team_team == "orl") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% orl_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Philadelphia 76ers
phi_best_player <- all_player_data %>%
    filter(player_player == "Joel Embiid")
phi_games <- all_team_data_12 %>%
    filter(team_team == "phi") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% phi_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Phoenix Suns
phx_best_player <- all_player_data %>%
    filter(player_player == "Kevin Durant")
phx_games <- all_team_data_12 %>%
    filter(team_team == "phx") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% phx_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Portland Trail Blazers
por_best_player <- all_player_data %>%
    filter(player_player == "Anfernee Simons")
por_games <- all_team_data_12 %>%
    filter(team_team == "por") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% por_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Sacramento Kings
sac_best_player <- all_player_data %>%
    filter(player_player == "Domantas Sabonis")
sac_games <- all_team_data_12 %>%
    filter(team_team == "sac") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% sac_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#San Antonio Spurs
sas_best_player <- all_player_data %>%
    filter(player_player == "Victor Wembanyama")
sas_games <- all_team_data_12 %>%
    filter(team_team == "sas") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% sas_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Toronto Raptors
tor_best_player <- all_player_data %>%
    filter(player_player == "Scottie Barnes")
tor_games <- all_team_data_12 %>%
    filter(team_team == "tor") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% tor_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Utah Jazz
uta_best_player <- all_player_data %>%
    filter(player_player == "Lauri Markkanen")
uta_games <- all_team_data_12 %>%
    filter(team_team == "uta") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% uta_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#Washington Wizards
was_best_player <- all_player_data %>%
    filter(player_player == "Jordan Poole")
was_games <- all_team_data_12 %>%
    filter(team_team == "was") %>%
    mutate(missing_best_player = ifelse(!(team_date %in% was_best_player$player_date), 1, 0)) %>%
    select(team_team, team_date, missing_best_player)

#List of Data Frames
missing_player_team_games_list <- list(
    atl_games, bkn_games, bos_games, cha_games, chi_games,
    cle_games, dal_games, den_games, det_games, gsw_games,
    hou_games, ind_games, lac_games, lal_games, mem_games,
    mia_games, mil_games, min_games, nop_games, nyk_games,
    okc_games, orl_games, phi_games, phx_games, por_games,
    sac_games, sas_games, tor_games, uta_games, was_games
)
missing_player_team_games_df <- bind_rows(missing_player_team_games_list)