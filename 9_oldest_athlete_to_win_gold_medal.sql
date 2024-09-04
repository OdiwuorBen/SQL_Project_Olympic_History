--Fetch oldest athletes to win a gold medal
SELECT * FROM olympics_history LIMIT 5;

 WITH temp AS
    (SELECT name,sex,CAST(CASE WHEN age = 'NA' THEN '0' ELSE age END as int) AS age
              ,team,games,city,sport, event, medal
    FROM olympics_history),
        ranking AS
            (SELECT *, rank() OVER(ORDER BY age DESC) AS rnk
            FROM temp
            WHERE medal='Gold')
    SELECT *
    FROM ranking
    WHERE rnk = 1;

