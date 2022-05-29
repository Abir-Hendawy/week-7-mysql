
-- question 1
SELECT `orderdetails`.`orderNumber` AS `orderNumber`,
sum(`orderdetails`.`quantityOrdered` * `orderdetails`.`priceEach`) AS `total_Payment` FROM `orderdetails`
GROUP BY `orderdetails`.`orderNumber`;

-- question 2
SELECT concat(`emp`.`firstName`,' ',`emp`.`lastName`) 
AS `fullName_Employee`, concat(`mang`.`firstName`,' ',`mang`.`lastName`) AS `fullName_Manager` 
FROM (`employees` `emp` join `employees` `mang` 
on(`mang`.`employeeNumber` = `emp`.`reportsTo`))  ;


-- question 3
select `employees`.`employeeNumber` AS `employeeNumber`,`employees`.`firstName` AS `firstName`,`employees`.`lastName` AS `lastName` from `employees` where `employees`.`officeCode` = (select `offices`.`officeCode` 
from `offices` where `offices`.`city` = 'london';

-- question 4
SELECT `e`.`employeeNumber` AS `employeeNumber`, `e`.`firstName` AS `firstName`, `e`.`lastName` AS `lastName`, `o`.`city` AS `city` FROM (`employees` `e` join `offices` `o` 
on(`e`.`officeCode` = `o`.`officeCode` and `o`.`city` = 'london')


-- question 5
select c.customerNumber,c.customerName,o.orderNumber,sum(od.quantityOrdered*od.priceEach)total_payment
from customers c join orders o join orderdetails od
on(c.customerNumber=o.customerNumber)
and(o.orderNumber=od.orderNumber)
group by od.orderNumber
