SELECT c.name AS cohort, SUM(asrq.completed_at - asrq.started_at) AS total_duration
FROM assistance_requests asrq
JOIN students s
  ON s.id = asrq.student_id
JOIN cohorts c
  ON c.id = s.cohort_id
GROUP BY cohort
ORDER BY total_duration;