/*Which year saw the highest and lowest number of countries participating in the olympics*/
With all_countries AS(
    SELECT  games,
            nr.region 
FROM olympics_history AS oh
JOIN olympics_history_noc_regions AS nr
ON nr.noc = oh.noc
GROUP BY games, nr.region
),
tot_countries AS(
SELECT  games, 
        COUNT(games) AS total_countries
FROM all_countries
GROUP BY games
ORDER BY games)
select distinct
      concat(first_value(games) over(order by total_countries)
      , ' - '
      , first_value(total_countries) over(order by total_countries)) as Lowest_Countries,
      concat(first_value(games) over(order by total_countries desc)
      , ' - '
      , first_value(total_countries) over(order by total_countries desc)) as Highest_Countries
      from tot_countries
      order by 1;



