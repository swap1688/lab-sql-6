USE sakila;

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

# Add the new films to the database.
# I have used data_import_wizard to insert data into the new table.
SELECT *
FROM films_2020;

# Update information on rental_duration, rental_rate, and replacement_cost.	
UPDATE films_2020 t1
JOIN film t2 ON t2.film_id = t1.film_id
SET
t1.rental_duration = t2.rental_duration,
t1.rental_rate = t2.rental_rate,
t1.replacement_cost = t2.replacement_cost;

SELECT *
FROM films_2020;

