SELECT * FROM thesispitchv1.pitchperf2019;

CREATE TABLE pitchperf2019_2 AS
SELECT m.Name,
       m.Date,
       m.new_team,
       m.former_team,
       m.Age,
       m.WAR3,
       m.Yrs,
       m.career_games,
       m.stayed_same_team,
       m.W,
       m.L,
       m.ERA,
       m.WHIP,
       m.G,
       m.GS,
       m.QS,
       m.SV,
       m.BS,
       m.HLD,
       m.IP,
       m.SO,
       m.`K/9`,
       m.`BB/9`,
       m.`HR/9`,
       m.`GB%`,
       m.`LD%`,
       m.`FB%`,
       m.FBv,
       m.PlayerId,
       m.MLBAMID,
       t.W as W_2,
       t.L as L_2,
       t.ERA as ERA_2,
       t.WHIP as WHIP_2,
       t.G as G_2,
       t.GS as GS_2,
       t.QS as QS_2,
       t.SV as SV_2,
       t.BS as BS_2,
       t.HLD as HLD_2,
       t.IP as IP_2,
       t.SO as SO_2,
       t.`K/9` as `K/9_2`,
       t.`BB/9` as `BB/9_2`,
       t.`HR/9` as `HR/9_2`,
       t.`GB%` as `GB%_2`,
       t.`LD%` as `LD%_2`,
       t.`FB%` as `FB%_2`,
       t.FBv as FBv_2
FROM pitchperf2019 m
LEFT JOIN pitchtradstats2017 t ON m.Name = t.NameASCII;

SELECT * FROM pitchperf2019_2;