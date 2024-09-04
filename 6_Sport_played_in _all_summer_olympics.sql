/*Identify the sport which was played in all summer olympics
steps:
1. Find total number of summer olympic games.
2. Find for each sport, how many games where they played in.
3. compare 1 & 2.*/

SELECT * FROM olympics_history LIMIT 5;

With t1 AS(
    SELECT COUNT(DISTINCT games) AS total_summer_games
    FROM olympics_history
    WHERE season = 'Summer'
),
t2 AS(
    SELECT DISTINCT sport, games
    FROM olympics_history
    WHERE season = 'Summer'
    ORDER BY games
),
t3 AS(
    SELECT sport, COUNT(games) AS no_of_games
    FROM t2
    GROUP BY sport
)
SELECT *
FROM t3
JOIN t1 ON t1.total_summer_games=t3.no_of_games;



