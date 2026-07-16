-- SELECT names, Q1
SELECT name FROM world 
WHERE name LIKE 'Y%'

-- SELECT names, Q2
SELECT name FROM world
WHERE name LIKE '%y'

-- SELECT names, Q3
SELECT name FROM world
WHERE name LIKE '%x%'

-- SELECT names, Q4
SELECT name FROM world
WHERE name LIKE '%land'

-- SELECT names, Q5
SELECT name FROM world
WHERE name LIKE 'C%ia'

-- SELECT names, Q6
SELECT name FROM world
WHERE name LIKE '%oo%'

-- SELECT names, Q7
SELECT name FROM world
WHERE name LIKE "%a%a%a%"

-- SELECT names, Q8
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

-- SELECT names, Q9
SELECT name FROM world
WHERE name LIKE '%o__o%'

-- SELECT names, Q10
SELECT name FROM world
WHERE name LIKE '____'

SELECT name FROM world
WHERE LENGTH(name) = 4 -- bytes

-- SELECT names, Q11
SELECT name from world
WHERE name LIKE capital

-- SELECT names, Q12
SELECT name FROM world
WHERE capital LIKE concat(name, ' City') 

-- SELECT names, Q13
SELECT capital, name FROM world
WHERE capital LIKE concat('%', name, '%')

-- SELECT names, Q14
SELECT capital, name FROM world
WHERE capital LIKE concat('%', name, '%') 
    AND capital != name 

-- SELECT names, Q15
SELECT name, REPLACE(capital, name, '') FROM world
WHERE capital LIKE concat(name, '_%')