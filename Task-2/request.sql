WITH months AS (
  SELECT generate_series(1, 12) AS month
)
SELECT
  to_char(to_date(month::text, 'MM'), 'FMMonth') AS month_name,
  CASE
    WHEN month = 2 THEN
      CASE
        WHEN extract(year from current_date) % 4 = 0 AND (extract(year from current_date) % 100 != 0 OR extract(year from current_date) % 400 = 0)
        THEN 29
        ELSE 28
      END
    WHEN month IN (4, 6, 9, 11) THEN 30
    ELSE 31
  END AS days_in_month
FROM months;