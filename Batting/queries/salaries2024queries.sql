SELECT * FROM thesisv1.salaries2024;

## to check for hispanic names with an accent á é í ó ú 
SELECT *
FROM thesisv1.salaries2024
WHERE Name REGEXP '[áéíúÁÉÍÚ]'
LIMIT 0, 1000;

#replace the ones with á, é, í, ó, ú. 
#lowerletters
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'á', 'a') WHERE Name LIKE '%á%';

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%á%';

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%ó%';
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'ó', 'o') WHERE Name LIKE '%ó%';

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%é%';
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'é', 'e') WHERE Name LIKE '%é%';

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%í%';
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'í', 'i') WHERE Name LIKE '%í%';

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%ú%';
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'ú', 'u') WHERE Name LIKE '%ú%';

#replace the ones with
#capitalletters
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'Á', 'A') WHERE Name LIKE '%Á%'; #none affected 

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%Á%';

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%Ó%';
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'Ó', 'O') WHERE Name LIKE '%Ó%'; #1 affected

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%É%';
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'É', 'E') WHERE Name LIKE '%É%'; #NONE affected

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%Í%';
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'Í', 'I') WHERE Name LIKE '%Í%';

SELECT * FROM thesisv1.salaries2024 WHERE Name LIKE '%Ú%';
UPDATE thesisv1.salaries2024 SET Name = REPLACE(Name, 'Ú', 'U') WHERE Name LIKE '%Ú%'; #none affected


##to keep batters 
SELECT * FROM thesisv1.salaries2024;
DELETE FROM thesisv1.salaries2024
WHERE IP > AB;

#drop the IP and AB columns after 
ALTER TABLE thesisv1.salaries2024
DROP COLUMN IP,
DROP COLUMN AB;
SELECT * FROM thesisv1.salaries2024;

#keep only the year in date 
UPDATE thesisv1.salaries2024
SET Date = SUBSTRING(Date, length(Date) - 3, 4)
WHERE Date LIKE '%/%/%';

#change the ones with 2023, because all of them were after the 2023 season and it would corrupt the final database where we are adding the salaries2023
UPDATE thesisv1.salaries2024
SET Date = REPLACE(Date, '2023', '2024')
WHERE Date LIKE '%2023%';

#change the To Team columns to abbreviations
UPDATE salaries2024 s
JOIN team_mapping m ON s.`To Team` = m.full_name
SET s.`To Team` = m.abbreviation;

ALTER TABLE thesisv1.salaries2024
CHANGE COLUMN `To Team` new_team TEXT,
CHANGE COLUMN `From Team` former_team TEXT,
CHANGE COLUMN `G` career_games TEXT;

SELECT * FROM thesisv1.salaries2024;

#if the player stayed on the same team
ALTER TABLE thesisv1.salaries2024
ADD stayed_same_team INT;

UPDATE thesisv1.salaries2024
SET stayed_same_team = CASE WHEN new_team = former_team THEN 1 ELSE 0 END;




