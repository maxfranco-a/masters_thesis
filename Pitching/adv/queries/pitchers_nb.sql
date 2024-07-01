SELECT * FROM thesisadvpitch.pitchers_nb;

SELECT year, COUNT(*) AS observation_count
FROM pitchers_nb
GROUP BY year
ORDER BY year;
