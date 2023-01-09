-- A list of courses taught to a particular student by a particular instructor.
SELECT s.student_name, sb.subject_name, t.teacher_name
FROM grades g
LEFT JOIN students as s ON g.student_id = s.id
LEFT JOIN subjects as sb ON g.subject_id = sb.id
    LEFT JOIN teachers as t ON sb.teacher_id = t.id
WHERE t.id = 1 AND s.id = 2
GROUP BY s.id, t.id
;