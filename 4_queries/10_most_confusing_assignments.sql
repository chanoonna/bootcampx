SELECT
  DISTINCT
  asmt.id AS id,
  asmt.name AS name,
  asmt.day AS day,
  asmt.chapter AS chapter,
  COUNT(asrq.assignment_id) AS total_requests
FROM assistance_requests asrq
JOIN assignments asmt
  ON asmt.id = asrq.assignment_id
GROUP BY asmt.id
ORDER BY total_requests DESC;