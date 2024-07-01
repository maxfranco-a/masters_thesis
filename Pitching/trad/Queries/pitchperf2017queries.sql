# for the performance of 2017 free agent signings 
CREATE TABLE pitchperf2017 AS
SELECT m.Name,
       m.Date, 
       m.new_team,
       m.former_team,
       m.Age,
       m.WAR3,
       m.Yrs,
       m.career_games,
       m.stayed_same_team,
       t.W,
       t.L,
       t.ERA,
       t.WHIP,
       t.G,
       t.GS,
       t.QS,
       t.SV,
       t.BS,
       t.HLD,
       t.IP,
       t.SO,
       t.`K/9`,
       t.`BB/9`,
       t.`HR/9`,
       t.`GB%`,
       t.`LD%`,
       t.`FB%`,
       t.FBv,
       t.PlayerId,
       t.MLBAMID
FROM salaries2017 m
LEFT JOIN pitchtradstats2016 t ON m.Name = t.NameASCII;

SELECT * FROM pitchperf2017;