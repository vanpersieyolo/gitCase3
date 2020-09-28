create database SellCar;
use sellcar;
create table carts(
	cart_id int primary key auto_increment
);
create table cars(
car_id int primary key auto_increment,
car_name varchar(120) not null,
car_img varchar(255),
car_price varchar(100),
car_description varchar(255)
);
create table orders(
cart_id int,
car_id int,
foreign key (cart_id) references carts(cart_id),
foreign key (car_id) references cars(car_id)
);


delimiter $$
create procedure delete_car(car_id int)
	begin
    delete from cars where cars.car_id = car_id;
    end $$
delimiter ;

delimiter $$
create procedure get_car_by_id(car_id int)
begin
	select * from cars
    where cars.car_id = car_id;
end $$
delimiter ;

delimiter $$
create procedure insert_car( in car_nameip varchar(255) ,in car_imgip varchar(255),in car_priceip varchar(100), in car_descriptionip varchar(255))
begin
insert into cars(car_name,car_img, car_price,car_description) values (car_nameip,car_imgip, car_priceip,car_descriptionip);
end $$
delimiter ;
drop procedure insert_car;
call insert_car('BMW','bmwx2.png','1.000.500.000VND','BMW');

delimiter $$
create procedure select_all()
begin
select * from cars;
end $$
delimiter ;

-- hàm sửa
delimiter $$
create procedure update_car(car_pro_id int,
car_pro_name varchar(120),
car_pro_img varchar(255),
car_pro_price varchar(100),
car_pro_des varchar(255))
begin
	update cars
    set car_name =car_pro_name,
    car_img=car_pro_img,
    car_price=car_pro_price,
    car_description = car_pro_des
    where cars.car_id=car_pro_id;
end $$
delimiter ;
drop procedure update_car;

call select_all();
delete from cars where cars.car_id = 6;
call update_car(4,'BMW china','bmwx2.png','1.000.500.000VND','xe deu');


create table bookdate(
	customer_id int primary key auto_increment,
    customer_name varchar(50) not null,
    customer_phone varchar(20) not null,
    customer_email varchar (50) not null,
    order_date date,
    car_id int,
    foreign key (car_id) references cars(car_id)
);	
delimiter $$
create procedure book_car( book_name varchar(50),
book_phone varchar(20),
book_email varchar (50),
book_order_date date,
car_id int)
begin
	insert into bookdate(customer_name, customer_phone, customer_email,order_date,car_id)
    values(book_name,book_phone,book_email,book_order_date,car_id);
end $$
delimiter ;
select * from bookdate;
delimiter $$
create procedure select_calendar_book()
begin
	select bookdate.customer_name, bookdate.customer_phone,bookdate.customer_email,bookdate.order_date,
		cars.car_id, cars.car_name from bookdate
        join cars where cars.car_id = bookdate.car_id;
end $$
delimiter ;
call select_calendar_book();