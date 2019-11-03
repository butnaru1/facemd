insert into user (id, username, password, active, email) values (1, 'admin', '123', true, 'oleg@mail.com');
insert into user_role (user_id, roles) values (1, 'USER'), (1, 'ADMIN');
