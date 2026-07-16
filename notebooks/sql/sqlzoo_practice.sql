-- SELECT basics, Q1
SELECT population FROM world
WHERE name = 'Germany'

-- SELECT basics, Q2
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark')

-- SELECT basics, Q3
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000

--- 

-- SELECT from WORLD Tutoria, Q1
SELECT name, continent, population FROM world

-- SELECT from WORLD Tutoria, Q2
SELECT name FROM world 
WHERE population > 200000000

-- SELECT from WORLD Tutoria, Q3
SELECT name, gdp/population FROM world
WHERE population > 200000000

-- SELECT from WORLD Tutoria, Q4
SELECT name, population/1000000 FROM world 
WHERE continent = 'South America'

-- SELECT from WORLD Tutoria, Q5
SELECT name, population FROM world
WHERE name in ('France', 'Germany', 'Italy')

-- SELECT from WORLD Tutoria, Q6
SELECT name FROM world
WHERE name LIKE 'United%'

-- SELECT from WORLD Tutoria, Q7
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

-- SELECT from WORLD Tutoria, Q8
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000

-- SELECT from WORLD Tutoria, Q9
SELECT name, ROUND(population / 1000000, 2), ROUND(gdp / 1000000000, 2) FROM world
WHERE continent = 'South America'

-- SELECT from WORLD Tutoria, Q10
-- ROUND(num, -3) -> Round to the nearest 1000
SELECT name, ROUND(gdp / population, -3) FROM world  
WHERE gdp > 1E12 

-- SELECT from WORLD Tutoria, Q11
SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH(capital)

-- SELECT from WORLD Tutoria, Q12
SELECT name, capital FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital 

-- SELECT from WORLD Tutoria, Q13
SELECT name
FROM world
WHERE name LIKE '%a%' 
    AND name LIKE '%e%'
    AND name LIKE '%i%' 
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %' 

--- 

-- SELECT from Nobel Tutorial, Q1
SELECT yr, subject, winner FROM nobel
WHERE yr = 1950

-- SELECT from Nobel Tutorial, Q2
SELECT winner FROM nobel 
WHERE yr = 1962 AND subject = 'Literature'

-- SELECT from Nobel Tutorial, Q3
SELECT yr, subject FROM nobel
WHERE winner = 'Albert Einstein'

-- SELECT from Nobel Tutorial, Q4
SELECT winner FROM nobel
WHERE yr >= 2000 and subject = 'Peace'

-- SELECT from Nobel Tutorial, Q5
SELECT yr, subject, winner FROM nobel
WHERE 1980 <= yr AND yr <= 1989 AND subject = 'Literature'

-- SELECT from Nobel Tutorial, Q6
SELECT * FROM nobel
WHERE winner in ('Theodore Roosevelt',
                 'Thomas Woodrow Wilson',
                 'Jimmy Carter',
                 'Barack Obama')

-- SELECT from Nobel Tutorial, Q7
SELECT winner FROM nobel
WHERE winner LIKE 'John%'

-- SELECT from Nobel Tutorial, Q8
SELECT yr, subject, winner FROM nobel
WHERE (subject = 'physics' AND yr = 1980) OR
      (yr = 1984 AND subject = 'chemistry')

-- SELECT from Nobel Tutorial, Q9
SELECT yr, subject, winner FROM nobel
WHERE yr = 1980 and subject NOT IN ('chemistry', 'medicine')

-- SELECT from Nobel Tutorial, Q10
SELECT yr, subject, winner FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR
      (subject = 'Literature' AND yr >= 2004)

-- SELECT from Nobel Tutorial, Q11
SELECT yr, subject, winner FROM nobel
WHERE winner LIKE 'PETER GR%'

-- SELECT from Nobel Tutorial, Q12
SELECT yr, subject, winner FROM nobel 
WHERE winner LIKE "EUGENE O'NEILL "

-- SELECT from Nobel Tutorial, Q13
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner

-- SELECT from Nobel Tutorial, Q14
SELECT winner, subject FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('physics', 'chemistry'), 
         subject, winner

SELECT winner, subject FROM nobel
WHERE yr = 1984
ORDER BY 
    CASE WHEN subject IN ('physics', 'chemistry') THEN 1 ELSE 0 END, 
    subject, winner

---

-- SELECT within SELECT Tutorial, Q1
SELECT name FROM world
WHERE population > (SELECT population FROM world
                    WHERE name='RUSSIA')

-- SELECT within SELECT Tutorial, Q2
SELECT name FROM world
WHERE continent='Europe' AND 
      gdp/population > (SELECT gdp/population FROM world
                        WHERE name='United Kingdom')

-- SELECT within SELECT Tutorial, Q3
SELECT name, continent FROM world
WHERE continent in (SELECT continent FROM world 
       WHERE name in ('Argentina', 'Australia'))
ORDER BY name

-- SELECT within SELECT Tutorial, Q4
SELECT name, population FROM world
WHERE population > (SELECT population FROM world
                    WHERE name='United Kingdom') AND
      population < (SELECT population FROM world
                    WHERE name='Germany')

SELECT name, population FROM world
WHERE population BETWEEN
      (SELECT population FROM world WHERE name = 'United Kingdom') + 1 AND
      (SELECT population FROM world WHERE name = 'Germany') - 1

-- SELECT within SELECT Tutorial, Q5
SELECT name, 
    CONCAT(ROUND(population * 100 / 
    (SELECT population FROM world
     WHERE name='Germany')), '%') 
FROM world
WHERE continent='Europe'

WITH 
    pog AS (SELECT population FROM world WHERE name='Germany')
SELECT name, CONCAT(ROUND(100 * population / 
            (SELECT population FROM pog)), '%')
FROM world
WHERE continent='Europe'

-- SELECT within SELECT Tutorial, Q6
SELECT name FROM world
WHERE gdp > ALL (SELECT gdp FROM world
             WHERE continent='Europe' AND gdp > 0)
      
-- SELECT within SELECT Tutorial, Q7
SELECT continent, name, area FROM world AS x
WHERE area >= ALL
      (SELECT area FROM world AS y
       WHERE y.continent=x.continent
       AND area>0)

-- SELECT within SELECT Tutorial, Q8
SELECT continent, name FROM world AS x
WHERE name <= ALL 
        (SELECT name FROM world AS y
         WHERE x.continent = y.continent
         AND name IS NOT NULL)

-- SELECT within SELECT Tutorial, Q9
SELECT continent, name FROM world AS x
WHERE name <= ALL 
        (SELECT name FROM world AS y
         WHERE x.continent = y.continent
         AND name IS NOT NULL)

-- SELECT within SELECT Tutorial, Q10
SELECT name, continent FROM world AS x
WHERE population >= ALL (
    SELECT 3 * population FROM world AS y
    WHERE x.continent = y.continent 
    AND x.name != y.name
)