/*Mention the total No. of nations who participated in each olympic games.*/
With all_countries AS(
    SELECT  games,
            nr.region 
FROM olympics_history AS oh
JOIN olympics_history_noc_regions AS nr
ON nr.noc = oh.noc
GROUP BY games, nr.region
)
SELECT  games, 
        COUNT(games) AS total_countries
FROM all_countries
GROUP BY games
ORDER BY games;