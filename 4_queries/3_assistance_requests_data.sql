SELECT t.name AS teacher, s.name AS student, asmt.name AS assignment, (asrq.completed_at - asrq.started_at) AS duration
FROM assistance_requests asrq
JOIN teachers t
  ON t.id = asrq.teacher_id
JOIN students s
  ON s.id = asrq.student_id
JOIN assignments asmt
  ON asmt.id = asrq.assignment_id
ORDER BY duration;