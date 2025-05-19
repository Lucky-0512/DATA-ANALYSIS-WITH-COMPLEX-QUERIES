# Task 2: DATA ANALYSIS WITH COMPLEX QUERIES
Company: CODTECH IT SOLUTIONS\
Name   : T V Sai Kushal\
Intern ID : CT04DL1133\
Domain : SQL\
Duration : 4 WEEKS\
Mentor : Neela Santhosh

## Task Description
Use advanced SQL features—window functions, subqueries, and Common Table Expressions (CTEs)—to analyze a simple `sales` table and showcase trends or patterns.\
i used online mySQL editor aka "www.onlinecompiler.com"  to run my queries.

## Steps and Files
1. analysis.sql  
   - Creates a table named `sales` with columns `(id, product, region, amount)`.  
   - Inserts five sample rows.\
  ![Image](https://github.com/user-attachments/assets/6d4ff2d8-525a-4ac1-83b2-2c926c3b771b)
   - Demonstrates:
     1. `SUM(amount) OVER (PARTITION BY region)`: total sales per region.\
    ![Image](https://github.com/user-attachments/assets/be213302-af68-417c-836e-3f514d8feeb4)
            
     2. `ROW_NUMBER() OVER (PARTITION BY product ORDER BY amount DESC)`: ranking orders by amount within each product.\
        ![Image](https://github.com/user-attachments/assets/eecc7e49-94b0-4ca1-b130-2fe4322837bc)
     3. A CTE (`avg_region`) to compute average amount per region, then filters actual sales greater than that average.\
        ![Image](https://github.com/user-attachments/assets/6467b43e-5eaa-4823-8481-e0f07eea1e36)
     4. A subquery that aggregates total sales per product, then filters to products whose total sales exceed 250.\
        ![Image](https://github.com/user-attachments/assets/562639d4-d3ff-4be0-85e2-8ec47c727d1b)

