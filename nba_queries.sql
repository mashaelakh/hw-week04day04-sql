--------------------------------------------
-- Part 3 - Basic SQL Queries
-- write queries to select the following
--------------------------------------------
\c nba_db
-- All columns for all players from the New York Knicks (NYK).
SELECT * FROM players WHERE Team = 'NYK';


-- All columns for all players from the Indiana Packers (IND) who are under 26
-- years old.
SELECT * FROM players WHERE Team = 'IND' and Age < 26 ;



-- All columns for all players, ordered from least points scored to most points
-- scored.


SELECT * FROM players ORDER BY points ASC;


-- Name and Points per game (points/games), for the players with the top 20 points
-- per game.
select name, points/games AS NEW from players ORDER BY NEW DESC LIMIT 20;


-- The average age for all players.

SELECT AVG(age) FROM players;

-- The average age for all players on the Oklahoma City Thunder (OKC).

SELECT AVG(age) from players where team ='OKC';

-- The average age for all players who played more than 40 games.
SELECT AVG(age) from players where games > 40;



--------------------------------------------
-- BONUS - Advanced SQL Queries
-- write queries to select the following
--------------------------------------------

-- The team and total points scored from all players on that team (team points)
-- ordered from most team points to least.

 SELECT team, SUM (Points) FROM players GROUP BY Team;

-- The age and the average points per game for that age, ordered from oldest to
-- youngest for all ages.

SELECT Age, AVG(points/games) FROM players GROUP BY Age ORDER BY Age DESC;


-- The team and the the number of players who score above 12 points per game on
-- that team, ordered from the most number of players to the least number of players.

SELECT team, COUNT(name) as NumberOfPlayers FROM players WHERE (points/games)>12 group by team ORDER BY NumberOfPlayers DESC;