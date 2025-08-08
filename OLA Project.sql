DROP TABLE IF exists booking;
CREATE TABLE booking(
 Date DATE,
 Time TIME,
 Booking_ID VARCHAR(50),
 Booking_Status VARCHAR(50),
 Customer_ID VARCHAR(50),
 Vehicle_Type VARCHAR(50),
 Pickup_Location VARCHAR(100),
 Drop_Location	VARCHAR(100),
 V_TAT FLOAT,
 C_TAT FLOAT,
 Canceled_Rides_by_Customer VARCHAR(100),
 Canceled_Rides_by_Driver VARCHAR(100),
 Incomplete_Rides VARCHAR(50),
 Incomplete_Rides_Reason VARCHAR(50),
 Booking_Value INT,
 Payment_Method	VARCHAR(50),
 Ride_Distance FLOAT,
 Driver_Ratings FLOAT,
 Customer_Rating FLOAT,
 "Vehicle Images" VARCHAR(250)
);
select * from booking


--1. Retrieve all successful bookings:
Create View Successful_Booking As
SELECT * FROM booking
WHERE booking_status = 'Success';


--2. Find the average ride distance for each vehicle type:

Create View ride_distance_for_each_vehicle As
SELECT vehicle_type , AVG(Ride_Distance)
as avg_distance FROM booking
Group BY vehicle_Type;


--3. Get the total number of canceled rides by customers:

Create View  canceled_rides_by_customers As
SELECT * FROM booking
WHERE booking_status = 'Canceled by Customer';
 

--4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
SELECT customer_id ,COUNT(booking_id) as total_rides
FROM booking
GROUP BY customer_id
ORDER BY total_rides DESC LIMIT 5;



--5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_Canceled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM booking
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';


--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view Max_Min_Deiver_Rating As
SELECT MAX(driver_ratings) as max_rating,
MIN(driver_ratings) as min_rating
FROM booking WHERE Vehicle_Type ='Prime Sedan';


--7. Retrieve all rides where payment was made using UPI:

Create View Payment_Method As
SELECT * FROM booking WHERE payment_method ='UPI';


--8. Find the average customer rating per vehicle type:

Create View AVG_CUST_RATING AS
SELECT vehicle_type , avg(customer_rating) as avg_customer_rating
FROM booking
GROUP BY vehicle_type;


 
--9. Calculate the total booking value of rides completed successfully:

create view total_successful_ride_value As
SELECT SUM(booking_value) AS total_successful_value
FROM booking
WHERE booking_status = 'Success';


--10. List all incomplete rides along with the reason:
create view Incomplete_rides_reason AS
SELECT booking_ID, Incomplete_rides_reason
FROM booking
WHERE Incomplete_Rides ='Yes';






------------------------------
1---Retrieve all successsful bookings;
select * from Successful_Booking;

2--Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;

3--Get the total number of canceled rides by customers:
Select * from canceled_rides_by_customers;

4--List the top 5 customers who booked the highest number of rides:
select * from Top_5_Customers;

5--Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from Rides_Canceled_by_Drivers_P_C_Issues;

6--Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from Max_Min_Deiver_Rating ;

--7. Retrieve all rides where payment was made using UPI:
Select * FROM Payment_Method;

8--Find the average customer rating per vehicle type:
SELECT * FROM AVG_CUST_RATING;

9--calculate the total booking value of rides completed successfully:
select * from total_successful_ride_value ;

10--List all incomplete rides along with the reason:
select * from Incomplete_rides_reason;

