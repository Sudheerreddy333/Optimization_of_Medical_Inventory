CREATE DATABASE Medical_Inventory;
SELECT * FROM `medical inventory optimaization dataset`;

# FIRST MOMENT BUSINESS/MEASURES OF CENTRAL TENDENCY
# MEAN
SELECT AVG(Quantity) FROM `medical inventory optimaization dataset`; 
# MEAN = 2.2317
SELECT AVG(ReturnQuantity) FROM `medical inventory optimaization dataset`;
# MEAN = 0.2920
SELECT AVG(Final_Cost) FROM `medical inventory optimaization dataset`;
# MEAN = 124.8239
SELECT AVG(Final_Sales) FROM `medical inventory optimaization dataset`;
# MEAN = 234.038
SELECT AVG(RtnMRP) FROM `medical inventory optimaization dataset`;
# MEAN = 29.1326

# MEDIAN 
SELECT Quantity AS Median_Quantity
FROM (
SELECT Quantity, ROW_NUMBER() OVER (ORDER BY Quantity) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2;
# MEDIAN = 1

SELECT ReturnQuantity AS Median_ReturnQuantity
FROM (
SELECT ReturnQuantity, ROW_NUMBER() OVER (ORDER BY ReturnQuantity) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2;   
# MEDIAN=0

SELECT Final_Cost AS Median_Final_Cost
FROM (
SELECT Final_Cost, ROW_NUMBER() OVER (ORDER BY Final_Cost) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2;   
# MEDIAN = 53.65

SELECT Final_Sales AS Median_Final_Sales
FROM (
SELECT Final_Sales, ROW_NUMBER() OVER (ORDER BY Final_Sales) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2; 
  
# MEDIAN = 86.424

SELECT RtnMRP AS Median_RtnMRP
FROM (
SELECT RtnMRP, ROW_NUMBER() OVER (ORDER BY RtnMRP) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2; 

# MEDIAN = 0

# MODE 
SELECT Quantity AS mode_Quantity
FROM (
SELECT Quantity, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY Quantity
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 1

SELECT ReturnQuantity AS mode_ReturnQuantity
FROM (
SELECT ReturnQuantity, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY ReturnQuantity
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 0

SELECT Final_Cost AS mode_Final_Cost
FROM (
SELECT Final_Cost, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY Final_Cost
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 49.352

SELECT Final_Sales AS mode_Final_Sales
FROM (
SELECT Final_Sales, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY Final_Sales
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 0

SELECT RtnMRP AS mode_RtnMRP
FROM (
SELECT RtnMRP, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY RtnMRP
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 0

# SECOND MOMENT BUSINESS DECISION/MEASURES OF DISPERSION
# VARIANCE
SELECT VARIANCE(Quantity) AS
 performance_variance FROM `medical inventory optimaization dataset`;

# variance = 26.336009898199013

SELECT VARIANCE(Final_Cost) AS
 performance_variance FROM `medical inventory optimaization dataset`;

# variance = 216007.85176272027

SELECT VARIANCE(Final_Sales) AS
 performance_variance FROM `medical inventory optimaization dataset`;

# variance = 450560.40600030497

# STANDARD DEVIATION
SELECT STDDEV(Quantity) AS Quantity_std_dev FROM `medical inventory optimaization dataset`;
# standard deviation = 5.131862225177037
SELECT STDDEV(Final_Cost) AS Quantity_std_dev FROM `medical inventory optimaization dataset`;
# standard deviation = 464.7664486198635
SELECT STDDEV(Final_Sales) AS Quantity_std_dev FROM `medical inventory optimaization dataset`;
# standard deviation = 671.2379652554711

# RANGE
SELECT MAX(Quantity) - MIN(Quantity) AS quantity_range
FROM `medical inventory optimaization dataset`;
# range = 150
SELECT MAX(ReturnQuantity) - MIN(ReturnQuantity) AS rtnquantity_range
FROM `medical inventory optimaization dataset`;
 # range = 50
 SELECT MAX(Final_Cost) - MIN(Final_Cost) AS FC_range
FROM `medical inventory optimaization dataset`;
# range = 33138
SELECT MAX(Final_Sales) - MIN(Final_Sales) AS FS_range
FROM `medical inventory optimaization dataset`;
# range = 39490

# THIRD MOMENT BUSINESS DECISION / SKEWNESS 
SELECT
(
SUM(POWER(Quantity- (SELECT AVG(Quantity) FROM `medical inventory optimaization dataset`), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(Quantity) FROM `medical inventory optimaization dataset`), 3))
) AS skewness
FROM `medical inventory optimaization dataset`;
# SKEW = 11.33983776227517

SELECT
(
SUM(POWER(Final_Cost- (SELECT AVG(Final_Cost) FROM `medical inventory optimaization dataset`), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(Final_Cost) FROM `medical inventory optimaization dataset`), 3))
) AS skewness
FROM `medical inventory optimaization dataset`;
# SKEW = 34.50457377665059

SELECT
(
SUM(POWER(Final_Sales- (SELECT AVG(Final_Sales) FROM `medical inventory optimaization dataset`), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(Final_Sales) FROM `medical inventory optimaization dataset`), 3))
) AS skewness
FROM `medical inventory optimaization dataset`;
# SKEW = 21.004505306802322

SELECT
(
SUM(POWER(RtnMRP- (SELECT AVG(RtnMRP) FROM `medical inventory optimaization dataset`), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(RtnMRP) FROM `medical inventory optimaization dataset`), 3))
) AS skewness
FROM `medical inventory optimaization dataset`;
# SKEW = 15.795586714130604

# FOURTH MOMENT BUSINESS DECISION/ KURTOSIS
SELECT
(
(SUM(POWER(Quantity- (SELECT AVG(Quantity) FROM `medical inventory optimaization dataset`), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(Quantity) FROM `medical inventory optimaization dataset`), 4))) - 3
) AS kurtosis
FROM `medical inventory optimaization dataset`;
# KURT = 180.09008849581457

SELECT
(
(SUM(POWER(Final_Cost- (SELECT AVG(Final_Cost) FROM `medical inventory optimaization dataset`), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(Final_Cost) FROM `medical inventory optimaization dataset`), 4))) - 3
) AS kurtosis
FROM `medical inventory optimaization dataset`;
# KURT = 2025.1536932546835

SELECT
(
(SUM(POWER(Final_Sales- (SELECT AVG(Final_Sales) FROM `medical inventory optimaization dataset`), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(Final_Sales) FROM `medical inventory optimaization dataset`), 4))) - 3
) AS kurtosis
FROM `medical inventory optimaization dataset`;
# KURT = 948.1887579527508

SELECT
(
(SUM(POWER(RtnMRP- (SELECT AVG(RtnMRP) FROM `medical inventory optimaization dataset`), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(RtnMRP) FROM `medical inventory optimaization dataset`), 4))) - 3
) AS kurtosis
FROM `medical inventory optimaization dataset`;
# KURT = 403.36145455377124


###### TYPECASTING ######
SELECT CAST(Patient_ID AS CHAR) AS Patient_ID_str
FROM `medical inventory optimaization dataset`;
ALTER TABLE `medical inventory optimaization dataset`
MODIFY COLUMN Patient_ID VARCHAR(50);
DESCRIBE `medical inventory optimaization dataset`;
# CHANGE THE DATATYPE OF Patient_ID from bigint TO VARCHAR(50)

# FIND THE NULL VALUES IN DATASET
SELECT
COUNT(*) AS total_rows,
SUM(CASE WHEN Typeofsales IS NULL THEN 1 ELSE 0 END) AS Typeofsales_missing,
SUM(CASE WHEN Patient_ID IS NULL THEN 1 ELSE 0 END) AS Patient_ID_missing,
SUM(CASE WHEN Specialisation IS NULL THEN 1 ELSE 0 END) AS Specialisation_missing,
SUM(CASE WHEN Dept IS NULL THEN 1 ELSE 0 END) AS Dept_missing,
SUM(CASE WHEN Dateofbill IS NULL THEN 1 ELSE 0 END) AS Dateofbill_missing,
SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Quantity_missing,
SUM(CASE WHEN ReturnQuantity IS NULL THEN 1 ELSE 0 END) AS ReturnQuantity_missing,
SUM(CASE WHEN Final_Cost IS NULL THEN 1 ELSE 0 END) AS Final_Cost_missing,
SUM(CASE WHEN Final_Sales IS NULL THEN 1 ELSE 0 END) AS Final_Sales_missing,
SUM(CASE WHEN RtnMRP IS NULL THEN 1 ELSE 0 END) AS RtnMRP_missing,
SUM(CASE WHEN Formulation IS NULL THEN 1 ELSE 0 END) AS Formulation_missing,
SUM(CASE WHEN DrugName IS NULL THEN 1 ELSE 0 END) AS DrugName_missing,
SUM(CASE WHEN SubCat IS NULL THEN 1 ELSE 0 END) AS SubCat_missing,
SUM(CASE WHEN SubCat1 IS NULL THEN 1 ELSE 0 END) AS SubCat1_missing
FROM `medical inventory optimaization dataset`;

# This query gives the count of duplicates
 # HANDLING DUPLICATES 
# COUNT DUPLICATES
SELECT Typeofsales,Patient_ID,Specialisation,Dept,Dateofbill,Quantity,
ReturnQuantity,Final_Cost,Final_Sales,RtnMRP,Formulation,DrugName,
SubCat,SubCat1,COUNT(*) as duplicate_count
FROM `medical inventory optimaization dataset`
GROUP BY Typeofsales,Patient_ID,Specialisation,Dept,Dateofbill,Quantity,
ReturnQuantity,Final_Cost,Final_Sales,RtnMRP,Formulation,DrugName,
SubCat, SubCat1
HAVING COUNT(*) > 1;

# NO.0F DUPLICATES = 26

# REMOVING DUPLICATES
SELECT Typeofsales,Patient_ID,Specialisation,Dept,Dateofbill,Quantity,
ReturnQuantity,Final_Cost,Final_Sales,RtnMRP,Formulation,DrugName,
SubCat,SubCat1,min(Typeofsales)
FROM `medical inventory optimaization dataset`
GROUP BY Typeofsales,Patient_ID,Specialisation,Dept,Dateofbill,Quantity,
ReturnQuantity,Final_Cost,Final_Sales,RtnMRP,Formulation,DrugName,
SubCat, SubCat1;

# CREATE NEW TABLE AFTER REMOVING DUPLICATES
CREATE TABLE medical_analysis_new as 
SELECT DISTINCT * FROM `medical inventory optimaization dataset`;
SELECT * FROM medical_analysis_new;
TRUNCATE TABLE `medical inventory optimaization dataset`;
INSERT INTO `medical inventory optimaization dataset`
SELECT * FROM medical_analysis_new;
SELECT * FROM `medical inventory optimaization dataset`;
DROP TABLE medical_analysis_new;

-- FIND THE OUTLIERS IN THE DATASET 
UPDATE `medical inventory optimaization dataset` AS e
JOIN (
  SELECT 
    Quantity,
    ReturnQuantity,
    Final_Cost,
    Final_Sales,
    RtnMRP,
    NTILE(4) OVER (ORDER BY Final_Sales) AS Final_Sales_quartile
  FROM `medical inventory optimaization dataset`
) AS subquery ON e.Quantity = subquery.Quantity
SET e.Final_Sales = (
  SELECT AVG(Final_Sales)
  FROM (
    SELECT
      Quantity,
      ReturnQuantity,
      Final_Cost,
      Final_Sales,
      RtnMRP,
      NTILE(4) OVER (ORDER BY Final_Sales) AS Final_Sales_quartile
    FROM `medical inventory optimaization dataset`
  ) AS temp
  WHERE temp.Final_Sales_quartile = subquery.Final_Sales_quartile
)
WHERE subquery.Final_Sales_quartile IN (1, 4);
# 7200 ROWS ARE AFFECTED & 14218 REMAIN UNCHANGES MEAN OULIERS 

#### ZERO & NEAR ZERO VARIANCE FEATURE ####
SELECT
  VARIANCE(Quantity) AS Quantity_variance,
  VARIANCE(ReturnQuantity) AS ReturnQuantity_variance,
  VARIANCE(Final_Cost) AS Final_Cost_variance,
  VARIANCE(Final_Sales) AS Final_Sales_variance,
  VARIANCE(RtnMRP) AS RtnMRP_variance
FROM `medical inventory optimaization dataset`
HAVING Quantity_variance <= 0.01
   AND ReturnQuantity_variance <= 0.01
   AND Final_Cost_variance <= 0.01 
   AND Final_Sales_variance <= 0.01
   AND RtnMRP_variance <= 0.01;
# there is no zero and near zero variance 
# the variance of the above used columns variance is high 

USE medical_inventory;

# PERFORM THE EDA AFTER DATA CLEANING 
# FIRST MOMENT BUSINESS DECISION / MEASURE OF CENTRAL TRENDENCY
################# MEAN ###################
SELECT AVG(Quantity) FROM `medical inventory optimaization dataset`;
### MEAN = 2.2339
SELECT AVG(ReturnQuantity) FROM `medical inventory optimaization dataset`;
### MEAN = 0.2921
SELECT AVG(Final_Cost) FROM `medical inventory optimaization dataset`;
### MEAN = 124.66426578353834
SELECT AVG(Final_Sales) FROM `medical inventory optimaization dataset`;
### MEAN = 233.73660625704352
SELECT AVG(RtnMRP) FROM `medical inventory optimaization dataset`;
### MEAN = 29.1606

############### MEDIAN ###################
SELECT Quantity AS Median_Quantity
FROM (
SELECT Quantity, ROW_NUMBER() OVER (ORDER BY Quantity) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2;
### MEDIAN = 1

SELECT ReturnQuantity AS Median_ReturnQuantity
FROM (
SELECT ReturnQuantity, ROW_NUMBER() OVER (ORDER BY ReturnQuantity) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2;   
### MEDIAN = 0

SELECT Final_Cost AS Median_Final_Cost
FROM (
SELECT Final_Cost, ROW_NUMBER() OVER (ORDER BY Final_Cost) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2;   
# MEDIAN = 53.67

SELECT Final_Sales AS Median_Final_Sales
FROM (
SELECT Final_Sales, ROW_NUMBER() OVER (ORDER BY Final_Sales) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2; 
  
# MEDIAN = 86.424

SELECT RtnMRP AS Median_RtnMRP
FROM (
SELECT RtnMRP, ROW_NUMBER() OVER (ORDER BY RtnMRP) AS row_num,
COUNT(*) OVER() AS total_count
FROM `medical inventory optimaization dataset`
) AS subquery
WHERE row_num = (total_count + 1)/2 OR row_num 
= (total_count + 2)/2; 

# MEDIAN = 0

############## MODE ###############
SELECT Quantity AS mode_Quantity
FROM (
SELECT Quantity, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY Quantity
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 1

SELECT ReturnQuantity AS mode_ReturnQuantity
FROM (
SELECT ReturnQuantity, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY ReturnQuantity
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 0

SELECT Final_Cost AS mode_Final_Cost
FROM (
SELECT Final_Cost, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY Final_Cost
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE =49.352

SELECT Final_Sales AS mode_Final_Sales
FROM (
SELECT Final_Sales, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY Final_Sales
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 0

SELECT RtnMRP AS mode_RtnMRP
FROM (
SELECT RtnMRP, COUNT(*) AS frequency 
FROM `medical inventory optimaization dataset`
GROUP BY RtnMRP
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

# MODE = 0

# SECOND MOMENT DECISION DECISION / MEASURE OF DISPERSION 
########## VARIANCE ###########
SELECT VARIANCE(Quantity) AS
 performance_variance FROM `medical inventory optimaization dataset`;

# variance = 26.38083461739566

SELECT VARIANCE(Final_Cost) AS
 performance_variance FROM `medical inventory optimaization dataset`;

# variance = 216178.8730230874

SELECT VARIANCE(Final_Sales) AS
 performance_variance FROM `medical inventory optimaization dataset`;

# variance = 450646.7490743917

############ STANDARD DEVIATION ########
SELECT STDDEV(Quantity) AS Quantity_std_dev FROM `medical inventory optimaization dataset`;
# standard deviation = 5.136227664093139
SELECT STDDEV(Final_Cost) AS FC_std_dev FROM `medical inventory optimaization dataset`;
# standard deviation = 464.9503984545958
SELECT STDDEV(Final_Sales) AS FS_std_dev FROM `medical inventory optimaization dataset`;
# standard deviation = 671.3022784665576

########### RANGE ############
SELECT MAX(Quantity) - MIN(Quantity) AS quantity_range
FROM `medical inventory optimaization dataset`;
# range = 150
SELECT MAX(ReturnQuantity) - MIN(ReturnQuantity) AS rtnquantity_range
FROM `medical inventory optimaization dataset`;
 # range = 50
 SELECT MAX(Final_Cost) - MIN(Final_Cost) AS FC_range
FROM `medical inventory optimaization dataset`;
# range = 33138
SELECT MAX(Final_Sales) - MIN(Final_Sales) AS FS_range
FROM `medical inventory optimaization dataset`;
# range = 39490

# THIRD MOMENT BUSINESS DECISION / SKEWNESS
SELECT
(
SUM(POWER(Quantity- (SELECT AVG(Quantity) FROM `medical inventory optimaization dataset`), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(Quantity) FROM `medical inventory optimaization dataset`), 3))
) AS skewness
FROM `medical inventory optimaization dataset`;
# SKEW = 11.330477501231265

SELECT
(
SUM(POWER(Final_Cost- (SELECT AVG(Final_Cost) FROM `medical inventory optimaization dataset`), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(Final_Cost) FROM `medical inventory optimaization dataset`), 3))
) AS skewness
FROM `medical inventory optimaization dataset`;
# SKEW = 34.52565474605864

SELECT
(
SUM(POWER(Final_Sales- (SELECT AVG(Final_Sales) FROM `medical inventory optimaization dataset`), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(Final_Sales) FROM `medical inventory optimaization dataset`), 3))
) AS skewness
FROM `medical inventory optimaization dataset`;
# SKEW = 21.03500742428124

SELECT
(
SUM(POWER(RtnMRP- (SELECT AVG(RtnMRP) FROM `medical inventory optimaization dataset`), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(RtnMRP) FROM `medical inventory optimaization dataset`), 3))
) AS skewness
FROM `medical inventory optimaization dataset`;
# SKEW = 15.782085846198926

# FOURTH MOMENT BUSINESS DECISION / KURTOSIS
SELECT
(
(SUM(POWER(Quantity- (SELECT AVG(Quantity) FROM `medical inventory optimaization dataset`), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(Quantity) FROM `medical inventory optimaization dataset`), 4))) - 3
) AS kurtosis
FROM `medical inventory optimaization dataset`;
# KURT = 179.78402568635408

SELECT
(
(SUM(POWER(Final_Cost- (SELECT AVG(Final_Cost) FROM `medical inventory optimaization dataset`), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(Final_Cost) FROM `medical inventory optimaization dataset`), 4))) - 3
) AS kurtosis
FROM `medical inventory optimaization dataset`;
# KURT = 2025.698223192802

SELECT
(
(SUM(POWER(Final_Sales- (SELECT AVG(Final_Sales) FROM `medical inventory optimaization dataset`), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(Final_Sales) FROM `medical inventory optimaization dataset`), 4))) - 3
) AS kurtosis
FROM `medical inventory optimaization dataset`;
# KURT = 949.5966981960341

SELECT
(
(SUM(POWER(RtnMRP- (SELECT AVG(RtnMRP) FROM `medical inventory optimaization dataset`), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(RtnMRP) FROM `medical inventory optimaization dataset`), 4))) - 3
) AS kurtosis
FROM `medical inventory optimaization dataset`;
# KURT = 402.6569281311265
use medical_inventory;

# FIND THE UNIQUE VALUES FOR THE FOLLOWING COLUMNS
SELECT DISTINCT DrugName 
FROM `medical inventory optimaization dataset`;
# 752
SELECT DISTINCT Patient_ID
FROM  `medical inventory optimaization dataset`;
# 4883
SELECT DISTINCT Dept
FROM  `medical inventory optimaization dataset`;
# 3
SELECT DISTINCT Formulation
FROM  `medical inventory optimaization dataset`;
# 4 
SELECT DISTINCT SubCat
FROM  `medical inventory optimaization dataset`;
# 18
SELECT DISTINCT SubCat1
FROM  `medical inventory optimaization dataset`;
# 22

   