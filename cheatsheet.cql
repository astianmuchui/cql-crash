-- Create a Keyspace
CREATE KEYSPACE IF NOT EXISTS my_keyspace
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };

-- Use a Keyspace
USE my_keyspace;

-- Create a Table
CREATE TABLE IF NOT EXISTS users (
    user_id UUID PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    created_at TIMESTAMP
);

-- Insert Data into a Table
INSERT INTO users (user_id, first_name, last_name, email, created_at)
VALUES (uuid(), 'John', 'Doe', 'john.doe@example.com', toTimestamp(now()));

-- Select Data from a Table
SELECT * FROM users;

-- Select Specific Columns
SELECT first_name, last_name FROM users WHERE user_id = uuid_value;

-- Update Data in a Table
UPDATE users SET email = 'john.new@example.com' WHERE user_id = uuid_value;

-- Delete Data from a Table
DELETE FROM users WHERE user_id = uuid_value;

-- Batch Insert/Update/Delete Operations
BEGIN BATCH
    INSERT INTO users (user_id, first_name, last_name, email, created_at)
    VALUES (uuid(), 'Jane', 'Doe', 'jane.doe@example.com', toTimestamp(now()));

    UPDATE users SET email = 'john.updated@example.com' WHERE user_id = uuid_value;
APPLY BATCH;

-- Create an Index on a Column
CREATE INDEX IF NOT EXISTS email_index ON users (email);

-- Drop an Index
DROP INDEX IF EXISTS my_keyspace.email_index;

-- Alter a Table to Add a New Column
ALTER TABLE users ADD phone_number TEXT;

-- Drop a Column from a Table
ALTER TABLE users DROP phone_number;

-- Drop a Table
DROP TABLE IF EXISTS users;

-- Drop a Keyspace
DROP KEYSPACE IF EXISTS my_keyspace;

