SELECT DISTINCT t.name AS teacher, c.name AS cohort
FROM assistance_requests asrq
JOIN students s
  ON s.id = asrq.student_id
JOIN cohorts c
  ON c.id = s.cohort_id
JOIN teachers t
  ON t.id = asrq.teacher_id
WHERE c.name = 'JUL02'
ORDER BY t.name;