CREATE TABLE Users (
    id UUID PRIMARY KEY,
    user_name VARCHAR(100) UNIQUE NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_password TEXT NOT NULL,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- COMMENT
COMMENT ON TABLE Users IS 'Stores user credentials and metadata.';
COMMENT ON COLUMN Users.user_id IS 'Primary key for the user.';
COMMENT ON COLUMN Users.user_name IS 'Unique username chosen by the user.';
COMMENT ON COLUMN Users.user_email IS 'Unique email address of the user.';
COMMENT ON COLUMN Users.user_password IS 'Password for authentication.';
COMMENT ON COLUMN Users.created_at IS 'Timestamp when the user account was created.';

-- ALTER
-- ALTER TABLE Users ADD user_role VARCHAR(50) DEFAULT 'user';

-- UPDATE
-- UPDATE Users SET user_role = "admin" WHERE user_email =

-- ****************************************************************

CREATE TABLE Project (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    project_description TEXT,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- COMMENT
COMMENT ON TABLE Project IS 'Represents a user-defined project grouping multiple tasks.';
COMMENT ON COLUMN Project.project_id IS 'Primary key for the project.';
COMMENT ON COLUMN Project.user_id IS 'Foreign key linking to the owner user.';
COMMENT ON COLUMN Project.name IS 'Name of the project.';
COMMENT ON COLUMN Project.description IS 'Optional description of the project.';
COMMENT ON COLUMN Project.created_at IS 'Timestamp when the project was created.';

-- ALTER
-- ALTER TABLE Project ADD project_status BOOLEAN DEFAULT TRUE;

-- UPDATE 
-- UPDATE Project SET project_status FALSE WHERE id =

-- ****************************************************************

CREATE TABLE Task (
    id UUID PRIMARY KEY,
    project_id UUID,
    user_id UUID NOT NULL,
    task_title VARCHAR(100) NOT NULL,
    task_description TEXT,
    due_date DATE,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES Project(id) ON DELETE SET NULL
);

-- COMMENT
COMMENT ON TABLE Task IS 'Stores individual tasks assigned to users.';
COMMENT ON COLUMN Task.task_id IS 'Primary key for the task.';
COMMENT ON COLUMN Task.project_id IS 'Optional foreign key linking to a project.';
COMMENT ON COLUMN Task.user_id IS 'Foreign key linking to the task owner.';
COMMENT ON COLUMN Task.title IS 'Title or summary of the task.';
COMMENT ON COLUMN Task.description IS 'Detailed description of the task.';
COMMENT ON COLUMN Task.due_date IS 'Optional deadline for the task.';
COMMENT ON COLUMN Task.completed IS 'Boolean flag indicating if the task is completed.';
COMMENT ON COLUMN Task.created_at IS 'Timestamp when the task was created.';

-- ALTER
-- ALTER TABLE Task ADD priority VARCHAR(20) DEFAULT 'standard';
-- ALTER TABLE Task ADD comments TEXT;

-- UPDATE
-- UPDATE Task SET priority = 'urgent' TRUE WHERE id =

-- ****************************************************************

CREATE TABLE Notification (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    message TEXT NOT NULL,
    read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- COMMENT
COMMENT ON TABLE Notification IS 'Stores system or user-generated Notifications.';
COMMENT ON COLUMN Notification.Notification_id IS 'Primary key for the Notification.';
COMMENT ON COLUMN Notification.user_id IS 'Foreign key linking to the recipient user.';
COMMENT ON COLUMN Notification.message IS 'Content of the Notification.';
COMMENT ON COLUMN Notification.read IS 'Boolean flag indicating if the Notification has been read.';
COMMENT ON COLUMN Notification.created_at IS 'Timestamp when the Notification was created.';

-- ALTER
-- ALTER TABLE Notification ADD notification_type VARCHAR(50) DEFAULT 'standard';

-- UPDATE
-- UPDATE Notification SET notification_type = 'urgent' WHERE id =

-- ****************************************************************

-- CLEAN
-- DROP SCHEMA public CASCADE;
-- CREATE SCHEMA public;