--Which sports were just played only once in the olympics?

SELECT * FROM olympics_history LIMIT 5;

WITH t1 AS
    (SELECT DISTINCT games, sport
    FROM olympics_history),
t2 AS
    (SELECT sport, COUNT(games) AS no_of_games
    FROM t1
    GROUP BY sport)
SELECT t2.*, t1.games
FROM t2
JOIN t1 ON t1.sport = t2.sport
WHERE t2.no_of_games = 1
ORDER BY t1.sport;