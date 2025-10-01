CREATE TABLE todo_user (
    user_id UUID PRIMARY KEY,
    user_name VARCHAR(100) UNIQUE NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_password TEXT NOT NULL,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL
);

COMMENT ON TABLE todo_user IS 'Stores user credentials and metadata.';
COMMENT ON COLUMN todo_user.user_id IS 'Primary key for the user.';
COMMENT ON COLUMN todo_user.user_name IS 'Unique username chosen by the user.';
COMMENT ON COLUMN todo_user.user_email IS 'Unique email address of the user.';
COMMENT ON COLUMN todo_user.user_password IS 'Password for authentication.';
COMMENT ON COLUMN todo_user.created_at IS 'Timestamp when the user account was created.';

-- ****************************************************************

CREATE TABLE todo_project (
    project_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    project_description TEXT,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES todo_user(user_id) ON DELETE CASCADE
);

COMMENT ON TABLE todo_project IS 'Represents a user-defined project grouping multiple tasks.';
COMMENT ON COLUMN todo_project.project_id IS 'Primary key for the project.';
COMMENT ON COLUMN todo_project.user_id IS 'Foreign key linking to the owner user.';
COMMENT ON COLUMN todo_project.name IS 'Name of the project.';
COMMENT ON COLUMN todo_project.description IS 'Optional description of the project.';
COMMENT ON COLUMN todo_project.created_at IS 'Timestamp when the project was created.';

CREATE TABLE todo_task (
    task_id UUID PRIMARY KEY,
    project_id UUID,
    user_id UUID NOT NULL,
    task_title VARCHAR(100) NOT NULL,
    task_description TEXT,
    due_date DATE,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES todo_user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES todo_project(project_id) ON DELETE SET NULL
);

COMMENT ON TABLE todo_task IS 'Stores individual tasks assigned to users.';
COMMENT ON COLUMN todo_task.task_id IS 'Primary key for the task.';
COMMENT ON COLUMN todo_task.project_id IS 'Optional foreign key linking to a project.';
COMMENT ON COLUMN todo_task.user_id IS 'Foreign key linking to the task owner.';
COMMENT ON COLUMN todo_task.title IS 'Title or summary of the task.';
COMMENT ON COLUMN todo_task.description IS 'Detailed description of the task.';
COMMENT ON COLUMN todo_task.due_date IS 'Optional deadline for the task.';
COMMENT ON COLUMN todo_task.completed IS 'Boolean flag indicating if the task is completed.';
COMMENT ON COLUMN todo_task.created_at IS 'Timestamp when the task was created.';

CREATE TABLE todo_notification (
    notification_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    message TEXT NOT NULL,
    read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES todo_user(user_id) ON DELETE CASCADE
);

COMMENT ON TABLE notification IS 'Stores system or user-generated notifications.';
COMMENT ON COLUMN notification.notification_id IS 'Primary key for the notification.';
COMMENT ON COLUMN notification.user_id IS 'Foreign key linking to the recipient user.';
COMMENT ON COLUMN notification.message IS 'Content of the notification.';
COMMENT ON COLUMN notification.read IS 'Boolean flag indicating if the notification has been read.';
COMMENT ON COLUMN notification.created_at IS 'Timestamp when the notification was created.';