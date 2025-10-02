SELECT U.user_name,P.project_name,P.project_description,T.task_title, T.task_description, T.due_date, T.completed
FROM Task T
INNER JOIN Project P 
ON P.id = T.project_id
INNER JOIN Users U
ON U.id = T.user_id