-- Find the average score on the stream (for the entire rating table).
SELECT ROUND(AVG(g.grade), 2)
FROM grades g
;