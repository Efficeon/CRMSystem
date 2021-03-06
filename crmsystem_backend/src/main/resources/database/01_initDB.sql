--uuid_generate_v4()
CREATE EXTENSION "uuid-ossp";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- users
CREATE TABLE IF NOT EXISTS users (
  id                UUID         NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  email             VARCHAR(255) NOT NULL,
  usertype          VARCHAR(50)  NOT NULL,
  username          VARCHAR(50)  NOT NULL,
  first_name        VARCHAR(50)  NOT NULL,
  last_name         VARCHAR(50)  NOT NULL,
  password          VARCHAR(255) NOT NULL,
  status            VARCHAR(50)  NOT NULL,
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
  id          UUID      NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  user_id     UUID NOT NULL,
  created     TIMESTAMP NOT NULL,
  updated     TIMESTAMP NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id)
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

CREATE TABLE IF NOT EXISTS deals
(
  id              UUID       NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  budget          FLOAT NOT NULL,
  name            VARCHAR(255) NOT NULL,
  created         TIMESTAMP  NOT NULL DEFAULT (current_timestamp),
  updated         TIMESTAMP,
  dealstatusid    UUID
);

CREATE TABLE IF NOT EXISTS dealstatus
(
  id              UUID       NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name            VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS deals_users
(
  deal_id         UUID       NOT NULL,
  user_id         UUID       NOT NULL,

  FOREIGN KEY (deal_id) REFERENCES deals (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

-- contacts
CREATE TABLE IF NOT EXISTS contacts (
  id              UUID         NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name            VARCHAR(50)  NOT NULL,
  website         VARCHAR(255) NOT NULL,
  skype           VARCHAR(255) NOT NULL,
  phone_number    VARCHAR(11)  NOT NULL,
  create_date     TIMESTAMP    NOT NULL,
  update_date     TIMESTAMP,
  file            BYTEA
);

--contact-user
CREATE TABLE IF NOT EXISTS contact_user
(
  contact_id      UUID     NOT NULL,
  user_id         UUID     NOT NULL,

  FOREIGN KEY (contact_id) REFERENCES contacts (id),
  FOREIGN KEY (user_id)    REFERENCES users (id)
);

--contact-user
CREATE TABLE IF NOT EXISTS contact_company
(
  contact_id      UUID     NOT NULL,
  company_id      UUID     NOT NULL,

  FOREIGN KEY (contact_id) REFERENCES contacts (id),
  FOREIGN KEY (company_id) REFERENCES companies (id)
);

--contact-deal
CREATE TABLE IF NOT EXISTS contact_deal
(
  contact_id   UUID     NOT NULL,
  deal_id      UUID     NOT NULL,

  FOREIGN KEY (contact_id) REFERENCES contacts (id),
  FOREIGN KEY (deal_id) REFERENCES deals (id)
);

--comments
CREATE TABLE IF NOT EXISTS comments(
  id                 UUID          NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  entityID           UUID          NOT NULL uuid_generate_v4(),
  primaryCommentID   UUID          NOT NULL uuid_generate_v4(),
  TEXT               VARCHAR(500)  NOT NULL,
  user_id            UUID          NOT NULL,
  recipient_id       UUID,
  created            TIMESTAMP     NOT NULL,
  updated            TIMESTAMP     NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id)
);

--comments
CREATE TABLE IF NOT EXISTS messages(
  id                 UUID          NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  TEXT               VARCHAR(500)  NOT NULL,
  author_id          UUID          NOT NULL,
  recipient_id       UUID          NOT NULL,
  created            TIMESTAMP     NOT NULL,
  status             BOOLEAN       NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users (id)
);

