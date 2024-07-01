SELECT * FROM thesisv1.perf2024_3;

SELECT *
FROM perf2024_3
WHERE career_games < 162;
#there is 30 players with less than a full season of games 

SELECT *
FROM perf2024_3
WHERE career_games < 324;
#50 PLAYERS without two full seasons 

#free agent players without two full season of games usually represent minor league contracts.
#we are going to keep only those who stayed with the same team. its a good indication of how a team values low impact players 

DELETE FROM perf2024_3
WHERE career_games < 362 AND stayed_same_team = 0;



