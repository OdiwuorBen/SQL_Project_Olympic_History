--Find the ratio of male and female athletes participated in all olympic games.

WITH t1 as
        	(SELECT sex, count(1) AS cnt
        	FROM olympics_history
        	GROUP BY sex),
    t2 AS
        	(SELECT *, row_number() OVER(ORDER BY cnt) AS rn
        	 FROM t1),
        min_cnt AS
        	(SELECT cnt FROM t2	WHERE rn = 1),
        max_cnt as
        	(SELECT cnt FROM t2	WHERE rn = 2)
    SELECT concat('1 : ', round(max_cnt.cnt::decimal/min_cnt.cnt, 2)) AS ratio
    FROM min_cnt, max_cnt;