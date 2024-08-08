/*Which nation has participated in all of the olympic games?*/

With tot_games AS
                (SELECT COUNT(DISTINCT games) AS total_games
                FROM olympics_history),
countries AS
              (SELECT games, nr.region AS country
              FROM olympics_history oh
              JOIN olympics_history_noc_regions nr 
              ON nr.noc=oh.noc
              GROUP BY games, nr.region),
countries_participated AS
              (SELECT country, count(1) AS total_participated_games
              FROM countries
              GROUP BY country)
      SELECT cp.*
      FROM countries_participated cp
      JOIN tot_games tg 
      ON tg.total_games = cp.total_participated_games
      ORDER BY 1;