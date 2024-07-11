
CREATE TABLE Bank(
Bank_name varchar(100) NOT NULL,
Bank_Code int primary key,
Address varchar(100) NOT NULL
)


--Insert into Bank values('Bank_name' , 'Bank_code' , 'address' , 'bank_code')
Insert into Bank values('BANK OF INDIA' , 254256 , 'GRAND ROAD PURI')
Insert into Bank values('BANK OF BARODA' , 854856 , 'CSPUR BHUBANESWAR')
Insert into Bank values('STATE BANK OF INDIA' , 456987 , 'BHUBANESWAR')


create table branch(
Branch_id int identity(1,1) primary key,
branch_name varchar(100) unique ,
address varchar(100) not null ,
bank_code int foreign key REFERENCES Bank(bank_code) on DELETE CASCADE

)
--Insert into branch (branch_id, branch_name ,address,bank code)
Insert into branch values( 'main branch' , 'temple road', 254256)
Insert into branch values('badgada' ,'cspur', 854856)
Insert into branch values(' v.v marg ' ,'old town', 456987)


create table customer(
customer_id int identity(1,1) primary key,
name varchar(50) not null,
phone_number nvarchar(13) not null,
address varchar(100) not NULL

)
--Insert into customer value(customer_id, name, phone_number ,address)
insert into customer values('Anjali' , 9337744911 , 'OD 007' )
insert into customer values('Rojaline' , 9527546845 , 'OD 009' )
insert into customer values('Anshuman' , 9853454823 , 'OD 012' )



SELECT * from Bank;
SELECT * from Branch;
SELECT * from customer;
