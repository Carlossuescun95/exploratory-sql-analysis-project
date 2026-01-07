
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- regions parece tener un problema con los datos
SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
Select * From Observations LIMIT 10;


-- MISSION 2
SELECT DISTINCT region_id FROM observations;


-- MISSION 3
SELECT COUNT (DISTINCT species_id) FROM observations;


-- MISSION 4
SELECT * from observations 
WHERE region_id = 2;


-- MISSION 5
SELECT * from observations
where observation_date = '1998-08-08';


-- MISSION 6
SELECT region_id COUNT(* ) AS total_observations
FROM observations
GROUP BY region_id
ORDER BY total_observations DESC
LIMIT 1;


-- MISSION 7
SELECT species_id, COUNT(*) AS total_records
FROM observations
GROUP BY species_id
ORDER BY total_records DESC
LIMIT 5;


-- MISSION 8
SELECT species_id, COUNT(*) AS observation_count
FROM observations
GROUP BY species_id
HAVING observation_count < 5
ORDER BY observation_count ASC;


-- MISSION 9
SELECT observer, COUNT(*) AS total
FROM observations
GROUP BY observer
ORDER BY total DESC;


-- MISION 10
SELECT observations.id, regions.name AS region_name, observations.observation_date
FROM observations
JOIN regions ON observations.region_id = regions.id;


-- MISION 11
SELECT observations.id, species.scientific_name
FROM observations
JOIN species ON observations.species_id = species.id;


-- MISSION 12
SELECT regions.name AS region, species.scientific_name, COUNT(*) AS total
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY region, species.scientific_name
ORDER BY region, total DESC;