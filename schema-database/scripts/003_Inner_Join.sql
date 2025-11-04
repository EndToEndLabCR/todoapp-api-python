SELECT U.user_name,P.project_name,P.project_description,T.task_title, T.task_description, T.due_date, T.completed
FROM task T
INNER JOIN project P 
ON P.id = T.project_id
INNER JOIN users U
ON U.id = T.user_id