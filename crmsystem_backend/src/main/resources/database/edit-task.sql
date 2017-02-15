-- ALTER TABLE tasks RENAME COLUMN responsible_user TO implementer;

ALTER TABLE tasks RENAME COLUMN implementer TO user_id;



DROP TABLE tasks;
DROP TABLE tasks_users;



-- tasks
CREATE TABLE IF NOT EXISTS tasks(
  id          UUID      NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  user_id     UUID NOT NULL,
  created     TIMESTAMP NOT NULL,
  updated     TIMESTAMP NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id)
);



CREATE TABLE IF NOT EXISTS tasks(
  id          UUID      NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  created     TIMESTAMP NOT NULL,
  updated     TIMESTAMP NOT NULL
);

-- task_users
CREATE TABLE IF NOT EXISTS tasks_users(
  task_id UUID NOT NULL,
  user_id UUID NOT NULL,

  FOREIGN KEY (task_id) REFERENCES tasks(id),
  FOREIGN KEY (user_id) REFERENCES users(id),

  UNIQUE (task_id, user_id)
);
