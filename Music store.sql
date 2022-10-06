
create table p_type(
p_type_id int not null,
p_type_name varchar(20)
);
alter table p_type add constraint type_PK Primary key(p_type_id);

create table company(
company_id int not null,
company_name varchar(30)
);
alter table company add constraint company_PK Primary key(company_id);

create table performer(
performer_id int not null,
performer_name varchar(30)
);
alter table performer add constraint performer_PK Primary key(performer_id);

create table genre(
genre_id int not null,
genre_name varchar(30)
);
alter table genre add constraint genre_PK Primary key(genre_id);

create table product(
product_id int not null,
year_published date,
product_name varchar(30),
price number(6,2),
genre_id int not null,
company_id int not null,
performer_id int not null,
p_type_id int not null
);
alter table product add constraint product_PK Primary key(product_id);
alter table product add constraint product_genre_FK Foreign key(genre_id) references genre(genre_id);
alter table product add constraint product_company_FK Foreign key(company_id) references company(company_id);
alter table product add constraint product_performer_FK Foreign key(performer_id) references performer(performer_id);
alter table product add constraint product_type_FK Foreign key(p_type_id) references p_type(p_type_id);

create table e_position(
e_position_id int not null,
position_name varchar(20)
);
alter table e_position add constraint e_position_PK Primary key(e_position_id);

create table employee(
employee_id int not null,
employee_name varchar(30),
phone_number varchar(10),
e_position_id int not null
);
alter table employee add constraint employee_PK Primary key(employee_id);
alter table employee add constraint employee_position_FK Foreign key(e_position_id) references e_position(e_position_id);

create table customer(
customer_id int not null,
customer_name varchar(30),
address varchar(30),
phone_number varchar(10)
);
alter table customer add constraint customer_PK Primary key(customer_id);

create table sale(
sale_id int not null,
sale_date date,
employee_id int not null,
customer_id int not null
);
alter table sale add constraint sale_PK Primary key(sale_id);
alter table sale add constraint sale_employee_FK Foreign key(employee_id) references employee(employee_id);
alter table sale add constraint sale_customer_FK Foreign key(customer_id) references customer(customer_id);

create table item(
quantity int,
product_id int not null,
sale_id int not null
);
alter table item add constraint item_product_FK Foreign key(product_id) references product(product_id);
alter table item add constraint item_sale_FK Foreign key(sale_id) references sale(sale_id);


insert into company values(1, 'Seven Eight');
insert into company values(2, 'Nuclear Blast');
delete from company where company_id = 1;

insert into genre values(1, 'pop-folk');
insert into genre values(2, 'metal');
insert into genre values(3, 'rap');
delete from genre where genre_id = 3;

insert into performer values(1, 'Slavi Trifonov');
insert into performer values(2, 'Joakim Broaden');
insert into performer values(3, 'Eminem');
delete from performer where performer_id = 3;

insert into p_type values(1, 'CD');
insert into p_type values(2, 'Disk');
insert into p_type values(3, 'Blue-Ray');
update p_type set p_type_name = 'DVD' where p_type_id = 2;
delete from p_type where p_type_id = 3;

insert into product values(1, '15-AUG-2002', 'Nie Produlzhavame', 16.50, 1, 1, 1, 2);
insert into product values(2, '8-SEP-2000', 'Vaxpopuli', 12.60, 1, 1, 1, 1);
insert into product values(3, '2-FEB-2003', 'No Mercy', 16.50, 1, 1, 1, 3);
insert into product values(4, '27-AUG-2001', '40 to 1', 19.99, 2, 2, 2, 1);
insert into product values(5, '6-OCT-2004', 'Primo Victoria', 19.99, 2, 2, 2, 3);
insert into product values(6, '3-JAN-2005', 'Last Stand', 19.99, 2, 2, 2, 1);
insert into product values(7, '1-AUG-2001', 'Til I Collapse', 10.20, 3, 2, 3, 2);
insert into product values(8, '30-JUN-2009', 'Rap God', 10.20, 3, 2, 3, 1);
insert into product values(9, '19-MAR-2002', 'Without me', 23.99, 3, 2, 3, 3);
update product set price = 17.99 where product_id = 8;
delete from product where product_id = 9;

insert into e_position values(1, 'clerk');
insert into e_position values(2, 'manager');
insert into e_position values(3, 'advertiser');
delete from e_position where e_position_id = 3;

insert into employee values(1, 'Hristo Ivanov', '0893140560', 1);
insert into employee values(2, 'Georgi Lazarov', '0893535187', 1);
insert into employee values(3, 'Boris Petkov', '0873037189', 2);
insert into employee values(4, 'Hristo Plamenov', '0863137123', 3);
update employee set employee_name = 'Petar Vasilev' where employee_id = 4;
delete from employee where employee_id = 4;

insert into customer values(1, 'Bozhana Stancheva', 'Vasil Levski 15', '0817534480');
insert into customer values(2, 'Petar Stoilov', 'tsar Samuil 4', '0847339085');
insert into customer values(3, 'Martin Stoyanov', 'Trakia 6', '0893584581');
insert into customer values(4, 'Todor Petkov', 'Studetska 9', '0827572692');
insert into customer values(5, 'Kolyo Grigorov', 'Hristo Botev 12', '0893084083');
insert into customer values(6, 'Mustafa Cholakov', 'Saedinenie 8', '0823981029');
update customer set address = 'Trakia 3' where customer_id = 3;
delete from customer where customer_id = 6;

insert into sale values(1, '22-AUG-2021', 1, 1);
insert into sale values(2, '19-SEP-2021', 2, 1);
insert into sale values(3, '20-SEP-2021', 1, 2);
insert into sale values(4, '20-SEP-2021', 3, 1);
insert into sale values(5, '22-SEP-2021', 1, 6);
insert into sale values(6, '25-SEP-2021', 2, 5);
insert into sale values(7, '26-SEP-2021', 1, 3);
insert into sale values(8, '28-SEP-2021', 4, 4);
insert into sale values(9, '28-SEP-2021', 1, 3);
insert into sale values(10, '2-OCT-2021', 2, 1);
insert into sale values(11, '5-OCT-2021', 1, 2);
insert into sale values(12, '6-OCT-2021', 2, 5);
insert into sale values(13, '8-OCT-2021', 1, 6);
insert into sale values(14, '8-OCT-2021', 2, 2);
insert into sale values(15, '10-OCT-2021', 1, 1);
insert into sale values(16, '11-OCT-2021', 2, 1);
insert into sale values(17, '15-OCT-2021', 1, 2);
insert into sale values(18, '19-OCT-2021', 2, 5);
insert into sale values(19, '20-OCT-2021', 4, 1);
insert into sale values(20, '20-OCT-2021', 2, 2);
insert into sale values(21, '21-OCT-2021', 2, 3);
update sale set customer_id = 2 where sale_id = 4;
delete from sale where sale_id = 21;

insert into item values(2, 9, 1);
insert into item values(1, 1, 1);
insert into item values(1, 5, 2);
insert into item values(3, 2, 3);
insert into item values(1, 3, 4);
insert into item values(1, 6, 4);
insert into item values(2, 7, 4);
insert into item values(1, 4, 5);
insert into item values(1, 8, 6);
insert into item values(1, 2, 7);
insert into item values(1, 9, 7);
insert into item values(4, 5, 8);
insert into item values(1, 3, 9);
insert into item values(1, 8, 10);
insert into item values(2, 1, 11);
insert into item values(2, 7, 11);
insert into item values(1, 1, 12);
insert into item values(1, 6, 13);
insert into item values(3, 8, 14);
insert into item values(1, 4, 15);
insert into item values(2, 7, 16);
insert into item values(1, 4, 17);
insert into item values(1, 8, 18);
insert into item values(2, 2, 19);
insert into item values(1, 5, 19);
insert into item values(4, 5, 19);
insert into item values(1, 3, 19);
insert into item values(1, 8, 20);
insert into item values(1, 2, 20);
insert into item values(2, 7, 20);
insert into item values(1, 3, 20);
insert into item values(4, 6, 21);
insert into item values(3, 8, 21);
insert into item values(4, 9, 21);
update item set quantity=2 where sale_id = 15;
delete from item where product_id = 9 and sale_id =21;


select p.product_id, p.year_published, p.product_name, p.price, g.genre_name, c.company_name, pe.performer_name, t.p_type_name
from product p join genre g on p.genre_id = g.genre_id join company c on p.company_id = c.company_id join performer pe
on p.performer_id = pe.performer_id join p_type t on p.p_type_id = t.p_type_id where lower(t.p_type_name) like lower('&type');

select p.product_id, p.year_published, p.product_name, p.price, g.genre_name, c.company_name, pe.performer_name, t.p_type_name
from product p join genre g on p.genre_id = g.genre_id join company c on p.company_id = c.company_id join performer pe
on p.performer_id = pe.performer_id join p_type t on p.p_type_id = t.p_type_id where lower(pe.performer_name) like lower('&performer');

select p.product_id, p.year_published, p.product_name, p.price, g.genre_name, c.company_name, pe.performer_name, t.p_type_name
from product p join genre g on p.genre_id = g.genre_id join company c on p.company_id = c.company_id join performer pe
on p.performer_id = pe.performer_id join p_type t on p.p_type_id = t.p_type_id where lower(g.genre_name) like lower('&genre');

select p.product_id, p.year_published, p.product_name, p.price, g.genre_name, c.company_name, pe.performer_name, t.p_type_name
from product p join genre g on p.genre_id = g.genre_id join company c on p.company_id = c.company_id join performer pe
on p.performer_id = pe.performer_id join p_type t on p.p_type_id = t.p_type_id where extract(year from p.year_published) = &year_published;

select p.product_id, p.year_published, p.product_name, p.price, g.genre_name, c.company_name, pe.performer_name, t.p_type_name
from product p join genre g on p.genre_id = g.genre_id join company c on p.company_id = c.company_id join performer pe
on p.performer_id = pe.performer_id join p_type t on p.p_type_id = t.p_type_id where lower(c.company_name) like lower('&company');

--1
select s.sale_date, c.customer_name, e.employee_name, p.year_published, p.product_name, p.price,g.genre_name, c.company_name, pe.performer_name,
t.p_type_name from sale s join customer c on c.customer_id = s.customer_id 
join employee e on s.employee_id = e.employee_id join item i on i.sale_id = s.sale_id join product p on p.product_id = i.product_id
join genre g on g.genre_id = p.genre_id join p_type t on p.p_type_id = t.p_type_id join performer pe on pe.performer_id = p.performer_id
join company c on c.company_id = p.company_id
where lower(e.employee_name) like lower('&name') order by s.sale_date;

--2
select * from (select s.sale_date, c.customer_name, e.employee_name, p.year_published, p.product_name, p.price,g.genre_name, c.company_name, pe.performer_name,
t.p_type_name from sale s join customer c on c.customer_id = s.customer_id 
join employee e on s.employee_id = e.employee_id join item i on i.sale_id = s.sale_id join product p on p.product_id = i.product_id
join genre g on g.genre_id = p.genre_id join p_type t on p.p_type_id = t.p_type_id join performer pe on pe.performer_id = p.performer_id
join company c on c.company_id = p.company_id order by s.sale_date desc) where rownum <=5 order by employee_name;

--3
select i.quantity, p.product_name, t.p_type_name, s.sale_date, pe.performer_name, c.company_name from item i
join product p on i.product_id = p.product_id join sale s on i.sale_id = s.sale_id join p_type t
on p.p_type_id = t.p_type_id join customer c on s.customer_id = c.customer_id join performer pe on p.performer_id = pe.performer_id 
join company c on p.company_id = c.company_id where lower(c.customer_name) like lower('&customer')
order by t.p_type_name, s.sale_date;

--4
select i.quantity, p.product_name, t.p_type_name, c.company_name, pe.performer_name, s.sale_date, c.customer_name from item i
join product p on i.product_id = p.product_id join sale s on i.sale_id = s.sale_id join p_type t
on p.p_type_id = t.p_type_id join customer c on s.customer_id = c.customer_id join performer pe on p.performer_id = pe.performer_id 
join company c on p.company_id = c.company_id where s.sale_date between '&start_date' and '&end_date'
order by c.customer_name, s.sale_date;
