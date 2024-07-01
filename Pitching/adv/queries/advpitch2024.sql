SELECT * FROM thesisadvpitch.pitchers_nb
WHERE year =2024; ## 86 rows

CREATE TABLE perfpitchadv2024 AS
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
    advpitch2023 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2024
AND 
    a.Season = 2023;

SELECT * FROM thesisadvpitch.perfpitchadv2024
WHERE year =2024;
    
CREATE TABLE perfpitchadv2024_2 AS
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
    perfpitchadv2024 p
LEFT JOIN 
    advpitch2022 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2024
AND 
    a.Season = 2022;
    
SELECT * FROM thesisadvpitch.perfpitchadv2024_2
WHERE year =2024;

DELETE FROM thesisadvpitch.perfpitchadv2024_2
WHERE year != 2024;

SELECT * FROM thesisadvpitch.perfpitchadv2024_2; ##86 rows