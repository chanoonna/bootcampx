SELECT COUNT(asrq.*) AS total_assistances, teachers.name
FROM assistance_requests asrq
JOIN teachers
  ON teachers.id = asrq.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;