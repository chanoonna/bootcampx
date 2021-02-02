WITH sum AS (
  SELECT c.name AS cohort, SUM(asrq.completed_at - asrq.started_at) AS total_duration
  FROM assistance_requests asrq
  JOIN students s
    ON s.id = asrq.student_id
  JOIN cohorts c
    ON c.id = s.cohort_id
  GROUP BY cohort
)
SELECT AVG(total_duration) AS average_total_duration
FROM sum;