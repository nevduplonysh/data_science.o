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