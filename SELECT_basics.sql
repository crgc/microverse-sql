-- 1
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

 -- 3
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

-- 6
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

-- 7
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')
