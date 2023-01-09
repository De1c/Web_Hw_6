-- Find the grades of students in a particular group in a particular subject.
SELECT g.grade, sb.subject_name, gr.group_number
FROM grades g
LEFT JOIN subjects as sb ON g.subject_id = sb.id 
LEFT JOIN students as s ON g.student_id = s.id
    LEFT JOIN groups as gr ON s.group_id = gr.id
WHERE gr.id = 1 AND sb.subject_name = "english"
GROUP BY gr.id, s.id, sb.id
ORDER BY gr.id
;