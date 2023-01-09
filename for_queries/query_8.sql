-- Find the average score that a certain teacher puts in his subjects.
SELECT ROUND(AVG(g.grade), 2) as av, t.teacher_name, sb.subject_name
FROM grades g
LEFT JOIN subjects as sb ON g.subject_id = sb.id
    LEFT JOIN teachers as t ON sb.teacher_id = t.id
GROUP BY sb.id, t.id
ORDER BY av DESC
; 