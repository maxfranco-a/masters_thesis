SELECT * FROM thesisv1.salaries2019;

## to check for hispanic names with an accent á é í ó ú 
SELECT *
FROM thesisv1.salaries2019
WHERE Name REGEXP '[áéíúÁÉÍÚ]'
LIMIT 0, 1000;

#replace the ones with á, é, í, ó, ú. 
#lowerletters
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'á', 'a') WHERE Name LIKE '%á%';
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'ó', 'o') WHERE Name LIKE '%ó%';
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'é', 'e') WHERE Name LIKE '%é%';
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'í', 'i') WHERE Name LIKE '%í%';
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'ú', 'u') WHERE Name LIKE '%ú%';
#replace the ones with
#capitalletters
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'Á', 'A') WHERE Name LIKE '%Á%'; 
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'Ó', 'O') WHERE Name LIKE '%Ó%'; 
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'É', 'E') WHERE Name LIKE '%É%'; 
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'Í', 'I') WHERE Name LIKE '%Í%';
UPDATE thesisv1.salaries2019 SET Name = REPLACE(Name, 'Ú', 'U') WHERE Name LIKE '%Ú%'; 


##to keep batters 
SELECT * FROM thesisv1.salaries2019;
DELETE FROM thesisv1.salaries2019
WHERE IP > AB;

#drop the IP and AB columns after 
ALTER TABLE thesisv1.salaries2019
DROP COLUMN IP,
DROP COLUMN AB;
SELECT * FROM thesisv1.salaries2019;

#change name Date? to Date 
ALTER TABLE salaries2019
CHANGE COLUMN `Date?` Date TEXT;


#keep only the year in date 
UPDATE thesisv1.salaries2019
SET Date = SUBSTRING(Date, length(Date) - 3, 4)
WHERE Date LIKE '%/%/%';

#change the ones with 2019, because all of them were after the 2019 season and it would corrupt the final database where we are adding the salaries2019
UPDATE thesisv1.salaries2019
SET Date = REPLACE(Date, '2018', '2019')
WHERE Date LIKE '%2018%';

#change the To Team columns to abbreviations
UPDATE salaries2019 s
JOIN team_mapping m ON s.`To Team` = m.full_name
SET s.`To Team` = m.abbreviation;

ALTER TABLE thesisv1.salaries2019
CHANGE COLUMN `To Team` new_team TEXT,
CHANGE COLUMN `From Team` former_team TEXT,
CHANGE COLUMN `G` career_games TEXT;

SELECT * FROM thesisv1.salaries2019;

#if the player stayed on the same team
ALTER TABLE thesisv1.salaries2019
ADD stayed_same_team INT;


UPDATE thesisv1.salaries2019
SET stayed_same_team = CASE WHEN new_team = former_team THEN 1 ELSE 0 END;