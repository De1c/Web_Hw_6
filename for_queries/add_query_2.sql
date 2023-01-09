-- Grades of students in a certain group in a certain subject in the last lesson.
SELECT g.grade, max(g.grade_date), s.student_name, sb.subject_name, gr.group_number
FROM grades g
LEFT JOIN students as s ON g.student_id = s.id
    LEFT JOIN groups as gr ON s.group_id = gr.id
LEFT JOIN subjects as sb ON g.subject_id = sb.id
WHERE gr.id = 1 AND sb.subject_name = "art"
GROUP BY s.id, sb.id
ORDER BY g.grade
;