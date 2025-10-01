INSERT INTO todo_user (user_id, user_name, user_email, user_password)
VALUES
  ('98610c7e-054b-4d03-8218-4ba82b868736', 'Alonso', 'alonso@example.com', 'password_pw_1'),
  ('39333a60-ff2e-4698-a601-b84afca52d2e', 'Derian', 'derian@example.com', 'password_pw_2'),
  ('a4386bf5-6913-4e56-9e1f-9048365c7e7f', 'Genesis', 'genesis@example.com', 'password_pw_3'),
  ('e2f43997-3182-40cf-958d-bc26317ccd1d', 'Francisco', 'francisco@example.com', 'password_pw_4');

  INSERT INTO todo_project (project_id, user_id, project_name, project_description)
VALUES
  ('4ea8b32e-4d96-4362-8228-ab065bca28dd', '98610c7e-054b-4d03-8218-4ba82b868736', 'Project FastApi', 'First project FastApi'),
  ('7c8f838d-b510-4fa7-aaa7-5325997401ca', '39333a60-ff2e-4698-a601-b84afca52d2e', 'Project BackEnd', 'First project BackEnd'),
  ('7df47735-bf46-47bd-bac5-322fe491472f', 'a4386bf5-6913-4e56-9e1f-9048365c7e7f', 'Project React', 'First project React'),
  ('0a5c253d-407a-4d0e-b659-b2d9a7008a67', 'e2f43997-3182-40cf-958d-bc26317ccd1d', 'Project DataBase', 'First project DataBase'); 


  INSERT INTO todo_task (task_id, project_id, user_id, task_title, task_description, due_date, completed)
VALUES
  ('b37405f0-2b2a-47fa-954d-f647a9eb033b', '4ea8b32e-4d96-4362-8228-ab065bca28dd', '98610c7e-054b-4d03-8218-4ba82b868736', 'Write Docs', 'Create Docs', '2025-09-30', FALSE),
  ('c06de62a-4672-40b7-aa51-66e4bdcdc144', '7c8f838d-b510-4fa7-aaa7-5325997401ca', '39333a60-ff2e-4698-a601-b84afca52d2e', 'Deploy App', 'Push to production server', '2025-10-05', TRUE),
  ('8b259cfe-00be-42b2-9bbb-a667150e0e2c', '7df47735-bf46-47bd-bac5-322fe491472f', 'a4386bf5-6913-4e56-9e1f-9048365c7e7f', 'Design UI', 'Document UI', '2025-10-10', FALSE),
  ('57928fc5-1e8b-4c4a-af14-014ab3bf8af6', '0a5c253d-407a-4d0e-b659-b2d9a7008a67', 'e2f43997-3182-40cf-958d-bc26317ccd1d', 'Setup DB', 'Initialize PostgreSQL schema', '2025-09-25', TRUE);


  INSERT INTO todo_notification (notification_id, user_id, message, read)
VALUES
  ('780b378e-b925-4260-a29d-d1dfde817ff3', '98610c7e-054b-4d03-8218-4ba82b868736', 'Your task "Create Docs" is due soon.', FALSE), 
  ('dfc41624-e4a5-4f4a-b73b-32bf90310045', '39333a60-ff2e-4698-a601-b84afca52d2e', 'App deployed successfully.', TRUE),
  ('b6530fa8-7691-44c0-a9ea-5b44d1719a48', 'a4386bf5-6913-4e56-9e1f-9048365c7e7f', 'Your task "Design UI" is due soon.', FALSE),
  ('5838d837-01ef-488c-9a30-5a1a026fef65', 'e2f43997-3182-40cf-958d-bc26317ccd1d', 'Database setup completed.', TRUE);