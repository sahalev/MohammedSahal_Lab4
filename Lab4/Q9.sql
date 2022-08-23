USE `order_directory`;
DROP procedure IF EXISTS `displaySupplierDetails`;

DELIMITER $$
USE `order_directory`$$
CREATE PROCEDURE displaySupplierDetails ()
BEGIN
select report.SUPP_ID,report.SUPP_NAME,report.average,
case 
when report.average = 5 then 'Excellent Service'
when report.average > 4 then 'Good Service'
when report.average > 2 then 'Average Service'
else 'Poor Service'
end as TYPEOFSERVICE 
 from (
select sup.SUPP_ID,sup.SUPP_NAME,final.Average from (
select t2.SUPP_ID,sum(t2.RAT_RATSTARS)/count(t2.RAT_RATSTARS) as Average from  (
select sp.SUPP_ID,t1.ORD_ID,t1.RAT_RATSTARS from supplier_pricing sp inner join 
(select ord.ORD_ID,ord.PRICING_ID,rt.RAT_RATSTARS from `order` ord inner join rating rt on ord.ORD_ID=rt.ORD_ID) 
as t1 on sp.PRICING_ID=t1.PRICING_ID ) as t2
group by t2.SUPP_ID ) as final inner join supplier sup on final.SUPP_ID=sup.SUPP_ID
) as report;
END$$

DELIMITER ;