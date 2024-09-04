--Fetch the total number of sports played in each olympic game.

SELECT * FROM olympics_history LIMIT 5;

SELECT DISTINCT games, COUNT(DISTINCT sport) AS No_of_Sports
FROM olympics_history
GROUP BY games
ORDER BY No_of_Sports DESC;

-- OR

WITH t1 AS
    (SELECT DISTINCT games, sport
    FROM olympics_history),
t2 AS
    (SELECT games, COUNT(sport) AS no_of_sports
    FROM t1
    GROUP BY games)
SELECT * 
FROM t2
ORDER BY no_of_sports DESC;