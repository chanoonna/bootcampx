SELECT t.name AS teacher, c.name AS cohort, COUNT(asrq.teacher_id) AS total_assistances
FROM assistance_requests asrq
JOIN students s
  ON s.id = asrq.student_id
JOIN cohorts c
  ON c.id = s.cohort_id
JOIN teachers t
  ON t.id = asrq.teacher_id
WHERE c.name = 'JUL02'
GROUP BY t.name, c.name
ORDER BY total_assistances DESC;