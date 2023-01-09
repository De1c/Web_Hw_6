-- Find which courses a particular instructor is teaching.
SELECT sb.subject_name, t.teacher_name
FROM teachers t
LEFT JOIN subjects as sb ON sb.teacher_id = t.id
GROUP BY sb.id
;