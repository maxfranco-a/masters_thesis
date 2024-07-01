SELECT * FROM thesisadvpitch.pitchers_nb
WHERE year =2020; ## 65 rows

CREATE TABLE perfpitchadv2020 AS
SELECT 
    p.*, 
    a.FIP, 
    a.WAR, 
    a.xFIP, 
    a.WPA, 
    a.SIERA, 
    a.xERA,
    a.EV
FROM 
    pitchers_nb p
LEFT JOIN 
    advpitch2019 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2020
AND 
    a.Season = 2019;

SELECT * FROM thesisadvpitch.perfpitchadv2020
WHERE year =2020;
    
CREATE TABLE perfpitchadv2020_2 AS
SELECT 
    p.*, 
    a.FIP as FIP_2, 
    a.WAR as WAR_2, 
    a.xFIP as xFIP_2, 
    a.WPA as WPA_2, 
    a.SIERA as SIERA_2, 
    a.xERA as xERA_2,
    a.EV as EV_2
FROM 
    perfpitchadv2020 p
LEFT JOIN 
    advpitch2018 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2020
AND 
    a.Season = 2018;
    
SELECT * FROM thesisadvpitch.perfpitchadv2020_2
WHERE year =2020;

DELETE FROM thesisadvpitch.perfpitchadv2020_2
WHERE year != 2020;

SELECT * FROM thesisadvpitch.perfpitchadv2020_2; ##65 rows