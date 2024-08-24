-- name: GetTodayTasks :many
SELECT *
FROM TMTask
WHERE todayIndexReferenceDate is not null
  AND start = 1
  AND status = 0
  AND trashed = 0;
