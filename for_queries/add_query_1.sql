-- The average score given by a particular instructor to a particular student.
SELECT ROUND(AVG(g.grade), 2), sb.subject_name, s.student_name, t.teacher_name
FROM grades g
LEFT JOIN students as s ON g.student_id = s.id
LEFT JOIN subjects as sb ON g.subject_id = sb.id
    LEFT JOIN teachers as t ON sb.teacher_id = t.id
WHERE t.id = 1 AND s.id = 25
GROUP BY s.id, t.id
;