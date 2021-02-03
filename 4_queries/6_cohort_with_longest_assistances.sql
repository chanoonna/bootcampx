WITH avglist AS (
  SELECT c.name AS name, AVG(asrq.completed_at - asrq.started_at) AS average_assistance_time
  FROM assistance_requests asrq
  JOIN students s
    ON s.id = asrq.student_id
  JOIN cohorts c
    ON c.id = s.cohort_id
  GROUP BY c.name
)
SELECT name, average_assistance_time
FROM avglist
WHERE average_assistance_time = (SELECT MAX(average_assistance_time) FROM avglist);