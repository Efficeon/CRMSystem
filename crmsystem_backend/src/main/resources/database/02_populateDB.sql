-- roles
INSERT INTO roles VALUES (DEFAULT, 'ROLE_USER');
INSERT INTO roles VALUES (DEFAULT, 'ROLE_ADMIN');

-- insert into deals(budget, dealstatusid) VALUES ('testdeal', 10000, 1);

INSERT INTO dealstatus VALUES (DEFAULT,'INITIATED');
INSERT INTO dealstatus VALUES (DEFAULT, 'IN PROCESS');
INSERT INTO dealstatus VALUES (DEFAULT, 'COMPLETED');