CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    team_id INTEGER NOT NULL,
    FOREIGN KEY(team_id) REFERENCES teams(id)
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER NOT NULL,
    away_team_id INTEGER NOT NULL,
    referee_id INTEGER NOT NULL,
    match_date DATE NOT NULL,
    FOREIGN KEY(home_team_id) REFERENCES teams(id),
    FOREIGN KEY(away_team_id) REFERENCES teams(id),
    FOREIGN KEY(referee_id) REFERENCES referees(id)
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL,
    match_id INTEGER NOT NULL,
    goal_time TIME NOT NULL,
    FOREIGN KEY(player_id) REFERENCES players(id),
    FOREIGN KEY(match_id) REFERENCES matches(id)
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE season_matches (
    id SERIAL PRIMARY KEY,
    season_id INTEGER NOT NULL,
    match_id INTEGER NOT NULL,
    FOREIGN KEY(season_id) REFERENCES seasons(id),
    FOREIGN KEY(match_id) REFERENCES matches(id)
);

CREATE TABLE team_seasons (
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL,
    season_id INTEGER NOT NULL,
    ranking INTEGER NOT NULL,
    FOREIGN KEY(team_id) REFERENCES teams(id),
    FOREIGN KEY(season_id) REFERENCES seasons(id)
);