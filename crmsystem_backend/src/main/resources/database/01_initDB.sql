-- users
CREATE TABLE IF NOT EXISTS users (
  id                UUID       NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
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
  id   UUID      NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(50) NOT NULL
);

-- user_roles
CREATE TABLE IF NOT EXISTS user_roles (
  user_id UUID NOT NULL,
  role_id UUID NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
);

-- tasks
CREATE TABLE IF NOT EXISTS tasks(
  id SERIAL NOT NULL PRIMARY KEY ,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  responsible_person SERIAL NOT NULL,
  created TIMESTAMP NOT NULL,
  updated TIMESTAMP NOT NULL,

  FOREIGN KEY (responsible_person) REFERENCES users (id)
);

-- companies
CREATE TABLE IF NOT EXISTS companies (
  id        UUID       NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name      VARCHAR(50)  NOT NULL,
  email     VARCHAR(255) NOT NULL,
  website   VARCHAR(255) ,
  address   VARCHAR(255) NOT NULL,
  created   TIMESTAMP    NOT NULL,
  updated   TIMESTAMP
);

-- companies_users
CREATE TABLE IF NOT EXISTS companies_users (
  company_id UUID NOT NULL,
  user_id UUID NOT NULL,

  FOREIGN KEY (company_id) REFERENCES companies (id),
  FOREIGN KEY (user_id) REFERENCES users (id),

  UNIQUE (company_id, user_id)
);

CREATE TABLE IF NOT EXISTS contact
(
  id              UUID       NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  company         VARCHAR(255) NOT NULL,
  responsibleuser VARCHAR(255) NOT NULL,
  name            VARCHAR(255) NOT NULL,
  website         VARCHAR(255) NOT NULL,
  skype           VARCHAR(255) NOT NULL,
  phone_number    VARCHAR(11) NOT NULL,
  create_date     TIMESTAMP    NOT NULL,
  update_date     TIMESTAMP    NOT NULL
);

-- tags
CREATE TABLE IF NOT EXISTS tags (
  id                UUID       NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name              VARCHAR(50)  NOT NULL
);

-- companies_tags
CREATE TABLE IF NOT EXISTS companies_tags (
  company_id UUID NOT NULL,
  tag_id UUID NOT NULL,

  FOREIGN KEY (company_id) REFERENCES companies (id),
  FOREIGN KEY (tag_id) REFERENCES tags (id),

  UNIQUE (company_id, tag_id)
);

