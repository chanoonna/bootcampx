SELECT COUNT(asrq.*) AS total_assistances, students.name
FROM assistance_requests asrq
JOIN students
  ON students.id = asrq.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;