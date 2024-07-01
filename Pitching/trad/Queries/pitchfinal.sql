CREATE TABLE pitchfinal AS
SELECT * FROM pitch_171819202223
UNION ALL
SELECT * FROM pitchperf2024_2;

SELECT * FROM pitchfinal;


## IF a player has IP AND IP_2 NULL it means that either the player was in the minor leagues both years 
## or that it is a batter that sneaked his way through our df. 
## we are going to remove those rows. 

DELETE FROM pitchfinal
WHERE IP IS NULL AND IP_2 IS NULL;

DESCRIBE pitchfinal;
