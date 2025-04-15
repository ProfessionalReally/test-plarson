SELECT
    CASE month
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS month_name,
    CASE
        WHEN month = 2 THEN
            CASE
                WHEN (YEAR(CURDATE()) % 4 = 0 AND (YEAR(CURDATE()) % 100 != 0 OR YEAR(CURDATE()) % 400 = 0)) THEN 29
                ELSE 28
            END
        WHEN month IN (4, 6, 9, 11) THEN 30
        ELSE 31
    END AS days_in_month
FROM (SELECT 1 AS month UNION ALL
      SELECT 2 UNION ALL
      SELECT 3 UNION ALL
      SELECT 4 UNION ALL
      SELECT 5 UNION ALL
      SELECT 6 UNION ALL
      SELECT 7 UNION ALL
      SELECT 8 UNION ALL
      SELECT 9 UNION ALL
      SELECT 10 UNION ALL
      SELECT 11 UNION ALL
      SELECT 12) AS months;