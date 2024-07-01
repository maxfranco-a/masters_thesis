CREATE TABLE perf2019 AS
SELECT m.Name,
       m.date, 
       m.new_team,
       m.former_team,
       m.Age,
       m.WAR3,
       m.Yrs,
       m.career_games,
       m.stayed_same_team,
       t.G,
       t.PA,
       t.HR,
       t.R,
       t.RBI,
       t.SB,
       t.`BB%`,
       t.`K%`,
       t.AVG,
       t.OBP,
       t.SLG,
       t.GDP,
       t.CS,
       t.H,
       t.OPS,
       t.PlayerId,
       t.MLBAMID
FROM salaries2019 m
LEFT JOIN trad_stats2018 t ON m.Name = t.NameASCII;

#for perf2019_2, im adding the 2017 stats 

CREATE TABLE perf2019_2 AS
SELECT m.Name,
       m.date,
       m.new_team,
       m.former_team,
       m.Age,
       m.WAR3,
       m.Yrs,
       m.career_games,
       m.stayed_same_team,
       m.G,
       m.PA,
       m.HR,
       m.R,
       m.RBI,
       m.SB,
       m.`BB%`,
       m.`K%`,
       m.AVG,
       m.OBP,
       m.SLG,
       m.GDP,
       m.CS,
       m.H,
       m.OPS,
       m.PlayerId,
       m.MLBAMID,
       t.G AS G_2,
       t.PA AS PA_2,
       t.HR AS HR_2,
       t.R AS R_2,
       t.RBI AS RBI_2,
       t.SB AS SB_2,
       t.`BB%` AS `BB%_2`,
       t.`K%` AS `K%_2`,
       t.AVG AS AVG_2,
       t.OBP AS OBP_2,
       t.SLG AS SLG_2,
       t.GDP AS GDP_2,
       t.CS AS CS_2,
       t.H AS H_2,
       t.OPS AS OPS_2
FROM perf2019 m
LEFT JOIN trad_stats2017 t ON m.PlayerId = t.PlayerId;