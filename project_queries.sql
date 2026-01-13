# Run SQL command to see the structure of table
select * From users_data;

# Run SQL command to select first 100 rows of the database
SELECT * FROM users_data LIMIT 100;

## How many distinct values exist in table for field country and language.
SELECT DISTINCT country,language FROM users_data;

## Check whether male users are having maximum followers or female users.
SELECT gender,SUM(followers) total_followers FROM users_data
GROUP BY gender
ORDER BY total_followers DESC;

# Calculate the total users those
# Uses Profile Picture in their Profile
# Uses Application for Ecommerce platform
# Uses Android app
# Uses ios app

SELECT platform, COUNT(*) AS total_count FROM users_data
WHERE uses_profile_picture = 1
AND application = "Ecommerce"
AND platform IN ("Android", "iOS")
GROUP BY platform;

## Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers. 
## (Hint: consider only those users having at least 1 product bought.)
SELECT country,COUNT(*) AS Total_number_of_buyer 
FROM users_data
WHERE products_bought>0
GROUP BY country
ORDER BY Total_number_of_buyer DESC;

# Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers.
#  (Hint: consider only those users having at least 1 product sold.)
SELECT country,COUNT(*) AS total_seller
FROM users_data
WHERE products_sold > 0
GROUP BY country
ORDER BY total_seller

## Display name of top 10 countries having maximum products pass rate.
SELECT country, MAX(products_pass_rate) AS max_pass_rate FROM users_data 
GROUP BY country
ORDER BY max_pass_rate DESC
LIMIT 10;

## Calculate the number of users on an ecommerce platform for different language choices.
SELECT DISTINCT language, COUNT(*) AS total_count
FROM users_data
GROUP BY language

## Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform. (Hint: use UNION to answer this question.)
SELECT 
    'Wishlist' AS choice_type,
    COUNT(*) AS total_users
FROM users_data
WHERE gender = 'Female'
  AND application = 'Ecommerce'
  AND wishlist = 1

UNION

SELECT 
    'Social Like' AS choice_type,
    COUNT(*) AS total_users
FROM users_data
WHERE gender = 'Female'
  AND application = 'Ecommerce'
  AND social_like = 1;
  
## Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)
SELECT 'products_bought' AS buyer,
COUNT(*) AS total_buyer
FROM users_data
WHERE gender = "Male"
AND products_bought > 0
UNION
SELECT 
"products_sold" AS seller,
COUNT(*) AS total_seller
FROM users_data
WHERE gender = "Male"
AND products_sold > 0;

## Which country is having maximum number of buyers?
SELECT country,COUNT(*) AS total_BUYER
FROM users_data
WHERE products_bought > 0
GROUP BY country
ORDER BY total_BUYER DESC;

## Calculate the number of female users those who have not logged in since last 100 days
SELECT COUNT(*) AS num_of_females
FROM users_data
WHERE gender = "Female"
AND last_login_days > 100

## Display the number of female users of each country at ecommerce platform.
SELECT country, COUNT(*) AS num_of_females from users_data
WHERE gender = "Female"
GROUP BY country

-- Display the number of male users of each country at ecommerce platform.
SELECT country, COUNT(*) AS num_of_females from users_data
WHERE gender = "Male"
GROUP BY country

## Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
SELECT country, AVG(products_bought),AVG(products_sold) FROM users_data
WHERE gender = "Male"
GROUP BY country
