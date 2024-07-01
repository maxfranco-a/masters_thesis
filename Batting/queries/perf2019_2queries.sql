SELECT * FROM thesisv1.perf2019_2;

DELETE FROM perf2019_2
WHERE career_games IS NULL OR career_games = '';

SELECT *
FROM perf2019_2
WHERE career_games < 162;
#there is 44 players with less than a full season of games 

SELECT *
FROM perf2019_2
WHERE career_games < 324;
#66 PLAYERS without two full seasons 

#free agent players without two full season of games usually represent minor league contracts.
#we are going to keep only those who stayed with the same team. its a good indication of how a team values low impact players 

DELETE FROM perf2019_2
WHERE career_games < 324 AND stayed_same_team = 0; #59