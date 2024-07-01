SELECT * FROM thesisv1.team_mapping;
CREATE TABLE team_mapping (
    full_name VARCHAR(255),
    abbreviation VARCHAR(10)
);

INSERT INTO team_mapping (full_name, abbreviation)
VALUES
    ('Atlanta Braves', 'ATL'),
    ('Arizona Diamondbacks', 'ARI'),
    ('Baltimore Orioles', 'BAL'),
    ('Boston Red Sox', 'BOS'),
    ('Chicago Cubs', 'CHC'),
    ('Cincinnati Reds', 'CIN'),
    ('Cleveland Guardians','CLE'),
    ('Cleveland Indians', 'CLE'),
    ('Colorado Rockies','COL'),
    ('Chicago White Sox','CHW'),
    ('Detroit Tigers','DET'),
    ('Houston Astros','HOU'),
    ('Kansas City Royals','KCR'),
    ('Los Angeles Angels','LAA'),
    ('Los Angeles Angels of Anaheim', 'LAA'),
    ('Los Angeles Dodgers','LAD'),
    ('Miami Marlins','MIA'),
    ('Milwaukee Brewers','MIL'),
    ('Minnesota Twins','MIN'),
    ('New York Mets','NYM'),
    ('New York Yankees','NYY'),
    ('Oakland Athletics','OAK'),
    ('Philadelphia Phillies', 'PHI'),
    ('Pittsburgh Pirates', 'PIT'),
    ('San Diego Padres','SDP'),
    ('Seattle Mariners','SEA'),
    ('San Francisco Giants','SFG'),
    ('St. Louis Cardinals','STL'),
    ('Tampa Bay Rays', 'TBR'),
    ('Texas Rangers','TEX'),
    ('Toronto Blue Jays','TOR'),
    ('Washington Nationals','WSN');
    
    


SELECT * FROM team_mapping;

USE thesisv1;

UPDATE salaries2024 s
JOIN team_mapping m ON s.`To Team` = m.full_name
SET s.`To Team` = m.abbreviation;


UPDATE salaries2023 s
JOIN team_mapping m ON s.`To Team` = m.full_name
SET s.`To Team` = m.abbreviation;

UPDATE salaries2022 s
JOIN team_mapping m ON s.`To Team` = m.full_name
SET s.`To Team` = m.abbreviation;
