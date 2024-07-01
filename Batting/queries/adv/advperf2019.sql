SELECT * FROM thesisadvbat.df5
WHERE year =2019; ## 44 rows

CREATE TABLE perfadv2019 AS
SELECT 
    df5.*, 
    a.BABIP, 
    a.wOBA, 
    a.`wRC+`, 
    a.Off, 
    a.Def, 
    a.BsR, 
    a.WAR, 
    a.wRAA, 
    a.UBR, 
    a.WPA, 
    a.Clutch, 
    a.`Barrel%`, 
    a.`HardHit%`, 
    a.xBA, 
    a.xSLG,
    a.PlayerId AS adv2018_PlayerId
FROM 
    df5
LEFT JOIN 
    adv2018 a
ON 
    df5.PlayerId = a.PlayerId
AND 
    df5.year = 2019
AND 
    a.Season = 2018;

SELECT * FROM thesisadvbat.perfadv2019
WHERE year =2019;
    
CREATE TABLE perfadv2019_2 AS
SELECT 
    p.*, 
    a.BABIP AS BABIP_2, 
    a.wOBA AS wOBA_2, 
    a.`wRC+` AS `wRC+_2`, 
    a.Off AS Off_2, 
    a.Def AS Def_2, 
    a.BsR AS BsR_2, 
    a.WAR AS WAR_2, 
    a.wRAA AS wRAA_2, 
    a.UBR AS UBR_2, 
    a.WPA AS WPA_2, 
    a.Clutch AS Clutch_2, 
    a.`Barrel%` AS `Barrel%_2`, 
    a.`HardHit%` AS `HardHit%_2`, 
    a.xBA AS xBA_2, 
    a.xSLG AS xSLG_2,
    a.PlayerId AS adv2017_PlayerId
FROM 
    perfadv2019 p
LEFT JOIN 
    adv2017 a
ON 
    p.PlayerId = a.PlayerId
AND 
    p.year = 2019
AND 
    a.Season = 2017;
    
SELECT * FROM thesisadvbat.perfadv2019_2
WHERE year =2019;

DELETE FROM thesisadvbat.perfadv2019_2
WHERE year != 2019;

SELECT * FROM thesisadvbat.perfadv2019_2; ## 44 rows