SELECT ROUND(AVG(g.grade), 2) as av, s.student_name
FROM grades g
LEFT JOIN students as s ON g.student_id = s.id
WHERE s.id = 25
;