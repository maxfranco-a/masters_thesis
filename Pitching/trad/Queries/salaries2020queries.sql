SELECT * FROM thesispitchv1.salaries2020;

## to check for hispanic names with an accent á é í ó ú 
SELECT *
FROM salaries2020
WHERE Name REGEXP '[áéíúÁÉÍÚ]'
LIMIT 0, 1000;

#replace the ones with á, é, í, ó, ú. 
#lowerletters
UPDATE salaries2020 SET Name = REPLACE(Name, 'á', 'a') WHERE Name LIKE '%á%';
UPDATE salaries2020 SET Name = REPLACE(Name, 'ó', 'o') WHERE Name LIKE '%ó%';
UPDATE salaries2020 SET Name = REPLACE(Name, 'é', 'e') WHERE Name LIKE '%é%';
UPDATE salaries2020 SET Name = REPLACE(Name, 'í', 'i') WHERE Name LIKE '%í%';
UPDATE salaries2020 SET Name = REPLACE(Name, 'ú', 'u') WHERE Name LIKE '%ú%';

#replace the ones with
#capitalletters
UPDATE salaries2020 SET Name = REPLACE(Name, 'Á', 'A') WHERE Name LIKE '%Á%';  
UPDATE salaries2020 SET Name = REPLACE(Name, 'Ó', 'O') WHERE Name LIKE '%Ó%'; 
UPDATE salaries2020 SET Name = REPLACE(Name, 'É', 'E') WHERE Name LIKE '%É%'; 
UPDATE salaries2020 SET Name = REPLACE(Name, 'Í', 'I') WHERE Name LIKE '%Í%';
UPDATE salaries2020 SET Name = REPLACE(Name, 'Ú', 'U') WHERE Name LIKE '%Ú%'; 


##to keep pitchers
SELECT * FROM salaries2020;
DELETE FROM salaries2020
WHERE IP < AB;

#drop the IP and AB columns after 
ALTER TABLE salaries2020
DROP COLUMN IP,
DROP COLUMN AB;
SELECT * FROM salaries2020;

#keep only the year in date 
UPDATE salaries2020
SET Date = SUBSTRING(Date, length(Date) - 3, 4)
WHERE Date LIKE '%/%/%';

#change the ones with 2019, because all of them were after the 2019 season and it would corrupt the final database where we are adding the salaries2019
UPDATE salaries2020
SET Date = REPLACE(Date, '2019', '2020')
WHERE Date LIKE '%2019%';

#change the To Team columns to abbreviations
UPDATE salaries2020 s
JOIN team_mapping m ON s.`To Team` = m.full_name
SET s.`To Team` = m.abbreviation;

ALTER TABLE salaries2020
CHANGE COLUMN `To Team` new_team TEXT,
CHANGE COLUMN `From Team` former_team TEXT,
CHANGE COLUMN `G` career_games TEXT;

SELECT * FROM salaries2020;

#if the player stayed on the same team
ALTER TABLE salaries2020
ADD stayed_same_team INT;

UPDATE salaries2020
SET stayed_same_team = CASE WHEN new_team = former_team THEN 1 ELSE 0 END;