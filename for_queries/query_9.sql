-- Find a list of courses that a particular student is attending.
SELECT s.student_name, sb.subject_name
FROM grades g
LEFT JOIN students as s ON g.student_id = s.id
LEFT JOIN subjects as sb ON g.subject_id = sb.id
WHERE s.id = 1
GROUP BY s.id, sb.id
ORDER BY s.id
;