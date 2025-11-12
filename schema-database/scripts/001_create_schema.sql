CREATE TABLE users (
    id UUID PRIMARY KEY,
    user_name VARCHAR(100) UNIQUE NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_password TEXT NOT NULL,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- COMMENT
COMMENT ON TABLE users IS 'Stores user credentials and metadata.';
COMMENT ON COLUMN users.id IS 'Primary key for the user.';
COMMENT ON COLUMN users.user_name IS 'Unique username chosen by the user.';
COMMENT ON COLUMN users.user_email IS 'Unique email address of the user.';
COMMENT ON COLUMN users.user_password IS 'Password for authentication.';
COMMENT ON COLUMN users.created_at IS 'Timestamp when the user account was created.';
COMMENT ON COLUMN users.updated_at IS 'Timestamp when the user account was last updated.';

-- ALTER
-- ALTER TABLE users ADD user_role VARCHAR(50) DEFAULT 'user';

-- UPDATE
-- UPDATE users SET user_role = 'admin' WHERE user_email = '...';

-- ****************************************************************

CREATE TABLE projects (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    project_description TEXT,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- COMMENT
COMMENT ON TABLE projects IS 'Represents a user-defined project grouping multiple tasks.';
COMMENT ON COLUMN projects.id IS 'Primary key for the project.';
COMMENT ON COLUMN projects.user_id IS 'Foreign key linking to the owner user.';
COMMENT ON COLUMN projects.project_name IS 'Name of the project.';
COMMENT ON COLUMN projects.project_description IS 'Optional description of the project.';
COMMENT ON COLUMN projects.created_at IS 'Timestamp when the project was created.';
COMMENT ON COLUMN projects.updated_at IS 'Timestamp when the project was last updated.';

-- ALTER
-- ALTER TABLE projects ADD project_status BOOLEAN DEFAULT TRUE;

-- UPDATE 
-- UPDATE projects SET project_status = FALSE WHERE id = '...';

-- ****************************************************************

CREATE TABLE tasks (
    id UUID PRIMARY KEY,
    project_id UUID,
    user_id UUID NOT NULL,
    task_title VARCHAR(100) NOT NULL,
    task_description TEXT,
    due_date DATE,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE SET NULL
);

-- COMMENT
COMMENT ON TABLE tasks IS 'Stores individual tasks assigned to user.';
COMMENT ON COLUMN tasks.id IS 'Primary key for the task.';
COMMENT ON COLUMN tasks.project_id IS 'Optional foreign key linking to a project.';
COMMENT ON COLUMN tasks.user_id IS 'Foreign key linking to the task owner.';
COMMENT ON COLUMN tasks.task_title IS 'Title or summary of the task.';
COMMENT ON COLUMN tasks.task_description IS 'Detailed description of the task.';
COMMENT ON COLUMN tasks.due_date IS 'Optional deadline for the task.';
COMMENT ON COLUMN tasks.completed IS 'Boolean flag indicating if the task is completed.';
COMMENT ON COLUMN tasks.created_at IS 'Timestamp when the task was created.';
COMMENT ON COLUMN tasks.updated_at IS 'Timestamp when the task was last updated.';

-- ALTER
-- ALTER TABLE tasks ADD priority VARCHAR(20) DEFAULT 'standard';
-- ALTER TABLE tasks ADD comments TEXT;

-- UPDATE
-- UPDATE tasks SET priority = 'urgent' WHERE id = '...';

-- ****************************************************************

CREATE TABLE notifications (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    message TEXT NOT NULL,
    read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- COMMENT
COMMENT ON TABLE notifications IS 'Stores system or user-generated notifications.';
COMMENT ON COLUMN notifications.id IS 'Primary key for the notification.';
COMMENT ON COLUMN notifications.user_id IS 'Foreign key linking to the recipient user.';
COMMENT ON COLUMN notifications.message IS 'Content of the notification.';
COMMENT ON COLUMN notifications.read IS 'Boolean flag indicating if the notification has been read.';
COMMENT ON COLUMN notifications.created_at IS 'Timestamp when the notification was created.';
COMMENT ON COLUMN notifications.updated_at IS 'Timestamp when the notification was last updated.';

-- ALTER
-- ALTER TABLE notifications ADD notification_type VARCHAR(50) DEFAULT 'standard';

-- UPDATE
-- UPDATE notifications SET notification_type = 'urgent' WHERE id = '...';

-- ****************************************************************

-- CLEAN
-- DROP SCHEMA public CASCADE;
-- CREATE SCHEMA public;