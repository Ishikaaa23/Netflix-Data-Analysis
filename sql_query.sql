DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);

--Business Problems and Solutions
--1. Count the Number of Movies vs TV Shows
SELECT 
    type,
    COUNT(*)
FROM netflix
GROUP BY 1;

--2. Find the Most Common Rating for Movies and TV Shows
SELECT 
        type,
        rating
FROM
(
SELECT 
        type,
        rating,
        COUNT(*),
		RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
FROM netflix
GROUP BY 1,2) AS t1
WHERE ranking=1

--3.List all movies released in a specific year (e.g. 2020)
SELECT title FROM netflix
WHERE type='Movie' AND release_year=2020

--4. Find the top 5 countries with the most content on netflix
SELECT UNNEST(STRING_TO_ARRAY(country,',')) AS new_country,
COUNT(*) AS no_of_content FROM netflix
GROUP BY 1
ORDER BY no_of_content DESC LIMIT 5 

--5. Identify the longest movie
SELECT * FROM netflix
WHERE type='Movie'
      AND 
	  duration=(SELECT MAX(duration) FROM netflix)

--6. Find content added in the last 5 years
SELECT * FROM netflix
WHERE TO_Date(date_added,'Month DD,YYYY')>=CURRENT_DATE-INTERVAL '5 years'

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'
SELECT * FROM netflix 
WHERE director ILIKE '%Rajiv Chilaka%'

--8. List all TV shows with more than 5 seasons
SELECT * FROM netflix
WHERE type='TV Show'
AND SPLIT_PART(duration,' ',1)::numeric>5

--9. Count the number of content items in each genre
SELECT UNNEST(STRING_TO_ARRAY(listed_in,',')) AS genre,
COUNT(*) AS no_of_content FROM netflix
GROUP BY 1

--10. Find each year and the average numbers of content release by India on netflix.
--Return top 5 year with highest avg content release.
SELECT
	EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD,YYYY')) AS year,
	COUNT(*) AS yearly_content,
	COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country='India')::numeric * 100 as avg_content_per_year
FROM netflix
WHERE country='India'
GROUP BY 1

--11. List all the movies that are documentaries
SELECT * FROM netflix
WHERE listed_in ILIKE '%Documentaries%'

--12. Find all content without a director
SELECT * FROM netflix
WHERE director IS NULL

--13. Find how many movies actor 'Salman Khan' appeared in last 10 years
SELECT * FROM netflix
WHERE casts ILIKE '%salman khan%'
AND release_year>EXTRACT(YEAR FROM CURRENT_DATE)-10

--14. Find the top 10 actors who have appeared in the highest number of 
--movies produced in India.
SELECT UNNEST(STRING_TO_ARRAY(casts,',')) AS actors,
COUNT(*) AS total_content
FROM netflix
WHERE country='India'
GROUP BY 1
ORDER BY 2 DESC LIMIT 10

--15. Categorize the content based on the presence of the keywords 'kill' and
--'violence' in the description field. Label content containing these keywords as 
--'bad' and all other content as 'good'.Count how many items fall into each category.
WITH T1
AS (
SELECT *,
	CASE
	WHEN description ILIKE '%kill%' OR
	description ILIKE '%violence%' THEN 'bad'
	ELSE 'good'
	END category
FROM netflix)
SELECT
	category,
	COUNT(*) as total_count
FROM T1
GROUP BY category
)