WITH FirstPurchase AS (
    -- Get the first purchase date for each product
    SELECT 
        code, 
        MIN(date) AS first_purchase_date
    FROM pricing.hourly
    WHERE brand IN ('INLUCK', 'MRDON')
    GROUP BY code
)
SELECT 
	location,
    p.`Item Details` AS product_code,
    -- Last 5 months before July 10, 2023 (February 10, 2023 – July 10, 2023)
    SUM(CASE WHEN p.date >= DATE_SUB('2023-07-10', INTERVAL 5 MONTH) 
             AND p.date < '2023-07-10' THEN 1 ELSE 0 END) 
             AS sales_last_5_months_before_first_price_change,

    -- Last 5 months before September 17, 2024 (April 17, 2024 – September 17, 2024)
    SUM(CASE WHEN p.date >= DATE_SUB('2024-09-17', INTERVAL 5 MONTH) 
             AND p.date < '2024-09-17' THEN 1 ELSE 0 END) 
             AS sales_last_5_months_before_second_price_change,

    -- First 5 months after September 17, 2024 (September 17, 2024 – February 17, 2025)
    SUM(CASE WHEN p.date >= '2024-09-17' 
             AND p.date < DATE_ADD('2024-09-17', INTERVAL 5 MONTH) THEN 1 ELSE 0 END) 
             AS sales_first_5_months_after_third_price_change,

--     fp.first_purchase_date,
--     MAX(p.date) AS last_purchase_date,
    first,
    second,
    third
FROM pricing.hourly p
LEFT JOIN pricing.menu m 
ON LOWER(p.`Item Details`) = LOWER(m.item_name)
LEFT JOIN FirstPurchase fp 
ON p.code = fp.code
WHERE p.brand IN ('INLUCK', 'MRDON') 
GROUP BY p.code, p.location,fp.first_purchase_date
ORDER BY 2 desc,3 desc;



