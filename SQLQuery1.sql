create database shopping
use shopping
go

create table product(
id int identity primary key,
name nvarchar(50),
price float,
)

insert into product values('iphone', 1000)
insert into product values('iphone2', 2000)
insert into product values('iphone3', 3000)
insert into product values('iphone4', 4000)
insert into product values('iphone5', 5000)
insert into product values('iphone6', 6000)
insert into product values('iphone7', 7000)
insert into product values('iphone8', 8000)
insert into product values('iphone9', 9000)
insert into product values('iphone10', 1100)
insert into product values('iphone11', 1100)

create table Users(
username nvarchar(20) primary key,
password nvarchar(20)
)

insert into Users values('admin', 'admin')

select * from Users
select * from product