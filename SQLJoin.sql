/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
-- SELECT * FROM products WHERE CategoryID =1;
 SELECT products.name, categories.name FROM products 
 INNER JOIN categories
 on products.CategoryID = categories.CategoryID
WHERE categories.Name= "Computers";
 

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating FROM products AS p
 INNER JOIN reviews as r
 on p.ProductID = r.ProductID
 WHERE r.Rating =5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, sum(s.quantity) AS "TOTAL" FROM sales as s
INNER JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS DepartmentName, c.Name AS CatergoryName FROM departments as d
INNER JOIN categories AS c
on d.DepartmentID = c.DepartmentID
WHERE c.name = "Appliances" OR c.name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS TotalSold, Sum(s.Quantity * s.PricePerUnit) AS TotalPriceSold from products AS p
INNER JOIN sales as s
on p.ProductID = s.ProductID
WHERE p.name = "Eagles: Hotel California";
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.rating, r.Comment FROM products as p
INNER JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE p.Name = "Visio TV" and r.rating <= 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */