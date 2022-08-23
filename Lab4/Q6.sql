
#Q6-Find the least expensive product from each category and print the table with category id, name, product name and price of the product

SELECT CAT.CAT_ID,CAT.CAT_NAME,MIN(MINIMUM_PRICE) AS MIN_PRICE FROM CATEGORY CAT INNER JOIN (
SELECT PRD.CAT_ID,PRD.PRO_NAME,T1.* FROM PRODUCT PRD INNER JOIN (
SELECT PRO_ID,MIN(SUPP_PRICE) AS MINIMUM_PRICE FROM  SUPPLIER_PRICING GROUP BY PRO_ID) AS T1 ON 
T1.PRO_ID=PRD.PRO_ID) AS T2 ON T2.CAT_ID=CAT.CAT_ID
GROUP BY CAT.CAT_ID


