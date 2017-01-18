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

-- companies
CREATE TABLE IF NOT EXISTS companies (
  id        SERIAL       NOT NULL PRIMARY KEY,
  name      VARCHAR(50)  NOT NULL,
  email     VARCHAR(255) NOT NULL,
  website   VARCHAR(255) ,
  address   VARCHAR(255) NOT NULL,
  created   TIMESTAMP    NOT NULL,
  updated   TIMESTAMP
);

-- companies_users
CREATE TABLE IF NOT EXISTS companies_users (
  company_id SERIAL NOT NULL,
  user_id SERIAL NOT NULL,

  FOREIGN KEY (company_id) REFERENCES companies (id),
  FOREIGN KEY (user_id) REFERENCES users (id),

  UNIQUE (company_id, user_id)
);

-- tags
CREATE TABLE IF NOT EXISTS tags (
  id                SERIAL       NOT NULL PRIMARY KEY,
  name              VARCHAR(50)  NOT NULL
);

-- companies_tags
CREATE TABLE IF NOT EXISTS companies_tags (
  company_id SERIAL NOT NULL,
  tag_id SERIAL NOT NULL,

  FOREIGN KEY (company_id) REFERENCES companies (id),
  FOREIGN KEY (tag_id) REFERENCES tags (id),

  UNIQUE (company_id, tag_id)
);