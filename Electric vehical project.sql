DROP TABLE EV ;


CREATE TABLE EV (

VIN	 VARCHAR (100),
County	TEXT,
City	TEXT,
state	TEXT,
Postal_Code	INT,
Model_Year	BIGINT,
Make	text,
Model	TEXT,
Electric_Vehicle_Type	VARCHAR(100),
Clean_Alternative_Fuel_Vehicle_Eligibility	VARCHAR(100),
Electric_Range	INT,
Legislative_District	INT,
DOL_Vehicle_ID	INT,
Vehicle_Location VARCHAR(100),
Electric_Utility	VARCHAR(100),
Census_Tract	BIGINT

);

select * from EV;


--1 Write a query to list all records where the Make is TESLA and the Model Year is greater than 2018.

SELECT MAKE,model_year FROM EV 
WHERE MODEL_YEAR > 2018 AND make = 'TESLA' ;

--2 Find the total number of electric vehicles registered in each County. Display County and the count.


SELECT DISTINCT COUNTY,COUNT(MAKE)AS REG
FROM EV
GROUP BY COUNTY;

--3 Calculate the average Electric Range for all Battery Electric Vehicles (BEV).

SELECT DISTINCT MAKE , AVG(Electric_Range)AS AVG_RANGE FROM EV
GROUP BY MAKE;


--4 Retrieve all vehicles where Clean Alternative Fuel Vehicle (CAFV) Eligibility is Not eligible due to low battery range.

select distinct model, model_year,Electric_Utility,Clean_Alternative_Fuel_Vehicle_Eligibility  from ev
where Clean_Alternative_Fuel_Vehicle_Eligibility ='Not eligible due to low battery range';



--5 Find the top 3 most common Model names in the dataset, ordered by frequency.


select distinct model from ev
limit 3  ;

--6 Show the number of vehicles grouped by Electric Utility. Include only utilities with more than 50 vehicles


SELECT Electric_Utility, 
count(*) as VehicalsCount
from ev
where Electric_Utility IS NOT NULL
GROUP BY Electric_Utility
HAVING COUNT(*) > 50
ORDER BY VehicalsCount  DESC ;

--7 Count how many vehicles were registered per Year. Order results by year ascending.

select model_year,
count(*) as Vehicals_reg_per_year
from EV
group by model_year
order by model_year ;

--Write a query to list all vehicles registered in Seattle with an Electric Range greater than 200.

select distinct model , Electric_Range from ev
where Electric_Range > 200;


--Find the maximum and minimum Electric Range among TESLA vehicles. Display Make, Model, and the range values.

select distinct model,
max(Electric_Range) as max_range,
Min(Electric_Range) as Min_range
from ev
where Electric_Range is not null
group by model;

--compleate
