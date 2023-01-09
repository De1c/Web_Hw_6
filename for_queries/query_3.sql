-- Find the average score in groups in a particular subject.
SELECT ROUND(AVG(g.grade), 2) as av, gr.group_number, sb.subject_name
FROM grades g
LEFT JOIN students as s ON g.student_id = s.id
    LEFT JOIN groups as gr ON s.group_id = gr.id
LEFT JOIN subjects as sb ON g.subject_id = sb.id
GROUP BY s.group_id, sb.id
ORDER BY gr.id
;