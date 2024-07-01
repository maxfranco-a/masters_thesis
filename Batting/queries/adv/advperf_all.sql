CREATE TABLE thesisadvbat.perfadv_all AS
SELECT * FROM thesisadvbat.perfadv2024_2
UNION ALL
SELECT * FROM thesisadvbat.perfadv2023_2
UNION ALL
SELECT * FROM thesisadvbat.perfadv2022_2
UNION ALL
SELECT * FROM thesisadvbat.perfadv2020_2
UNION ALL
SELECT * FROM thesisadvbat.perfadv2019_2
UNION ALL
SELECT * FROM thesisadvbat.perfadv2018_2
UNION ALL
SELECT * FROM thesisadvbat.perfadv2017_2
UNION ALL
SELECT * FROM thesisadvbat.perfadv2016_2;


SELECT * FROM perfadv_all;

ALTER TABLE thesisadvbat.perfadv_all
DROP COLUMN adv2023_PlayerId,
DROP COLUMN adv2022_PlayerId;
