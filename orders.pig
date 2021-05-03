Aset = LOAD 'orders.csv' USING PigStorage(',') AS (id:int, cdName:int, dayPurch:int, hourPurch: int, pricePaid:int, salesPersonID: int, storeID: int);
Bset = FOREACH Aset GENERATE storeID, pricePaid;
Cset = GROUP Bset by storeID;
Dset = FOREACH Cset GENERATE group, SUM(Bset.pricePaid) as pricePaid;
Eset = ORDER Dset BY pricePaid DESC;
STORE Eset into '/home/bcuser/pigstuff/pigjobs/HW3/output';


