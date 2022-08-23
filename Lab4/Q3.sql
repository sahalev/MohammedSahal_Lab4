use order_directory;

#Q3-total number of customers based on gender who have placed orders of worth at least Rs.3000

SELECT T2.CUS_GENDER,COUNT(*) AS NO_OF_CUSTOMERS FROM (
SELECT T1.CUS_ID,T1.CUS_NAME,T1.CUS_GENDER,T1.ORD_AMOUNT FROM 
(SELECT ORD.*,CUS.CUS_NAME,CUS.CUS_GENDER FROM `order` ord inner join CUSTOMER cus on 
CUS.CUS_ID=ORD.CUS_ID having ord.ORD_AMOUNT>=3000
) 
AS T1 GROUP BY T1.CUS_ID
) AS T2 GROUP BY T2.CUS_GENDER







