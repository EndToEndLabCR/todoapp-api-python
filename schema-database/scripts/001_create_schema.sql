CREATE TABLE user (
    id UUID PRIMARY KEY,
    user_name VARCHAR(100) UNIQUE NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_password TEXT NOT NULL,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL
    updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

-- COMMENT
COMMENT ON TABLE user IS 'Stores user credentials and metadata.';
COMMENT ON COLUMN user.user_id IS 'Primary key for the user.';
COMMENT ON COLUMN user.user_name IS 'Unique username chosen by the user.';
COMMENT ON COLUMN user.user_email IS 'Unique email address of the user.';
COMMENT ON COLUMN user.user_password IS 'Password for authentication.';
COMMENT ON COLUMN user.created_at IS 'Timestamp when the user account was created.';
COMMENT ON COLUMN user.updated_at IS 'Timestamp when the user account was last updated.';

-- ALTER
-- ALTER TABLE user ADD user_role VARCHAR(50) DEFAULT 'user';

-- UPDATE
-- UPDATE user SET user_role = "admin" WHERE user_email =

-- ****************************************************************

CREATE TABLE project (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    project_description TEXT,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
    updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

-- COMMENT
COMMENT ON TABLE project IS 'Represents a user-defined project grouping multiple tasks.';
COMMENT ON COLUMN project.project_id IS 'Primary key for the project.';
COMMENT ON COLUMN project.user_id IS 'Foreign key linking to the owner user.';
COMMENT ON COLUMN project.name IS 'Name of the project.';
COMMENT ON COLUMN project.description IS 'Optional description of the project.';
COMMENT ON COLUMN project.created_at IS 'Timestamp when the project was created.';
COMMENT ON COLUMN project.updated_at IS 'Timestamp when the project was last updated.';

-- ALTER
-- ALTER TABLE project ADD project_status BOOLEAN DEFAULT TRUE;

-- UPDATE 
-- UPDATE project SET project_status FALSE WHERE id =

-- ****************************************************************

CREATE TABLE task (
    id UUID PRIMARY KEY,
    project_id UUID,
    user_id UUID NOT NULL,
    task_title VARCHAR(100) NOT NULL,
    task_description TEXT,
    due_date DATE,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE SET NULL
    updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

-- COMMENT
COMMENT ON TABLE task IS 'Stores individual tasks assigned to user.';
COMMENT ON COLUMN task.task_id IS 'Primary key for the task.';
COMMENT ON COLUMN task.project_id IS 'Optional foreign key linking to a project.';
COMMENT ON COLUMN task.user_id IS 'Foreign key linking to the task owner.';
COMMENT ON COLUMN task.title IS 'Title or summary of the task.';
COMMENT ON COLUMN task.description IS 'Detailed description of the task.';
COMMENT ON COLUMN task.due_date IS 'Optional deadline for the task.';
COMMENT ON COLUMN task.completed IS 'Boolean flag indicating if the task is completed.';
COMMENT ON COLUMN task.created_at IS 'Timestamp when the task was created.';
COMMENT ON COLUMN task.updated_at IS 'Timestamp when the task was last updated.';

-- ALTER
-- ALTER TABLE task ADD priority VARCHAR(20) DEFAULT 'standard';
-- ALTER TABLE task ADD comments TEXT;

-- UPDATE
-- UPDATE task SET priority = 'urgent' TRUE WHERE id =

-- ****************************************************************

CREATE TABLE notification (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    message TEXT NOT NULL,
    read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
    updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

-- COMMENT
COMMENT ON TABLE notification IS 'Stores system or user-generated notifications.';
COMMENT ON COLUMN notification.notification_id IS 'Primary key for the notification.';
COMMENT ON COLUMN notification.user_id IS 'Foreign key linking to the recipient user.';
COMMENT ON COLUMN notification.message IS 'Content of the notification.';
COMMENT ON COLUMN notification.read IS 'Boolean flag indicating if the notification has been read.';
COMMENT ON COLUMN notification.created_at IS 'Timestamp when the notification was created.';
COMMENT ON COLUMN notification.updated_at IS 'Timestamp when the notification was last updated.';

-- ALTER
-- ALTER TABLE notification ADD notification_type VARCHAR(50) DEFAULT 'standard';

-- UPDATE
-- UPDATE notification SET notification_type = 'urgent' WHERE id =

-- ****************************************************************

-- CLEAN
-- DROP SCHEMA public CASCADE;
-- CREATE SCHEMA public;