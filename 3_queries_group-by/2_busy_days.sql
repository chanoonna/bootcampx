SELECT day, COUNT(assignments.*) AS total_assignments
FROM assignments
GROUP BY day
HAVING COUNT(assignments.*) > 9
ORDER BY day;