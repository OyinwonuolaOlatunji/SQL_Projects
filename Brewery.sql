-- profit worth of the breweries within last 3 years, inclusive of the anglophone and
--the francophone territories--
 
SELECT sum(profit), year 
FROM breweries
GROUP BY year 
ORDER BY sum(profit);


--Compare the total profit between these two territories in order for the territory manager,
--Mr. Stone made a strategic decision that will aid profit maximization in 2020.--

SELECT distinct countries
FROM breweries;

SELECT sum(profit) AS total_profit_ang
FROM breweries
WHERE countries IN ('Nigeria' , 'Ghana');

SELECT sum(profit) AS total_profit_franc
FROM breweries
WHERE countries IN ('Senegal', 'Benin', 'Togo');

--Country that generated the highest profit in 2019--

SELECT profit , countries
FROM breweries
WHERE year = '2019' 
ORDER BY profit desc
LIMIT 2;


-- Year with the highest profit.--

SELECT sum(profit), year
FROM breweries
GROUP BY year
ORDER BY sum(profit) desc
LIMIT 1 ; 


--What was the minimum profit in the month of December 2018?--

SELECT profit , countries,brands
FROM breweries
WHERE months = 'December' and year = '2018' 
ORDER BY profit asc
LIMIT 1 ;


-- Within the last two years, the brand manager wants to know 
--the top three brands consumed in the francophone countries

SELECT brands ,sum(quantity) AS quantity_consumed , sum(profit) AS profit_sum
FROM breweries
WHERE countries IN ('Senegal', 'Benin', 'Togo') and year IN ('2018' , '2019')
GROUP BY brands
ORDER BY sum(profit) desc
LIMIT 3 ;


--Find out the top two choice of consumer brands in Ghana--

SELECT brands, sum(profit)
FROM breweries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY sum(profit) desc
LIMIT 2 ;

-- Favorites malt brand in Anglophone region between 2018 and 2019 --

SELECT brands, sum(quantity) AS best_selling , sum(profit) AS profit
FROM breweries
WHERE countries IN ('Ghana','Nigeria') AND year IN('2018','2019') AND brands IN ('beta malt','grand malt')
GROUP BY brands
ORDER BY sum(quantity);


--Which brands sold the highest in 2019 in Nigeria

SELECT brands, sum(quantity) AS best_selling
FROM breweries 
WHERE countries = 'Nigeria'
GROUP BY brands
ORDER BY sum(quantity) DESC ;

--Beer consumption in Nigeria

SELECT brands, sum(quantity) AS best_selling
FROM breweries 
WHERE countries = 'Nigeria' AND brands NOT IN ('beta malt', 'grand malt')
GROUP BY brands
ORDER BY sum(quantity) DESC ;

--Country with the highest consumption of beer.

SELECT countries ,sum(quantity) AS best_selling
FROM breweries 
WHERE brands NOT IN ('beta malt', 'grand malt')
GROUP BY countries
ORDER BY sum(quantity) DESC ;


--Country with the highest consumption of malt.

SELECT countries ,sum(quantity) AS best_selling
FROM breweries 
WHERE brands IN ('beta malt', 'grand malt')
GROUP BY countries
ORDER BY sum(quantity) DESC ;


