--QUESTION 1
--Count the customer base based on customer type to identify current customer preferences and 
--sort them in descending order.

--SELECT  C_TYPE AS Customer_Type, COUNT(C_ID) AS Customer_Count
--FROM Customer
--GROUP BY C_TYPE
--ORDER BY Customer_Count DESC;

--QUESTION 2
--Count the customer base based on their status of payment in descending order.

--SELECT Payment_Status, COUNT(DISTINCT Customer.C_ID) AS customer_base
--FROM Customer
--JOIN dbo.Payment_Details ON Customer.C_ID = Payment_Details.C_ID
--GROUP BY Payment_Status
--ORDER BY Payment_Status DESC;
--QUESTION 3
--Count the customer base based on their payment mode in descending order of count

--SELECT Payment_Mode, COUNT(DISTINCT Customer.C_ID) AS customer_base
--FROM Customer
--JOIN dbo.Payment_Details ON Customer.C_ID = Payment_Details.C_ID
--GROUP BY Payment_Mode
--ORDER BY Payment_Mode DESC;

--QUESTION 4
--Count the customers as per shipment domain in descending order

--SELECT SH_DOMAIN, COUNT(DISTINCT Customer.C_ID) AS customer_base
--FROM Customer
--JOIN dbo.Shipment_Details ON Customer.C_ID = Shipment_Details.C_ID
--GROUP BY SH_DOMAIN
--ORDER BY SH_DOMAIN DESC;

--QUESTION 5
--Count the customer according to service type in descending order of count.

--SELECT SER_TYPE, COUNT(Customer.C_ID) AS customer_base
--FROM Customer
--JOIN dbo.Shipment_Details ON Customer.C_ID = Shipment_Details.C_ID
--GROUP BY SER_TYPE
--ORDER BY SER_TYPE DESC;

--QUESTION 6
--Explore employee count based on the designation-wise count of employees' IDs in descending order

--SELECT E_DESIGNATION, COUNT(DISTINCT E_ID) AS employee_base
--FROM dbo.Employee_Details
--GROUP BY E_DESIGNATION
--ORDER BY employee_base DESC;

--QUESTION 7
 --Considering average payment amount based on customer type having payment mode as COD in 
--descending order

--SELECT AVG(AMOUNT) as Average_Amount, C_TYPE
--FROM  Customer
--JOIN dbo.Payment_Details ON Customer.C_ID= Payment_Details.C_ID
--WHERE Payment_Mode = 'COD'
--GROUP BY C_TYPE
--ORDER BY Average_Amount DESC

--Question 8
 --Finding C_ID, M_ID, and tenure for those customers whose membership is over 10 years

--SELECT C_ID,Customer.M_ID, DATEDIFF(YEAR, Start_date, GETDATE()) AS Tenure
--FROM Customer
--JOIN dbo.Membership ON Customer.M_ID= Membership.M_ID
--WHERE DATEDIFF(YEAR, Start_date, GETDATE()) > 10;

--question 9
--Calculate the average payment amount based on payment mode where the payment date is 
--not null

--SELECT AVG(AMOUNT) as Average_Amount, Payment_Mode
--FROM Payment_Details
--WHERE Payment_Date IS NOT NULL
--GROUP BY Payment_Mode

--question 10
-- Calculate the average shipment weight based on payment_status where shipment content 
--does not start with "H."
--SELECT AVG(SH_WEIGHT) as Average_Weight,Payment_Status
--FROM Shipment_Details
--JOIN Payment_Details ON Shipment_Details.SH_ID=Payment_Details.SH_ID
--WHERE SH_CONTENT NOT LIKE 'H%'
--GROUP BY Payment_Status

--QUESTION 11
--Retrieve the names and designations of all employees in the 'NY' E_Branch
--SELECT E_NAME, E_DESIGNATION
--FROM Employee_Details
--WHERE E_BRANCH = 'NY'

--QUESTION 12
 --Calculate the total number of customers in each C_TYPE (Wholesale, Retail, Internal Goods).
--SELECT COUNT(C_ID) as Total_Customers, C_TYPE
--FROM Customer
--GROUP BY C_TYPE

--QUESTION 13
 ----Find the membership start and end dates for customers with 'Paid' payment status.
 --SELECT Start_date, End_date
 --FROM Membership
 --JOIN Customer ON Membership.M_ID= Customer.M_ID
 --JOIN Payment_Details ON Customer.C_ID= Payment_Details.C_ID
 --WHERE Payment_Status ='Paid'
 
--QUESTION 14
--List the clients who have made 'Card Payment' and have a 'Regular' service type.
--SELECT Customer.C_ID, Payment_Mode, SER_TYPE
--FROM Customer
--JOIN Payment_Details ON Customer.C_ID=Payment_Details.C_ID
--JOIN Shipment_Details ON Customer.C_ID=Shipment_Details.C_ID
--WHERE Payment_Mode='Card Payment' AND SER_TYPE='Regular'

--QUESTION 15
--Calculate the average shipment weight for each shipment domain (International and 
--Domestic)
--SELECT AVG(SH_WEIGHT) as Average_Weight, SH_DOMAIN
--FROM Shipment_Details
--GROUP BY SH_DOMAIN

--QUESTION 16
--Identify the shipment with the highest charges and the corresponding client's name
--SELECT TOP 1 MAX(SH_CHARGES) as highest_charges, C_NAME
--FROM Shipment_Details
--JOIN Customer ON Shipment_Details.C_ID=Customer.C_ID
--GROUP BY C_NAME
--ORDER BY highest_charges DESC

--QUESTION 17
--Count the number of shipments with the 'Express' service type that are yet to be delivered 
--SELECT COUNT(Shipment_Details.SH_ID) as no_of_shipments, SER_TYPE, Current_Status
--FROM Shipment_Details
--JOIN Status ON Shipment_Details.SH_ID=Status.SH_ID
--WHERE SER_TYPE='Express' AND Current_Status='NOT DELIVERED'
--GROUP BY SER_TYPE, Current_Status

--QUESTION 18
--Find the membership start and end dates for customers whose 'Current Status' is 'Not 
--Delivered'

--SELECT Start_date, End_date,Customer.C_ID, Current_Status
--FROM Membership
--JOIN Customer ON Membership.M_ID=Customer.C_ID
--JOIN Shipment_Details ON Customer.C_ID=Shipment_Details.C_ID
--JOIN Status ON Shipment_Details.SH_ID=Status.SH_ID
--WHERE Current_Status='Not Delivered'

--QUESTION 19
--Identify the top 5 customers by total shipment weight.
--SELECT TOP 5 Customer.C_ID, C_NAME,SUM(SH_WEIGHT) AS total_sh_weight
--FROM Customer
--JOIN Shipment_Details ON Customer.C_ID=Shipment_Details.C_ID
--GROUP BY C_NAME, Customer.C_ID
--ORDER BY total_sh_weight DESC

--QUESTION 20
--Calculate the average delivery time for shipments based on service type (Express, Regular).
--SELECT AVG(Delivery_date) AS Avg_delivery, SER_TYPE
--FROM Status
--JOIN Shipment_Details ON Status.SH_ID=Shipment_Details.SH_ID
--GROUP BY SER_TYPE
--QUESTION 21
--Count the number of customers whose average payment amount exceeds $5000.
--SELECT COUNT(Payment_Details.C_ID)as no_of_customers, AVG(AMOUNT) AS avg_payment
--FROM Payment_Details
--JOIN Customer ON Payment_Details.C_ID=Customer.C_ID
--WHERE AMOUNT > 5000

--QUESTION 22
--List the customers whose total payment amount exceeds $5000 in 'COD' mode
--SELECT Payment_Details.C_ID, C_NAME, SUM(AMOUNT) as total_payment, Payment_Mode
--FROM Customer
--JOIN Payment_Details ON Customer.C_ID = Payment_Details.C_ID
--WHERE AMOUNT > 5000 AND Payment_Mode='COD'
--GROUP BY Payment_Details.C_ID, C_NAME, Payment_Mode

--QUESTION 23
--Explore employee count based on the designation-wise count of employees' IDs in descending 
--order
--Branch-wise count of employees for efficiency of deliveries in descending order
--SELECT E_BRANCH, COUNT(E_ID) AS Employee_Count
--FROM Employee_Details
--GROUP BY E_BRANCH
--ORDER BY Employee_Count DESC;