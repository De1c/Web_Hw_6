-- Find a list of students in a specific group.
SELECT s.student_name, gr.group_number
FROM groups gr
LEFT JOIN students as s ON s.group_id = gr.id
GROUP BY s.student_name
ORDER BY gr.id
;