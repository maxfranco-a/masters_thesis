SELECT * FROM thesisadvpitch.pitchers_nb
WHERE year =2018; ## 69 rows

CREATE TABLE perfpitchadv2018 AS
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
    advpitch2017 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2018
AND 
    a.Season = 2017;

SELECT * FROM thesisadvpitch.perfpitchadv2018
WHERE year =2018;
    
CREATE TABLE perfpitchadv2018_2 AS
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
    perfpitchadv2018 p
LEFT JOIN 
    advpitch2016 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2018
AND 
    a.Season = 2016;
    
SELECT * FROM thesisadvpitch.perfpitchadv2018_2
WHERE year =2018;

DELETE FROM thesisadvpitch.perfpitchadv2018_2
WHERE year != 2018;

SELECT * FROM thesisadvpitch.perfpitchadv2018_2; ##69 rows