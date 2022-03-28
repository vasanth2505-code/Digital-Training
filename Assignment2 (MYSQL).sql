create database HMS1;

create table Doctor_master(
	doctor_id varchar(15) primary key not null,
    doctor_name varchar(15) not null,
    Dept varchar(15) not null,
    constraint U_docId unique(doctor_id)
    );
drop table doctor_master;

insert into doctor_master(doctor_id, doctor_name, dept)
values("D0001", "Nick", "ENT"),("D0002", "Josie", "ENT"), ("D0003", "Samita", "Cardio"),
("D0004","Janita", "Surgery"), ("D0005", "Shakila", "MD"),("D0006", "Neha", "MBBS");

select*from doctor_master;

create table room_master(
	room_no varchar(15) not null,
    room_type varchar(15) not null,
    status varchar(15) not null,
    constraint u_room unique(room_no)
    );
desc room_master;
    
insert into room_master(room_no, room_type, status)
values("R0001", "AC", "occupied"), ("R0002", "Suite", "vacant"), ("R0003", "NonAC", "vacant"),
("R0004", "NonAC", "occupied"), ("R0005", "AC", "vacant"), ("R0006", "AC", "occupied");

select*from room_master;

create table PATIENT_MASTER(
	pid varchar(15) not null,
    name varchar(15) not null,
    age int(15) not null,
    weight int(15) not null,
    gender varchar(10) not null,
    address varchar(50) not null,
    phone_no varchar(10) not null,
    Disease varchar(50) not null,
    Doctor_id varchar(5),
    constraint Fk_Doc_id foreign key(Doctor_id)
    references doctor_master(doctor_id),
    constraint u_pid unique(pid)
    );
drop table patient_master;

insert into patient_master(pid, name, age, weight, gender, address, phone_no,disease, Doctor_id)
values("P0001", "Sita", 25, 50, "F", "Madurai", "9458656502", "Eye infection", "D0002"),
("P0002", "Josh", 40,  80, "M", "Mumbai", "6325689452", "Asthma", "D0005"),
("P0003", "Jana", 28, 60, "F", "Chennai", "9785236419", "Pain in heart", "D0003");

insert into patient_master(pid, name, age, weight, gender, address, phone_no,disease, Doctor_id)
values("P0004", "ChandraBose", 28, 85, "M", "Bangalore", "9965893210", "Asthma", "D0001"),
("P0005", "Pandit", 32, 65, "M", "Delhi", "8568925632", "Pain in stomach", "D0006");

select*from patient_master;

create table room_allocation(
	room_no varchar(15) not null,
    pid varchar(15),
    admission_date date not null,
    release_date date,
    constraint fk_rNo foreign key(room_no) references room_master(room_no),
    constraint fk_pid1 foreign key(pid) references patient_master(pid)
    );
desc room_allocation;

insert into room_allocation(room_no, pid, admission_date, release_date)
values("R0001", "P0001", "2016-10-15", "2016-10-26");
    
 insert into room_allocation(room_no, pid, admission_date, release_date)
 values("R0002", "P0002", "2016-11-15", "2016-11-26"),("R0002", "P0003", "2016-12-01", "2016-12-30"),
 ("R0004", "P0001", "2017-01-17", "2017-01-30");
    
select*from room_allocation;


#Query1
select p.name from patient_master p
join room_allocation r on p.pid=r.pid
where month(admission_date) = 01;
    
#Query2

select name from patient_master
where gender="F" and disease!="Asthma";

#Query3
select gender, count(*) from patient_master
group by gender;
#or
select
	(select count(*) from patient_master
    where gender="M") as "Male",
    (select count(*) from patient_master
    where gender="F") as "Female"
    ;

#Query4
show tables;
select p.pid, r.room_type, p.name, d.doctor_id, d.doctor_name, r.room_no, rA.admission_date from doctor_master d
join patient_master p on d.doctor_id=p.doctor_id
join room_allocation rA on rA.pid=p.pid
join room_master r on rA.room_no=r.room_no;