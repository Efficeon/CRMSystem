-- users
CREATE TABLE IF NOT EXISTS users (
  id                SERIAL       NOT NULL PRIMARY KEY,
  email             VARCHAR(255) NOT NULL,
  usertype          VARCHAR(50)  NOT NULL,
  username          VARCHAR(50)  NOT NULL,
  first_name        VARCHAR(50)  NOT NULL,
  last_name         VARCHAR(50)  NOT NULL,
  password          VARCHAR(255) NOT NULL,
  registration_date TIMESTAMP    NOT NULL,
  birth_date        TIMESTAMP
);

-- roles
CREATE TABLE IF NOT EXISTS roles (
  id   SERIAL      NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- user_roles
CREATE TABLE IF NOT EXISTS user_roles (
  user_id SERIAL NOT NULL,
  role_id SERIAL NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
);

-- task

CREATE TABLE IF NOT EXISTS tasks(
  id SERIAL NOT NULL PRIMARY KEY ,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  responsible_user SERIAL NOT NULL,
  created TIMESTAMP NOT NULL,
  updated TIMESTAMP NOT NULL,

  FOREIGN KEY (responsible_user) REFERENCES users (id)
);
