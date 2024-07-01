CREATE TABLE thesisadvpitch.perfpitchadv_all AS
SELECT * FROM thesisadvpitch.perfpitchadv2024_2
UNION ALL
SELECT * FROM thesisadvpitch.perfpitchadv2023_2
UNION ALL
SELECT * FROM thesisadvpitch.perfpitchadv2022_2
UNION ALL
SELECT * FROM thesisadvpitch.perfpitchadv2020_2
UNION ALL
SELECT * FROM thesisadvpitch.perfpitchadv2019_2
UNION ALL
SELECT * FROM thesisadvpitch.perfpitchadv2018_2
UNION ALL
SELECT * FROM thesisadvpitch.perfpitchadv2017_2;


SELECT * FROM perfpitchadv_all;
