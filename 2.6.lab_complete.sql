USE sakila;
#------------------------1. In the table actor, which are the actors whose last names are not repeated?-------------------------------------#
SELECT last_name FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;
#------------------------------------2. Which last names appear more than once?---------------------------------------------------------#
SELECT last_name, COUNT(*) FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 1;
#------------------------3. Using the rental table, find out how many rentals were processed by each employee.--------------------------#
SELECT staff_id, COUNT(*) FROM sakila.rental
GROUP BY staff_id;
#------------------------4. Using the film table, find out how many films were released each year.-------------------------------------#
SELECT release_year, COUNT(*) FROM sakila.film
GROUP BY release_year;
#------------------------5. Using the film table, find out for each rating how many films were there.-------------------------------------#
SELECT rating, COUNT(*) FROM sakila.film
GROUP BY rating;
#-----------------6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places ------------#
SELECT rating, AVG(length) AS average FROM sakila.film
GROUP BY rating;
#------------------------------7. Which kind of movies (rating) have a mean duration of more than two hours?---------------------------------#
SELECT rating, AVG(length) AS average FROM sakila.film
GROUP BY rating
HAVING average>120;
#---------------------------8. Rank films by length (filter out the rows that have nulls or 0s in length column). ----------------------------#
SELECT title, length, 
RANK() OVER(ORDER BY length DESC) AS Ranking
FROM sakila.film
WHERE (length IS NOT NULL) AND (length <> 0); 