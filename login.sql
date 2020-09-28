create table login(
account varchar(120),
passwords varchar(120)
);


insert into login values ('admin','admin');

delimiter $$
create procedure check_login(
in acc varchar(120),
in pass varchar (120)
)
begin
select * from login where login.account = acc and login.passwords = pass;
end $$
delimiter ; 
call check_login('admin','admin');