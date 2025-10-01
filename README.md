# Data Dictionary – ToDoApp

## Table: todo_user

Stores registered users of the application.

### Columns todo_user

user_id (UUID): Unique identifier for the user. [Primary Key]

user_name (VARCHAR(100)): Display name of the user. [Not Null]

user_email (VARCHAR(100)): Email address of the user. [Unique, Not Null]

user_password (TEXT): Hashed password. [Not Null]

created_at (TIMESTAMP): Timestamp of user creation. [Default: current timestamp]

## Table: todo_project

Represents a project created by a user, grouping related tasks.

### Columns todo_project

project_id (UUID): Unique identifier for the project. [Primary Key]

user_id (UUID): Owner of the project. [Foreign Key → todo_user.user_id, On Delete: CASCADE]

project_name (VARCHAR(100)): Name of the project. [Not Null]

project_description (TEXT): Optional description of the project. [Not Null]

created_at (TIMESTAMP): Timestamp of project creation. [Default: current timestamp]

## Table: todo_task

Defines individual tasks assigned to users, optionally linked to a project.

### Columns todo_task

task_id (UUID): Unique identifier for the task. [Primary Key]

project_id (UUID): Associated project (if any). [Foreign Key → todo_project.project_id, On Delete: SET NULL]

user_id (UUID): Owner of the task. [Foreign Key → todo_user.user_id, On Delete: CASCADE]

task_title (VARCHAR(100)): Title of the task. [Not Null]

task_description (TEXT): Optional description of the task. [Not Null]

due_date (DATE): Deadline for the task. [Not Null]

completed (BOOLEAN): Completion status. [Default: FALSE]

created_at (TIMESTAMP): Timestamp of task creation. [Default: current timestamp]

## Table: todo_notification

Stores system-generated messages for users (e.g., reminders, alerts).

### Columns todo_notification

notification_id (UUID): Unique identifier for the notification. [Primary Key]

user_id (UUID): Recipient of the notification. [Foreign Key → todo_user.user_id, On Delete: CASCADE]

message (TEXT): Notification content. [Not Null]

read (BOOLEAN): Read status. [Default: FALSE]

created_at (TIMESTAMP): Timestamp of notification creation. [Default: current timestamp]
