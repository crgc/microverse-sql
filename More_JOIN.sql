-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2
SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane'

-- 3
SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star Trek%'

-- 4
SELECT id
 FROM actor
 WHERE name = 'Glenn Close'

-- 5
SELECT id
 FROM movie
 WHERE title = 'Casablanca'

-- 6
SELECT name
FROM actor JOIN casting ON (id = actorid)
WHERE movieid = 27

-- 7
SELECT name
FROM actor JOIN casting ON (id = actorid)
WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien')

-- 8
SELECT title
FROM movie JOIN casting ON (id = movieid)
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

-- 9
SELECT title
FROM movie JOIN casting ON (id = movieid)
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord != 1

-- 10
SELECT title, name AS actor
FROM actor JOIN casting ON (id = actorid)
           JOIN movie   ON (movie.id = movieid)
WHERE yr = 1962 AND ord = 1
GROUP BY title, name

-- 11
SELECT yr, COUNT(title) AS movies
FROM movie JOIN casting ON (movie.id = movieid)
           JOIN actor   ON (actor.id = actorid)
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1

-- 12
SELECT title AS movie, name AS leading_actor
FROM movie JOIN casting ON (movie.id = movieid)
           JOIN actor   ON (actor.id = actorid)
WHERE title IN (SELECT title FROM movie JOIN casting ON (movie.id = movieid)
                                       JOIN actor    ON (actor.id = actorid) WHERE name = 'Julie Andrews') AND
      movie.id IN (SELECT movie.id FROM movie JOIN casting ON (movie.id = movieid)
                                             JOIN actor    ON (actor.id = actorid) WHERE name = 'Julie Andrews') AND
      ord = 1                                        
ORDER BY name

-- 13
SELECT name AS actor
FROM actor JOIN casting ON (actor.id = actorid)
           JOIN movie   ON (movie.id = movieid)
WHERE actor.id = actorid AND ord = 1
GROUP BY name
HAVING count(*) >= 15

-- 14
SELECT title AS movie, COUNT(actorid) AS actors
FROM movie JOIN casting ON (movie.id = movieid)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

-- 15
SELECT name AS actor
FROM actor JOIN casting ON (actor.id = actorid)
           JOIN movie   ON (movie.id = movieid)
WHERE name != 'Art Garfunkel' AND
      movieid IN (SELECT movieid FROM actor JOIN casting ON (actor.id = actorid)
                                              JOIN movie ON (movie.id = movieid) WHERE name = 'Art Garfunkel')