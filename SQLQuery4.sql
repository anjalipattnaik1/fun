
SELECT p.ProductID, p.ProductName FROM Products p LEFT JOIN Sales s ON p.ProductID = s.ProductID WHERE s.SaleID IS NULL;
 
SELECT ProductID, SUM(SaleAmount) AS TotalSalesAmount FROM Sales GROUP BY ProductID;
 
SELECT * FROM Sales WHERE DATEPART(WEEKDAY, SaleDate) IN (1, 7);
 
SELECT SaleID, ProductID, SaleAmount, RANK() OVER (ORDER BY SaleAmount DESC) AS SaleRank FROM Sales;
 
SELECT TOP 3 SaleID, ProductID, SaleAmount FROM Sales ORDER BY SaleAmount DESC;
 
WITH YearlySales AS ( SELECT YEAR(SaleDate) AS Year, SUM(SaleAmount) AS TotalSales FROM Sales GROUP BY YEAR(SaleDate) ) SELECT Year, TotalSales, LAG(TotalSales) OVER (ORDER BY Year) AS PreviousYearSales, (TotalSales - LAG(TotalSales) OVER (ORDER BY Year)) / LAG(TotalSales) OVER (ORDER BY Year) * 100 AS SalesGrowth FROM YearlySales;
 
SELECT ProductID, SaleDate, SaleAmount, COUNT(*) AS Count FROM Sales GROUP BY ProductID, SaleDate, SaleAmount HAVING COUNT(*) > 1;
 