


#Q4-total number of customers based on gender who have placed orders of worth at least Rs.3000

SELECT ORD.*,PROD.PRO_NAME FROM `order` ORD INNER JOIN SUPPLIER_PRICING PRC 
ON ORD.PRICING_ID=PRC.PRICING_ID INNER JOIN PRODUCT PROD ON PROD.PRO_ID=PRC.PRO_ID
WHERE ORD.CUS_ID=2





