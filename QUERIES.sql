-- ============================================================
--  E-Commerce Platform with Warehouse & Delivery Management — QUERIES
--  IT214 - Database Management System
--  Dhirubhai Ambani University | Academic Year 2026
-- ============================================================



/* =====================================================
   QUERY 1: REFUND IMPACT ANALYSIS

   PURPOSE:
   Calculates monthly revenue, total refunds, and the
   percentage of revenue lost due to refunds.
   Useful for finance dashboards and refund analysis.

   KEY TECHNIQUES:
   - Common Table Expressions (CTEs)
   - Time-series aggregation
   - LEFT JOIN
   ===================================================== */

WITH monthly_revenue AS (
    SELECT TO_CHAR(paid_at, 'YYYY-MM') AS month,
           SUM(amount) AS revenue
    FROM payment
    WHERE status = 'completed'
    GROUP BY TO_CHAR(paid_at, 'YYYY-MM')
),
monthly_refunds AS (
    SELECT TO_CHAR(rf.processed_on, 'YYYY-MM') AS month,
           SUM(rf.amount) AS refunded
    FROM refund rf
    WHERE rf.status = 'completed'
    GROUP BY TO_CHAR(rf.processed_on, 'YYYY-MM')
)
SELECT mr.month,
       mr.revenue,
       COALESCE(mrf.refunded, 0) AS total_refunded,
       ROUND(
           COALESCE(mrf.refunded, 0) * 100.0
           / NULLIF(mr.revenue, 0), 2
       ) AS refund_pct
FROM monthly_revenue mr
LEFT JOIN monthly_refunds mrf
ON mr.month = mrf.month
ORDER BY mr.month;


/* =====================================================
   QUERY 2: TOP PRODUCT PER CATEGORY BY REVENUE

   PURPOSE:
   Identifies the highest revenue-generating product
   within each category based on sales data.

   KEY TECHNIQUES:
   - Two-stage CTE
   - Window Functions
   - RANK() OVER(PARTITION BY)
   - Revenue Aggregation
   ===================================================== */

WITH product_revenue AS (
    SELECT p.product_id,
           p.p_name,
           p.category_id,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM order_item oi
    JOIN product p
    ON oi.product_id = p.product_id
    GROUP BY p.product_id,
             p.p_name,
             p.category_id
),
ranked AS (
    SELECT pr.*,
           cat.cat_name,
           RANK() OVER (
               PARTITION BY pr.category_id
               ORDER BY pr.revenue DESC
           ) AS rnk
    FROM product_revenue pr
    JOIN category cat
    ON pr.category_id = cat.category_id
)
SELECT cat_name AS category,
       p_name AS top_product,
       revenue AS total_revenue
FROM ranked
WHERE rnk = 1
ORDER BY total_revenue DESC;


/* =====================================================
   QUERY 3: HIGHEST-RATED PRODUCT PER CATEGORY

   PURPOSE:
   Finds the highest-rated product in each category
   based on average customer review ratings.

   KEY TECHNIQUES:
   - Correlated Subquery
   - Nested Aggregation
   - GROUP BY + HAVING
   - Relational SQL Approach
   ===================================================== */

SELECT cat.cat_name,
       p.p_name,
       ROUND(AVG(r.rating)::numeric, 2) AS avg_rating
FROM review r
JOIN product p
ON r.product_id = p.product_id
JOIN category cat
ON p.category_id = cat.category_id
GROUP BY cat.cat_name,
         p.p_name
HAVING AVG(r.rating) = (
    SELECT MAX(avg_sub)
    FROM (
        SELECT AVG(r2.rating) AS avg_sub
        FROM review r2
        JOIN product p2
        ON r2.product_id = p2.product_id
        WHERE p2.category_id = p.category_id
        GROUP BY r2.product_id
    ) AS sub
)
ORDER BY cat.cat_name;