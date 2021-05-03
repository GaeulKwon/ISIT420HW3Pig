
A = LOAD 'ordersNoHeaders.csv' using PigStorage(',') AS (id:int, cdID:int, dayPurch:int, hourPurch:int, pricePaid:int, salesPersonID:int, storeID:int);

B = FILTER A BY dayPurch > 0;

C = FOREACH B GENERATE hourPurch, pricePaid;

D = GROUP C BY hourPurch;

--total sales by hours
E = FOREACH D GENERATE group AS hourPurch, SUM(C.(pricePaid)) AS hourlySales;

F = ORDER E BY hourlySales DESC;

DUMP F;

--STORE F into '/home/bcuser/pigstuff/pigjobs/HW3-orders/output-Goal2';






-- Below is my attemp to group every 6 hours into a shift such as midnightShift, morningShift, afternoonShift, eveningShift
-- but couldn't figure out how to add total sales of the 6 hour period.


--midnightShift = FILTER C BY hourPurch <= 5;

--morningShift = FILTER C BY hourPurch > 5 AND hourPurch <= 11;

--afternoonShift = FILTER C BY hourPurch > 11 AND hourPurch <= 17;

--eveningShift = FILTER C BY hourPurch > 17 AND hourPurch <= 23;


----count midnight sales
--midnightHours = GROUP midnight BY hourPurch;

--midnightCount = FOREACH midnightHours GENERATE group AS hourPurch, SUM(midnightShift.(pricePaid));

----count morning sales
--morningHours = GROUP morningShift BY hourPurch;

--morningCount = FOREACH morningHours GENERATE group AS hourPurch, SUM(morningShift.(pricePaid));

----count afternoon sales
--afternoonHours = GROUP afternoonShift BY hourPurch;

--afternoonCount = FOREACH afternoonHours GENERATE group AS hourPurch, SUM(afternoonShift.(pricePaid));

----count evening sales
--eveningHours = GROUP eveningShift BY hourPurch;

--eveningCount = FOREACH eveningHours GENERATE group AS hourPurch, SUM(eveningShift.(pricePaid));


--DUMP midnightCount;







