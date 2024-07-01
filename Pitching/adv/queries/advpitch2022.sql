SELECT * FROM thesisadvpitch.pitchers_nb
WHERE year =2022; ## 81 rows

CREATE TABLE perfpitchadv2022 AS
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
    advpitch2021 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2022
AND 
    a.Season = 2021;

SELECT * FROM thesisadvpitch.perfpitchadv2022
WHERE year =2022;
    
CREATE TABLE perfpitchadv2022_2 AS
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
    perfpitchadv2022 p
LEFT JOIN 
    advpitch2019 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2022
AND 
    a.Season = 2019;
    
SELECT * FROM thesisadvpitch.perfpitchadv2022_2
WHERE year =2022;

DELETE FROM thesisadvpitch.perfpitchadv2022_2
WHERE year != 2022;

SELECT * FROM thesisadvpitch.perfpitchadv2022_2; ##81 rows