-- Find 5 students with the highest GPA in all subjects.
SELECT ROUND(AVG(g.grade), 2) as av, s.student_name, s.id
FROM grades g
LEFT JOIN students as s ON g.student_id = s.id
GROUP BY s.id
ORDER BY av DESC LIMIT 5
;