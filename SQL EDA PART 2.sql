CREATE DATABASE pharma_analysis;
use pharma_analysis;
SELECT * FROM `medical inventory optimaization dataset`;

# FIND THE OUTLIERS
UPDATE `medical inventory optimaization dataset` AS e
JOIN (
SELECT
'Quantity',
'ReturnQuantity',
'Final_Sales',
'RtnMRP',
NTILE(4) OVER (ORDER BY Quantity) AS RtnMRP_quartile
FROM `medical inventory optimaization dataset`
) AS subquery ON e.Quantity = subquery.Quantity
SET e.RtnMRP = (
SELECT AVG(RtnMRP)
FROM (
SELECT
'Quantity',
'ReturnQuantity',
'Final_Sales',
'RtnMRP',
NTILE(4) OVER (ORDER BY RtnMRP) AS RtnMRP_quartile
FROM `medical inventory optimaization dataset`
) AS temp
WHERE temp.RtnMRP_quartile = subquery.RtnMRP_quartile
)
WHERE subquery.RtnMRP_quartile IN (1, 4);

# ZERO & NEAR ZERO VARIANCE
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
## variance range more than 0 and 1 the variance range of columns are very high 
# usually we ignore the columns with the same entries throughout or if majority of the entries are same 
# so we couldn't remove the above columns because there is no same entries    
   
###### TYPECASTING ######
SELECT CAST(Patient_ID AS CHAR) AS Patient_ID_str
FROM `medical inventory optimaization dataset`;
DESCRIBE `medical inventory optimaization dataset`;