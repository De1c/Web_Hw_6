-- Find the student with the highest GPA in a particular subject.
SELECT ROUND(AVG(g.grade), 2) as av, s.student_name, sb.subject_name
FROM grades g
  LEFT JOIN subjects as sb ON g.subject_id = sb.id
  LEFT JOIN students as s ON g.student_id = s.id
-- sb.id: 1 - English, 2 - math, 3 - art, 4 - science, 5 - history
WHERE sb.id = 5
GROUP BY sb.id, s.id
ORDER BY av DESC LIMIT 1
;