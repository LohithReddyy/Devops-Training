CREATE DATABASE movie_boxoffice_analysis;

USE movie_boxoffice_analysis;

SHOW TABLES;

DESCRIBE movies;

SELECT *
FROM movies;

SELECT COUNT(*) AS total_movies
FROM movies;

SELECT
    MIN(CAST(`Year of Realease` AS UNSIGNED)) AS oldest_year,
    MAX(CAST(`Year of Realease` AS UNSIGNED)) AS latest_year
FROM movies
WHERE `Year of Realease` REGEXP '^[0-9]{4}$';


SELECT `Movie Title`, `Year of Realease`, `Movie Rating`
FROM movies
WHERE `Year of Realease` REGEXP '^[0-9]{4}$'
  AND CAST(`Year of Realease` AS UNSIGNED) > 2020
ORDER BY CAST(`Year of Realease` AS UNSIGNED) DESC;


SELECT `Movie Title`, `Movie Rating`, Genre
FROM movies
WHERE `Movie Rating` >= 8
ORDER BY `Movie Rating` DESC;


SELECT `Movie Title`, Duration
FROM movies
WHERE Duration > 150
ORDER BY Duration DESC;


SELECT
    `Movie Title`,
    `Worldwide LT Gross`,
    CAST(
        NULLIF(
            REPLACE(
                REPLACE(TRIM(`Worldwide LT Gross`), '$', ''),
                ',', ''
            ),
            ''
        ) AS DECIMAL(15,2)
    ) AS worldwide_gross_usd
FROM movies
WHERE `Worldwide LT Gross` IS NOT NULL
ORDER BY worldwide_gross_usd DESC;


SELECT
    `Movie Title`,
    `Year of Realease`,
    `Worldwide LT Gross`
FROM movies
WHERE `Worldwide LT Gross` IS NOT NULL
  AND TRIM(`Worldwide LT Gross`) <> ''
ORDER BY CAST(
    REPLACE(
        REPLACE(TRIM(`Worldwide LT Gross`), '$', ''),
        ',', ''
    ) AS DECIMAL(15,2)
) DESC
LIMIT 10;


SELECT
    ROUND(AVG(
        CAST(
            REPLACE(
                REPLACE(TRIM(`Worldwide LT Gross`), '$', ''),
                ',', ''
            ) AS DECIMAL(15,2)
        )
    ), 2) AS average_worldwide_gross_usd
FROM movies
WHERE `Worldwide LT Gross` REGEXP '^\\$?[0-9,]+(\\.[0-9]+)?$';