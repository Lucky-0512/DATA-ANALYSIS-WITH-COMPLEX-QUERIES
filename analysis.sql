-- Create a sample 'sales' table, insert minimal data, and demonstrate:
--   1. Window functions (SUM OVER PARTITION, ROW_NUMBER)
--   2. Common Table Expression (CTE)
--   3. Subquery filtering
--

-- 1. Create 'sales' table
CREATE TABLE IF NOT EXISTS sales (
    id      INT PRIMARY KEY,
    product VARCHAR(50),
    region  VARCHAR(50),
    amount  INT
);

-- 2. Insert minimal sample data into 'sales'
INSERT INTO sales (id, product, region, amount) VALUES
    (1, 'ProductA', 'East', 100),
    (2, 'ProductB', 'West', 150),
    (3, 'ProductA', 'East', 200),
    (4, 'ProductC', 'West', 120),
    (5, 'ProductB', 'East', 180);

-- 3. WINDOW FUNCTION #1: Total sales per region
SELECT
    id,
    product,
    region,
    amount,
    SUM(amount) OVER (PARTITION BY region) AS total_sales_by_region
FROM
    sales;
-- Expected output: each row shows the same total for its region (East or West).

-- 4. WINDOW FUNCTION #2: Rank products by amount (within each product group)
SELECT
    id,
    product,
    region,
    amount,
    ROW_NUMBER() OVER (PARTITION BY product ORDER BY amount DESC) AS rank_within_product
FROM
    sales;
-- Expected: For each product, the highest amount is rank=1, next is rank=2, etc.

-- 5. CTE EXAMPLE: Find regions whose average sale is X, then filter
WITH avg_region AS (
    SELECT
        region,
        AVG(amount) AS avg_amount
    FROM
        sales
    GROUP BY
        region
)
SELECT
    s.id,
    s.product,
    s.region,
    s.amount,
    a.avg_amount
FROM
    sales s
    JOIN avg_region a ON s.region = a.region
WHERE
    s.amount > a.avg_amount;
-- Expected: only those individual sales that exceed their region's average.

-- 6. SUBQUERY EXAMPLE: Products whose total sales exceed 250
SELECT
    product,
    total_sales
FROM (
    SELECT
        product,
        SUM(amount) AS total_sales
    FROM
        sales
    GROUP BY
        product
) AS product_totals
WHERE
    total_sales > 250;
-- Expected: 'ProductA' (100+200=300) and 'ProductB' (150+180=330).
