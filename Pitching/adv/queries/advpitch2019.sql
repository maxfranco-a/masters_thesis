SELECT * FROM thesisadvpitch.pitchers_nb
WHERE year =2019; ## 66 rows

CREATE TABLE perfpitchadv2019 AS
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
    advpitch2018 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2019
AND 
    a.Season = 2018;

SELECT * FROM thesisadvpitch.perfpitchadv2019
WHERE year =2019;
    
CREATE TABLE perfpitchadv2019_2 AS
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
    perfpitchadv2019 p
LEFT JOIN 
    advpitch2017 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2019
AND 
    a.Season = 2017;
    
SELECT * FROM thesisadvpitch.perfpitchadv2019_2
WHERE year =2019;

DELETE FROM thesisadvpitch.perfpitchadv2019_2
WHERE year != 2019;

SELECT * FROM thesisadvpitch.perfpitchadv2019_2; ##66 rows