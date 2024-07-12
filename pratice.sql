
-- create
CREATE TABLE EMPLOYEE (
  empId int,
  name varchar(15),
  dept varchar(10)
);

-- insert
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (1, 'Clark', 'Sales');
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (2, 'Dave', 'Accounting');
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (3, 'Ava', 'Sales');

-- fetch 
SELECT * FROM EMPLOYEE;

create table place(
   place_id int,
   place_name varchar(15),
   place_des varchar(20),
   place_type int,
   visitingemp_id int
);

Insert into place(place_id,place_name,place_des,place_type,visitingemp_id) values (01, 'puri' , 'tourist' , 10, 1)
Insert into place(place_id,place_name,place_des,place_type,visitingemp_id) values (02, 'bbsr' , 'tourist' , 08, 2)
Insert into place(place_id,place_name,place_des,place_type,visitingemp_id) values (03, 'ctc' , 'tourist' , 05, 3)

select * from place;

CREATE TABLE product (
  productId int,
  productname varchar(20)
  
);
  
INSERT INTO product(productId,productname) VALUES (001, 'mobile')
INSERT INTO product(productId,productname) VALUES (002, 'television')
INSERT INTO product(productId,productname) VALUES (003, 'air conditioner')

select * from product
select * from place
join EMPLOYEE on place.place_id = EMPLOYEE.empId
join product
 on place.place_id = product.productId

GO