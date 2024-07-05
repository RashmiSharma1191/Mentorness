Select * from Hotel_Reservation

--1. What is the total number of reservations in the dataset?
SELECT COUNT(*) AS total_reservations
FROM hotel_reservation;

--2. Which meal plan is the most popular among guests? 
SELECT Top 1 type_of_meal_plan, COUNT(*) AS Popularmeal_count
FROM hotel_reservation GROUP BY type_of_meal_plan
ORDER BY Popularmeal_count DESC

--3. What is the average price per room for reservations involving children? 
SELECT AVG(avg_price_per_room) as Avg_roomprice FROM hotel_reservation
where no_of_children > 0

--4. How many reservations were made for the year 2018 (replace 20XX with the desired year)? 
SELECT COUNT(*) AS reservation_count
FROM hotel_reservation
WHERE YEAR(arrival_date) = 2018;

--5. What is the most commonly booked room type? 
SELECT TOP 1 room_type_reserved, COUNT(*) AS count
FROM hotel_reservation
GROUP BY room_type_reserved
ORDER BY count DESC;

--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
SELECT COUNT(*) AS weekend_reservations
FROM hotel_reservation
WHERE no_of_weekend_nights > 0;

--7. What is the highest and lowest lead time for reservations? 
SELECT MAX(lead_time) as Highest_leadtime, Min(lead_time) as Lowest_leadtime
from hotel_reservation

--8. What is the most common market segment type for reservations? 
SELECT TOP 1 market_segment_type, count(*) as Common_market
from hotel_reservation
group by market_segment_type
order by Common_market Desc;

--9. How many reservations have a booking status of "Confirmed"? 
SELECT COUNT(*) as booking_status
FROM hotel_reservation
WHERE booking_status = 'Not_Canceled'

--10. What is the total number of adults and children across all reservations? 
SELECT SUM(no_of_adults) as Total_adults, SUM(no_of_children) as Total_children 
FROM hotel_reservation

--11. What is the average number of weekend nights for reservations involving children? 
SELECT AVG(no_of_weekend_nights) as Avg_weekendnights 
FROM hotel_reservation
WHERE no_of_children > 0;

--12. How many reservations were made in each month of the year?
SELECT MONTH(arrival_date) AS month, COUNT(*) AS reservations_count
FROM hotel_reservation
GROUP BY MONTH(arrival_date)
ORDER BY month;

--13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
SELECT room_type_reserved,AVG(no_of_weekend_nights + no_of_week_nights) AS average_nights
FROM hotel_reservation
GROUP BY room_type_reserved;

--14. For reservations involving children, what is the most common room type, and what is the average
--price for that room type? 
Select  Top 1 room_type_reserved AS Most_common_room_type, Count(*) as cn, 
AVG(avg_price_per_room) AS average_price
from Hotel_Reservation
where no_of_children > 0 
group by room_type_reserved 
order by cn desc;

--15. Find the market segment type that generates the highest average price per room. 
SELECT Top 1  market_segment_type, Max(avg_price_per_room) AS highest_average
FROM Hotel_Reservation
GROUP BY market_segment_type
ORDER BY highest_average desc;