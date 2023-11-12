SELECT * FROM first_queries_lab.applestore LIMIT 0, 1000;
SHOW DATABASES;
USE first_queries_lab;
SHOW tables;
DESCRIBE applestore;
SELECT * FROM applestore;

-- Excerise 
-- 1. Which are the different genres?
SELECT DISTINCT prime_genre 
FROM applestore;

-- 2. Which is the genre with more apps rated?
SELECT prime_genre,rating_count_tot
FROM applestore
ORDER BY  rating_count_tot DESC;

-- 3 Which is the genre with more apps?
SELECT prime_genre, COUNT(DISTINCT track_name) AS track_genre_quantity
FROM applestore
GROUP BY prime_genre
ORDER BY track_genre_quantity DESC;

-- 4 Which is the one with less?
SELECT prime_genre, COUNT(DISTINCT track_name) AS track_genre_quantity
FROM applestore
GROUP BY prime_genre
ORDER BY track_genre_quantity ASC;

-- 5. Take the 10 apps most rated.
SELECT track_name, rating_count_tot
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT track_name, user_rating
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
-- The data depicts apps with a number of ratings each apps has received on 
-- the applestore regardless of the type of rating given. It simply doesnt take account 
-- the ratings value

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
-- These  data shows apps with high rating value regardless of the number of times 
-- it has been rated

-- 9.  Now compare the data from questions 5 and 6. What do you see?
-- In conclusion, while question 5 shows the total number of ratings, question 6 shows rating given by users to identify 
-- the apps that are highly rated in terms of  thier quality.

-- 10  How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT track_name, user_rating,rating_count_tot
FROM applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- 11 Do people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
# Checking for Free and Paid apps
SELECT price, COUNT(*) AS app_count
FROM applestore
GROUP BY price
ORDER BY price;

#CHECKING FOR THE MAX priced APP/genre
SELECT  prime_genre ,MAX(price) AS max_price
FROM applestore
GROUP BY prime_genre
ORDER BY max_price DESC;

# Checking the number of people who bought these apps
SELECT  prime_genre , AVG (price) AS avg_price, SUM(rating_count_tot) AS total_count
FROM applestore
GROUP BY prime_genre
ORDER BY total_count DESC,avg_price DESC;

-- In conclusion, people do not care about the price of the app.They buy it if its beneficial to them regardless of the price.


