CREATE TABLE pitch_171819 AS
SELECT * FROM pitch_1718
UNION ALL
SELECT * FROM pitchperf2019_2;

SELECT * FROM pitch_171819;