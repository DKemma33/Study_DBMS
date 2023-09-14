use study;

create table tbl_member(
   id bigint unsigned auto_increment primary key,
   member_id varchar(255) not null unique,
   member_password varchar(255) not null,
   member_email varchar(255) not null unique,
   member_birth date
);


create table tbl_product(
   id bigint unsigned auto_increment primary key,
   product_name varchar(255) not null,
   product_price int default 0,
   product_stock int default 0
);

create table tbl_order(
   id bigint unsigned auto_increment primary key,
   order_date datetime default current_timestamp(),
   member_id bigint unsigned,
   product_id bigint unsigned,
   constraint fk_order_member foreign key(member_id)
   references tbl_member(id),
   constraint fk_order_product foreign key(product_id)
   references tbl_product(id)
);

insert into tbl_order(member_id)
values(1);

select * from tbl_order;

/*상품을 1개 추가하고, 1번 회원의 주문 정보 중 추가된 상품의 번호로 수정하기*/
insert into tbl_product
(product_name, product_price, product_stock)
values('마우스', 35000, 60);

select * from tbl_product;

update tbl_order
set product_id = 1
where id = 1;
/*where product_id is null;*//*안돼요!*/


select id, member_id, member_password, member_email, member_birth from tbl_member;
select * from tbl_member;

insert into tbl_member (member_id, member_password, member_email, member_birth)
values('hds1234', '1234', 'tedhan1204@gmail.com', str_to_date('2000-12-04', '%Y-%m-%d'));

/*문자열을 date타입의 컬럼에 추가할 때에는 자동 형변환된다.*/
insert into tbl_member (member_id, member_password, member_email, member_birth)
values('hgd9876', '9999', 'hgd1234@gmail.com','2010-05-05');

update tbl_member
set member_email = 'dev.tedhan@gmail.com'
where id = 1;

delete from tbl_member
where id = 2;
/******************************************************************************************/
drop table tbl_member;
drop table tbl_product;
drop table tbl_order;

create table tbl_member(
   id bigint unsigned auto_increment primary key,
   member_id varchar(255) not null unique,
   member_password varchar(255) not null,
   member_email varchar(255) not null unique,
   member_birth date
);

create table tbl_post(
   id bigint unsigned auto_increment primary key,
   post_title varchar(255) not null,
   post_content varchar(255) not null,
   member_id bigint unsigned,
   constraint fk_post_member foreign key(member_id)
   references tbl_member(id)
);

/*댓글에 게시글 번호 FK로 추가하기*/
create table tbl_reply(
   id bigint unsigned auto_increment primary key,
   reply_content varchar(255) not null,
   member_id bigint unsigned,
   post_id bigint unsigned,
   constraint fk_reply_member foreign key(member_id)
   references tbl_member(id),
   constraint fk_reply_post foreign key(post_id)
   references tbl_post(id)
);

alter table tbl_reply add post_id bigint unsigned;

alter table tbl_reply add constraint fk_reply_post foreign key(post_id)
references tbl_post(id);

/*회원가입 하기*/
select * from tbl_member;

insert into tbl_member(member_id, member_password, member_email, member_birth)
values('jang2343', '4567', 'jangdh51@gmail.com', '1994-10-12');

/*게시글을 한 개 추가하기*/
select * from tbl_post;
insert into tbl_post(post_title, post_content, member_id)
values('배불러', '진짜', 1);

/*추가된 게시글에 댓글 2개 작성하기*/
select * from tbl_reply;
insert into tbl_reply(reply_content, member_id)
values('댓글 테스트2', 1);

UPDATE tbl_post
SET id = 2
WHERE id = 8;


/*회원 정보 중 아이디 수정하기*/
update tbl_member
set member_id = 'hgd1234'
where id = 1;

select * from tbl_member;

/*1개 게시글의 제목 수정하기*/
update tbl_post
set post_title = '수정된 제목'
where id = 1;

select * from tbl_post;

/*1개 게시글의 모든 댓글의 내용을 같은 내용으로 수정하기*/
update tbl_reply
set reply_content = '수정된 내용'
where post_id = 1;

select * from tbl_reply;
/*****************************************************************/
create table tbl_file(
   id bigint unsigned auto_increment primary key,
   file_name varchar(255),
   file_uuid varchar(255),
   file_path varchar(255),
   file_represent varchar(255),
   member_id bigint unsigned,
   constraint fk_file_member foreign key(member_id)
   references tbl_member(id)
);

select * from tbl_member;


/*사용자의 프로필 사진을 3개 추가한다.*/
/*사용자의 프로필 사진 중 대표 이미지를 모두 가져오기*/
/*2번 프로필 사진의 회원번호를 알아내서*/
/*프로필 사진의 주인 정보를 조회하기*/
/*다른 이미지를 대표로 설정하기(1번 회원)*/
/*대표 이미지가 아닌 이미지를 파일의 이름으로 삭제하기(1번 회원)*/


INSERT INTO tbl_file
(file_name, file_uuid, file_path, file_represent, member_id)
VALUES('전성기.png', 'fjiodsk_fdu67kol_3128', '2023/07/07', 'NO', 1);

select *from tbl_file


INSERT INTO tbl_file
(file_name, file_uuid, file_path, file_represent, member_id)
VALUES('전성기2.png', 'fjiodsk_fdskol_3128', '2023/07/06', 'YES', 1);

INSERT INTO tbl_file
(file_name, file_uuid, file_path, file_represent, member_id)
VALUES('전성기3.png', 'fjiodsk_fdnbvnskol_3128', '2023/07/06', 'NO', 1);

select * from tbl_member;
select * from tbl_file;

/*사용자의 프로필 사진 중 대표 이미지를 모두 가져오기*/
select * from tbl_file
where file_represent = 'YES';

/*2번 프로필 사진의 회원번호를 알아내서*/
select * from tbl_file
where id = 2;

/*프로필 사진의 주인 정보를 조회하기*/
select * from tbl_member
where id = 1;

/*다른 이미지를 대표로 설정하기(1번 회원)*/
select * from tbl_file;

update tbl_file
set file_represent = 'YES'
where id = 1;

update tbl_file
set file_represent = 'NO'
where id = 3;

/*대표 이미지가 아닌 이미지를 파일의 이름으로 삭제하기(1번 회원)*/

select * from tbl_file;

delete from tbl_file
where file_represent = 'NO' AND file_name = '전성기2.png';
/********************************************************************/
/* alias: 별칭*/
/* select절, from절에서 사용가능*/
/* select 컬럼명 as 별칭 from 테이블명*/
/* select 컬럼명 별칭 from 테이블명*/
select concat('아이디는 ', m.member_id) as intro from tbl_member m;

/* like: 포함된 문자열 값을 찾고, 문자의 개수도 제한을 줄 수 있다.*/
/* %: 모든 것*/
/* _: 글자 수*/


select * from tbl_file

/* alias: 별칭*/
/* select절, from절에서 사용가능*/
/* select 컬럼명 as 별칭 from 테이블명*/
/* select 컬럼명 별칭 from 테이블명*/
select concat('아이디는 ', m.member_id) as intro from tbl_member m;

/* like: 포함된 문자열 값을 찾고, 문자의 개수도 제한을 줄 수 있다.*/
/* %: 모든 것*/
/* _: 글자 수*/

/*
 * -- 예시
 * '%A': A로 끝나는 모든 값(SDNMFKLSMA, 123NHFUA)
 * 'A%': A로 시작하는 모든 값(APPLE1234, APP)
 * 'A__': A로 시작하면서 3글자인 값(ABC, ACE)
 * 'A_': A로 시작하면 2글자인 값
 * '%A%': A가 포함된 값(ABC, BAC, BCA)
 * */

create table tbl_student(
   id bigint unsigned auto_increment primary key,
   student_name varchar(255) not null,
   student_major varchar(255) not null,
   student_level int default 1
);

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('한동석', '컴퓨터 공학', 1);

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('홍길동', '전자 공학', 2);

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('장동혁', '야구', 2);

insert into tbl_student
(student_name, student_major, student_level)
(select student_name, student_major, student_level from tbl_student);

select * from tbl_student
where student_major like '%공학%'

select *from tbl_student 
where student_level like 2;

select * from tbl_student
where student_major like '____공학'

/*학생 이름 중에서 홍씨 찾기*/

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('장동혁', '컴퓨터 공학', 1);

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('홍이나', '의류 패션', 2);

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('이순신', ' 체육과', 2);

select * from tbl_student
where student_name like '홍%';

/*집계 함수*/
/*결과가 1개 나온다.*/
/*
 * avg()
 * max()
 * min()
 * sum()
 * count()
 * 
 * */
create table tbl_subject(
   id bigint unsigned auto_increment primary key,
   subject_name varchar(255) not null,
   subject_score int default 0
);



INSERT INTO tbl_subject
(subject_name, subject_score)
VALUES('정보와 윤리', 10);

INSERT INTO tbl_subject
(subject_name, subject_score)
VALUES('산업혁명의 대가', 5);

INSERT INTO tbl_subject
(subject_name, subject_score)
VALUES('현대미술의 암기', 7);

INSERT INTO tbl_subject
(subject_name, subject_score)
VALUES('사회적 의존관계 수립', 8);

select * from tbl_subject;

select 
avg(subject_score) as "average",
sum(subject_score) as "total",
max(subject_score) as "max",
min(subject_score) as "min",
count(subject_score) as "count"
from tbl_subject;

/*수강 신청 테이블*/
drop table tbl_student_subject;
create table tbl_student_subject(
   id bigint unsigned auto_increment primary key,
   subject_grade varchar(255),
   subject_status varchar(255),
   student_id bigint unsigned,
   subject_id bigint unsigned,
   constraint fk_student_subject_student foreign key(student_id)
   references tbl_student(id),
   constraint fk_student_subject_subject foreign key(subject_id)
   references tbl_subject(id)
);

alter table tbl_student_subject change subject_grade subject_grade int;
alter table tbl_student_subject change subject_status subject_status varchar(255) default 'DONE';
/*수강 완료한 학생들 정보 추가*/
insert into tbl_student_subject 
(subject_grade, student_id, subject_id)
values (98, 1, 1);
insert into tbl_student_subject 
(subject_grade, student_id, subject_id)
values (85, 2, 2);
insert into tbl_student_subject 
(subject_grade, student_id, subject_id)
values (40, 3, 3);

select *from tbl_student_subject;
select sum(subject_grade) "sum" from tbl_student_subject
where student_id = 1;
select avg(subject_grade) "avg" from tbl_student_subject;
select max(subject_grade) "max" from tbl_student_subject;
select min(subject_grade) "min" from tbl_student_subject;
select count(subject_grade) "count" from tbl_student_subject;
 	  
se
/** 
 * max()
 * min()
 * sum()
 * count()*/
/*총 점수*/
/*평균 점수*/
/*수강 신청한 학생 수*/


select * from tbl_subject;
select * from tbl_student;
/*
 * group by: 묶을 때 사용(~별)
 * 
 * group by 컬럼명 having 조건식
 * 
 * */
select student_id, count(id) "count" 
from tbl_student_subject
group by subject_id;


select * from tbl_subject;
select * from tbl_student_subject;

/*
 * group by 후 전체 조회 시
 * 중복된 데이터는 가장 먼저 찾은 데이터로 조회된다.
 * */
select * from tbl_student_subject
group by student_id;

select student_id, subject_id from tbl_student_subject
group by student_id, subject_id;

select student_id, count(student_id) from tbl_student_subject
group by student_id;

select student_id, avg(subject_grade) average from tbl_student_subject
group by student_id;

select subject_id, count(student_id) from tbl_student_subject
group by subject_id;

drop table tbl_reply;
drop table tbl_post;
drop table tbl_file;
drop table tbl_member;

create table tbl_member(
   id bigint unsigned auto_increment primary key,
   member_type varchar(255) default 'basic',
   member_id varchar(255) unique not null,
   member_password varchar(255) not null
);

insert into tbl_member(member_id, member_password)
values('hds', '1234');

insert into tbl_member(member_id, member_password)
values('hgd', '1234');

insert into tbl_member(member_id, member_password)
values('lss', '1234');

select * from tbl_member;

create table tbl_office(
   id bigint unsigned auto_increment primary key,
   office_name varchar(255),
   office_location varchar(255)
);

insert into tbl_office(office_name, office_location)
values('강남점', '강남구');


insert into tbl_office(office_name, office_location)
values('노원점', '노원구');

insert into tbl_office(office_name, office_location)
values('분당점', '분당');

insert into tbl_office(office_name, office_location)
values('인천점', '인천');

select * from tbl_office;

create table tbl_conference_room(
   id bigint unsigned auto_increment primary key,
   office_id bigint unsigned,
   constraint conference_room_office_office foreign key(office_id)
   references tbl_office(id)
);

insert into tbl_conference_room
(office_id)
values (4);

select * from tbl_conference_room;

create table tbl_part_time(
   id bigint unsigned auto_increment primary key,
   start_time datetime,
   end_time datetime,
   conference_room_id bigint unsigned,
   constraint part_time_conference_room foreign key(conference_room_id)
   references tbl_conference_room(id)
);

alter table tbl_part_time change start_time start_time time;
alter table tbl_part_time change end_time end_time time;

insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 11);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 1);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 9);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('16:00:00', '18:00:00', 7);

select * from tbl_part_time;

/*시작 시간별 회의실 개수*/
select start_time, end_time, count(conference_room_id) from tbl_part_time
group by start_time, end_time;

select current_time  from dual;

create table tbl_reservation(
   id bigint unsigned auto_increment primary key,
   member_id bigint unsigned,
   conference_room_id bigint unsigned,
   constraint reservation_member foreign key(member_id)
   references tbl_member(id),
   constraint reservation_conference_room foreign key(conference_room_id)
   references tbl_conference_room(id)
);

select * from tbl_conference_room;

insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('16:00:00', '18:00:00', 7);

/*회의실 별 등록 인원 수*/
select conference_room_id, count(member_id) from tbl_reservation
group by conference_room_id;

/*회의실 별 등록 인원 수가 2명이 넘는 회의실 조회*/
select conference_room_id, count(member_id) from tbl_reservation
group by conference_room_id 
having count(member_id) > 2;







/*============================================================================*/
/*PRACTICE*/

drop table tbl_company;
create table tbl_company(
   id bigint unsigned auto_increment primary key,
   company_name varchar(255) not null,
   company_address varchar(255) not null,
   company_telecom varchar(20) not null
);

select * from tbl_company;
insert into tbl_company(company_name, company_address, company_telecom)
values ('코카콜라', '평택', '031-123-4567');

/*SELECT id FROM tbl_company;
DELETE FROM tbl_company WHERE id >= 3;*/
 

/*----------------------------------------------------------------*/
drop table tbl_user;
create table tbl_user(
   id bigint unsigned auto_increment primary key,
   user_name varchar(255) not null,
   user_address varchar(255) not null,
   user_phone varchar(20) not null
);

select *from tbl_user;
select count(user_address)"count"
from tbl_user where user_address = '역삼';

select concat('이름:    ',user_name) as name from tbl_user;
select concat('주소:    ',user_address)as address from tbl_user;
select *from tbl_user
where user_name like '김%';
where user_phone like '%5411%';
where user_phone like '%5411';
select user_address, count(user_name)from tbl_user
group by user_address;


INSERT INTO tbl_user
(user_name, user_address, user_phone)
VALUES('장동혁', '한티', '010-6237-7087');
INSERT INTO tbl_user
(user_name, user_address, user_phone)
VALUES('송은령', '선릉', '010-4115-9446');
INSERT INTO tbl_user
(user_name, user_address, user_phone)
VALUES('주혜리', '역삼', '010-9967-8525');
INSERT INTO tbl_user
(user_name, user_address, user_phone)
VALUES('윤수정', '삼성', '010-7494-5423');
INSERT INTO tbl_user
(user_name, user_address, user_phone)
VALUES('장원서', '건대', '010-9461-6135');
INSERT INTO tbl_user
(user_name, user_address, user_phone)
VALUES('김인', '강남', '010-6131-5411');
INSERT INTO tbl_user
(user_name, user_address, user_phone)
VALUES('김효', '역삼', '010-6137-5411');

/*UPDATE tbl_user
SET user_name='김효', user_address='역삼', user_phone='010-5455-9566'
WHERE id=4;
UPDATE tbl_user
SET user_name='김남주', user_address='삼성', user_phone='010-5455-5444'
WHERE id=4;
UPDATE tbl_user
SET user_name='김형욱', user_address='교대', user_phone='010-4659-4115'
WHERE id=4;*/
/*--------------------------------------------------------------*/
drop table tbl_product;
create table tbl_product(
   id bigint unsigned auto_increment primary key,
   product_name varchar(255) not null,
   product_price int default 0,
   product_stock int default 0,
   company_id bigint unsigned,
   constraint fk_product_company foreign key(company_id)
   references tbl_company(id)
);

select * from tbl_product;
insert into tbl_product(product_name, product_price, product_stock, company_id)
values ('코카콜라', '1000', '100', 1);
insert into tbl_product(product_name, product_price, product_stock, company_id)
values ('스프라이트', '1000', '100', 1);
insert into tbl_product(product_name, product_price, product_stock, company_id)
values ('환타', '1000', '100', 1);
insert into tbl_product(product_name, product_price, product_stock, company_id)
values ('닥터페퍼', '1000', '100', 1);


/*---------------------------------------------------------------------------*/
drop table tbl_card;
create table tbl_card(
   id bigint unsigned auto_increment primary key,
   card_bank varchar(255) not null,
   user_id bigint unsigned,
   constraint fk_card_user foreign key(user_id)
   references tbl_user(id)
  );
alter table tbl_card add column card_number bigint not null;
alter table tbl_card rename column new_card_number to card_number;
update tbl_card
set card_number = 115855854587
where user_id = 7;
delete from tbl_card
where card_number = 1 ;
ALTER TABLE tbl_card
ADD COLUMN new_card_number bigint NOT NULL;
INSERT INTO tbl_card
(card_bank, user_id, card_number)
VALUES('농협', 4, 115456586611);

select user_id , card_bank  from tbl_card
group by card_bank ;

select card_bank,count(user_id) from tbl_card 
group by card_bank order by count(user_id) ;

/*--------------------------------------------------------------*/
create table tbl_bank_account(
   id bigint unsigned auto_increment primary key,
   account_number bigint not null,
   open_date date default (current_date),
   user_id bigint unsigned not null,
   card_id bigint unsigned not null,
   constraint fk_account_user foreign key(user_id)
   references tbl_user(id),
   constraint fk_account_card foreign key(card_id)
   references tbl_card(id)
);
select * from tbl_bank_account;
insert into tbl_bank_account 
(id, account_number, open_date, user_id, card_id)
values (7, 1234555628, current_date(), 7,7);

/*-----------------------------------------------------------*/
/*drop table tbl_payment;*/
create table tbl_payment(
   id bigint unsigned auto_increment primary key,
   user_id bigint unsigned,
   card_id bigint unsigned,
   order_id bigint unsigned not null,
   order_date date not null,
   constraint fk_payment_user foreign key(user_id)
   references tbl_user(id),
   constraint fk_payment_card foreign key(card_id)
   references tbl_card(id),
   constraint fk_payment_order foreign key(order_id, order_date)
   references tbl_order(id, order_date)
); 

select * from tbl_payment;
/*-----------------------------------------------------*/
create table tbl_sequence(
   id bigint unsigned auto_increment primary key,
   sequence_name varchar(255),
   current_value bigint unsigned
);
/*-------------------------------------------------------*/
/*drop table tbl_order;*/
/*주문 번호: 당일 1부터 시작, 당일 년 월 일*/
create table tbl_order(
   id bigint unsigned,
   order_date date default (current_date),
   user_id bigint unsigned,
   constraint fk_order_user foreign key(user_id)
   references tbl_user(id),
   constraint pk_order primary key(id, order_date)
);

/*drop table tbl_order;*/
INSERT INTO tbl_order
(id, order_date, user_id)
VALUES(1, curdate(), 1);

select * from tbl_order;
/*----------------------------------------------------------------*/
/*drop table tbl_order_detail;*/
create table tbl_order_detail(
   id bigint unsigned auto_increment primary key,
   order_id bigint unsigned not null,
   order_date date default (current_date),
   product_id bigint unsigned not null,
   product_count int not null,
   constraint fk_order_detail_order foreign key(order_id, order_date)
   references tbl_order(id, order_date),
   constraint fk_order_detail_product foreign key(product_id)
   references tbl_product(id)
);
select * from tbl_order_detail;

insert into tbl_order_detail (order_id, order_date, product_id, product_count)
values (2, curdate(), 2, 4);

/*================================================================*/
/*drop table tbl_users;*/
create table tbl_users(
   id bigint unsigned auto_increment primary key,
   users_name varchar(255) not null,
   users_id varchar(255) not null unique,
   users_password varchar(255) not null,
   users_email varchar(255) not null unique,
   users_birth date
);
select * from tbl_users;

INSERT INTO tbl_users
(users_name, users_id, users_password, users_email, users_birth)
VALUES('DK', 'JANGDH', '1234', 'JANG@GMAIL.COM', '1994-10-12');
INSERT INTO tbl_users
(users_name, users_id, users_password, users_email, users_birth)
VALUES('JAMES', 'JAMES122', '1233', 'JAMES@GMAIL.COM', '1996-11-12');
INSERT INTO tbl_users
(users_name, users_id, users_password, users_email, users_birth)
VALUES('EMMA', 'EMMU8', '1232', 'EMMU@GMAIL.COM', '1995-08-02');
INSERT INTO tbl_users
(users_name, users_id, users_password, users_email, users_birth)
VALUES('ERIK', 'EERIK', '4535', 'EK@GMAIL.COM', '1993-10-02');
INSERT INTO tbl_users
(users_name, users_id, users_password, users_email, users_birth)
VALUES('JOHN', 'JON', '0948', 'JON@GMAIL.COM', '1997-04-10');
INSERT INTO tbl_users
(users_name, users_id, users_password, users_email, users_birth)
VALUES('EMILY', 'EMLI', '5463', 'EM@GMAIL.COM', '1990-08-26');
INSERT INTO tbl_users
(users_name, users_id, users_password, users_email, users_birth)
VALUES('DRAKE', 'DRAKE33', '3311', 'DKE@GMAIL.COM', '1994-12-25');


/*--------------------------------------------------------*/
drop table tbl_coworking_space;
create table tbl_coworking_space(
	id bigint unsigned auto_increment primary key,
	office_name varchar(255) not null,
	office_address varchar(255) not null,
	users_id bigint unsigned,
	constraint fk_space_users foreign key (users_id)
	references tbl_users(id)
);
select * from tbl_coworking_space;

INSERT INTO tbl_coworking_space
(office_name, office_address, users_id)
VALUES('WEWORK역삼', '역삼', 1);
INSERT INTO tbl_coworking_space
(office_name, office_address, users_id)
VALUES('WEWORK역삼2', '역삼', 2);
INSERT INTO tbl_coworking_space
(office_name, office_address, users_id)
VALUES('WEWORK선릉1', '선릉', 3);
INSERT INTO tbl_coworking_space
(office_name, office_address, users_id)
VALUES('WEWORK선릉2', '선릉', 4);
INSERT INTO tbl_coworking_space
(office_name, office_address, users_id)
VALUES('WEWORK선릉3', '선릉', 5);
INSERT INTO tbl_coworking_space
(office_name, office_address, users_id)
VALUES('WEWORK삼성', '삼성', 6);
update tbl_coworking_space 
set users_id = 7
where id = 2;
/*--------------------------------------------------------*/
drop table tbl_conference_room;
create table tbl_conference_room(
   id bigint unsigned auto_increment primary key,
   coworking_space_id bigint unsigned,
   users_id bigint unsigned,
   constraint fk_conference_room_coworking_space foreign key(coworking_space_id)
   references tbl_coworking_space(id),
   constraint fk_conference_room_users foreign key (users_id)
   references tbl_users(id)
);

select * from tbl_conference_room;

INSERT INTO tbl_conference_room
(coworking_space_id)
VALUES(, 2);



/*--------------------------------------------------------*/
drop table tbl_part_time;
create table tbl_part_time(
   id bigint unsigned auto_increment primary key,
   start_time time,
   end_time time,
   conference_room_id bigint unsigned,
   constraint part_time_conference_room foreign key(conference_room_id)
   references tbl_conference_room(id)
);

select * from tbl_part_time;

insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 11);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 1);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 9);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('16:00:00', '18:00:00', 7);

/*=============================================================================*/
/*practice*/
create table employees(
	employee_id int,
	first_name varchar(50),
	last_name varchar(50),
	hourly_pay decimal(5, 2),
	hire_date date
);
select * from employees;
/*rename table employees to workers;*/
drop table employees;
alter table employees add phone_number varchar(15);
alter table employees rename column phone_number to email;
alter table employees modify column email varchar(100);
alter table employees modify email varchar(100)
after last_name; /* first; 는 첫번쨰 칸으로 간다 */
alter table employees drop column email;

insert into employees 
values (1, "Eugene", "Krabs", 25.50, "2023-01-02" );
insert into employees
values (2, "Squidward","Tentacles",15.00, "2023-01-03"),
       (3, "Spongebob","Squarepants", 12.50,"2023-01-04"),
	   (4, "Patrick","Star",12.50,"2023-01-05"),
	   (5, "Sandy","Cheeks",17.50,"2023-01-06");
select * from employees;
/*delete from employees where employee_id = 2;*/
insert into employees (employee_id, first_name, last_name)
values (6, "Sheldon", "plankton");

select first_name, last_name 
from employees
where employee_id = 1;

select * from employees 
where hourly_pay >= 15;

select * from employees 
where hire_date <= "2023-01-03";

select * from employees
where employee_id != 1;

select * from employees 
where hire_date is null;

select * from employees 
where hire_date is not null;

update employees 
set hire_date = "2023-01-07"
where employee_id = 6;
select * from employees;

/* alter table employees add constraint chk_hourly_pay check (hourly_pay >= 10.00); 추가 할 시에*/

select * from employees;
insert into employees
values (6, "Shaldon", "Plakton0", 9.00, "2023-01-07");
/*SQL Error [3819] [HY000]: Check constraint 'chk_hourly_pay' is violated.
 * check 를 사용해서 hourly_pay >= 10.00 시급이 10보다 낮으면 에러가 난다 */

/*delete from employees
where employee-id = 6;*/

/*set autocommit= off;    자동저장 끔*/
/*commit;                  켬      */
/*rollback;                실행취소  */
/*------------------------------------------*/
/*drop table test;
create table test(
 	my_date date,
 	my_time time,
 	my_datetime datetime
);
select * from test;
insert into test 
values (current_date()+1, null, null);
select * from test;*/
/*------------------------------------------*/

create table products(
	prodcut_id int,
	product_name varchar(25),
	price decimal(4,2) 
);
alter table products add constraint unique(product_name);
select * from products;

insert into products 
values (100, "hamburger", 3.99),
       (101, "fries",1.89), 
       (102, "soda",1.00), 
       (103, "ice cream",1.49);
       /*(104, "fries",1.75);*/ /*Duplicate entry 'fries' for key 'products.product_name'
       						 unique로 설정해 놓아서 같은 이름은 사용할수 없다 */
      
alter table products
modify price decimal(4,2) not null;
/*insert into product 
values (104, "cookie", null);    not null로 해 놓아서 에러가 난다 null값으로 해놓을수 없다*/


);

insert into products
values (104, "straw", 0.00),
	   (105,"napkin", 0.00),
	   (106, "fork", 0.00),
	   (107, "spoon", 0.00);
select * from products;

delete from products
where prodcut_id >= 104;
select * from products;

alter table products 

alter price set default 0;
insert into products
values (104, "straw", 0.00),
	   (105,"napkin", 0.00),
	   (106, "fork", 0.00),
	   (107, "spoon", 0.00);
	   
/*-------------------------------------------------*/	  
	  
create table transactions(
	transaction_id int,
	amount decimal(5,2),
	transaction_date datetime default now()
);

select * from transactions;
insert into transactions(transaction_id, amount)
values (3, 8.99);

alter table transactions 
add constraint primary key (transaction_id);

insert into transactions 
values (1002, 4.99);
select * from transactions;

alter table transactions  drop column transaction_date;

create table transactions(
	transaction_id int primary key auto_increment,
	amount decimal(5,2)
);

select *  from transactions;

insert into transactions (amount)
values (6.99);

alter table transactions auto_increment = 1000;
delete from transactions;

/*-----------------------------------------------------------------------*/

create table customers(
	customer_id int primary key auto_increment,
	first_name varchar(25),
	last_name varchar(25)
);

insert into customers(first_name, last_name)
values ("Frad","Fish"),
	   ("Larry","Lobstar"),
	   ("Bubble","Bass");
select * from customers;

create table transactions (
	transaction_id int primary key auto_increment,
	amount decimal(5, 2),
	customer_id int,
	foreign key (customer_id) references customers(customer_id)
);
select * from transactions;

alter table transactions 
drop foreign key transactions_ibfk_1;

alter table transactions 
add constraint fk_customer_id 
foreign key(customer_id) references customers(customer_id);

delete from transactions;
select * from transactions;
alter table transactions auto_increment = 1000;

insert into transactions (amount, customer_id)
values (4.99, 3),
       (2.89, 2),
       (3.38, 3),
       (4.99, 1);

 select * from transactions;
 delete from customers 
 where customer_id = 3; 
 /*customer_id는 fk 이기 때문에 transactions에서 삭제 할 수 없다*/

insert into transactions (amount, customer_id)
values (1.00, null);
insert into customers (first_name, last_name)
values ("Poppy","Puff");
select * from customers;

/*inner join은 두개의 테이블에서 일치 하는 정보를 보여준다 */
select * from transactions inner join customers 
on transactions.customer_id = customers.customer_id;
/*left join은 왼쪽의 select된 테이블을 중심으로 join된 테이블의 정보가 없어도 insert 된 정보가 있으면 보여준다 */
select * from transactions left join customers 
on transactions.customer_id = customers.customer_id;
/*right join은 오른쪽 join된 테이블을 중심으로 위와 반대로 왼쪽 테이블과 일치 하지 않아도 오른쪽 테이블 정보가 있으면 보여준다*/
select * from transactions right join customers 
on transactions.customer_id = customers.customer_id;

/*----------------------------------------------------------*/
/*functions*/
select count(amount) as "today's transactions"
from transactions;
select count(amount) as count
from transactions;
select max(amount) as maximum
from transactions;
select min(amount) as minimum
from transactions;
select avg(amount) as average
from transactions;
select sum(amount) as sum
from transactions;

select concat(first_name," ",last_name) as full_name
from employees;

/*------------------------------------------------------------*/

alter table employees add column job varchar(25) after hourly_pay;
select * from employees;

update employees 
set job = "janitor"
where employee_id = 6;

select * from employees
where hire_date < "2023-01-5";

select * from employees
where hire_date < "2023-01-5" and job = "cook";

select * from employees
where job = "cook" or job = "cashier";

select * from employees 
where not job = "manager";

select * from employees
where not job = "manager" and not job = "asst. manager";

select * from employees
where hire_date between " 2023-01-04" and "2023-01-07";

select * from employees
where job in ("cook","cashier","janitor");

/*-------------------------------------------------------*/
/*특정 숫자나 번호를 가지고 있는 항목을 찾을 때 사용한다 like = "%" */
select * from employees
where first_name like "s%";

select * from employees
where hire_date like "2023%";

select * from employees
where last_name like "%r";

/*_언더바는 글자 수에 따라 사용한다 밑의 결과는 cook */
select * from employees
where job like "_ook";  
/*밑의 결과는 전부 01월에 입사 했기 때문에 전부 출력된다*/
select * from employees 
where hire_date like "____-01-__";
/*job의 두번째 자리 알파벳이 a인 것만 출력된다*/
select * from employees
where job like "_a%";
/*----------------------------------------------------------------*/
/*order 순으로 출력 asc는 오름 차순 desc는 내림 차순이다*/
select * from employees 
order by last_name;

select * from employees 
order by last_name asc;

select * from employees 
order by last_name desc;

select * from transactions  
order by amount, customer_id;

select * from transactions
order by amount asc, customer_id desc;


/*=============================================================*/
/*SUB QUERY*/
/*
 * FROM절: IN LINE VIEW
 * SELECT절: SCALAR
 * WHERE절: SUB QUERY
 * 
 * */
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목1', '테스트 내용1', 10);
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목2', '테스트 내용2', 20);
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목3', '테스트 내용3', 25);
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목3', '테스트 내용4', 5);


/*제목이 '테스트 제목3'인 체험학습 중에 지원 가능 수가 5보다 큰 체험학습 조회*/
select * from
(
   select * from tbl_field_trip
   where field_trip_title = '테스트 제목3'
) ft
where ft.field_trip_number > 5;


/*체험학습 평균 지원수 보다 큰 체험학습 전체 정보 조회*/
select * from tbl_field_trip
where field_trip_number >
(select avg(field_trip_number) average from tbl_field_trip);



/*체험학습 제목 별 개수가 2 이상인 체험학습의 전체 정보 조회*/
/*체험학습 제목 별 개수가 2이상인 체험학습의 전체 정보 조회*/
/*컬럼명 in(A, B, ...)*/
/*컬럼명 = A OR 컬럼명 = B OR, ...*/
/*where field_trip_title = '테스트 제목2' OR field_trip_title = '테스트 제목3';*/
/*where field_trip_title in ('테스트 제목2', '테스트 제목3');*/

select * from tbl_field_trip
where field_trip_title in
(
   select field_trip_title 
   from tbl_field_trip
   group by field_trip_title
   having count(id) >= 2
);

/*order by*/
/*asc: 오름차순, 생략 가능*/
/*desc: 내림차순*/
/*order by [컬럼명] [asc/desc]*/

select * from tbl_field_trip
where field_trip_title in
(
   select field_trip_title 
   from tbl_field_trip
   group by field_trip_title
   having count(id) >= 2
)
order by field_trip_number desc;

/*
 * SQL 실행 순서
 * from > on > join > where > group by > having > select > order by
 * 
 * */

INSERT INTO tbl_member
(member_id, member_password, member_email, member_birth, member_address)
VALUES('hds1234', '1234', 'hds1234@gmail.com', '2023-12-04', '경기도 남양주시');

INSERT INTO tbl_member
(member_id, member_password, member_email, member_birth, member_address)
VALUES('lub7890', '1234', 'lub7890@gmail.com', '2023-12-04', '경기도 남양주시');

INSERT INTO tbl_product
(product_name, product_price, product_stock)
VALUES('옷', 30000, 50);

INSERT INTO tbl_order
(member_id, product_id, product_count)
VALUES(1, 1, 5);

select * from tbl_member;

/*게시글 추가*/
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목1', '테스트 내용1' , 1);
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목2', '테스트 내용2' , 2);
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목3', '테스트 내용3' , 2);
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목4', '테스트 내용4' , 1);
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목5', '테스트 내용5' , 2);


select * from tbl_post;

/*댓글 추가*/
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글1', 2, 1);
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글2', 2, 2);
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글3', 2, 3);
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글1', 1, 4);
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글1', 1, 5);

select * from tbl_reply;

/*게시글 정보와 그 게시글을 작성한 회원 정보 모두 조회*/
select * 
from tbl_member m
inner join tbl_post p
on m.id = p.member_id;

/*댓글 조회와 작성자 정보 모두 조회*/
select * 
from tbl_member m 
inner join tbl_reply r
on m.id = r.member_id;

/*댓글 내용 중 "안녕"이 포함된 댓글의 게시글 정보 중 게시글 제목과 내용 조회*/
update tbl_reply
set reply_contant = "%안녕"
from tbl_post p
inner join tbl_reply r
on reply_content like '%안녕%' and p.id = r.post_id;

select post_title, post_content
from tbl_post p
inner join
(
   select * from tbl_reply
   where reply_content like '%안녕%'
) r
on p.id = r.post_id;

/*게시글 별 댓글 수가 가장 많은 게시글 정보와 작성자 정보 조회*/
/*게시글 별 댓글 수가 가장 많은 게시글 정보와 작성자 정보 조회*/
select * 
from tbl_member m
inner join
tbl_post p
on p.id =
(
   select post_id
   from
   (
      select p1.post_id, max(p1.reply_count) 
      from
      (
         select post_id, count(post_id) reply_count from tbl_reply
         group by post_id
      ) p1
   ) p2
)
and
m.id = p.member_id;

/*
 * limit 행번호(0부터), 개수
 * 
 * */
select * from tbl_reply ;
select post_id, count(post_id) reply_count from tbl_reply
group by post_id
order by reply_count desc;
limit 0, 1


/*============================================================*/

/*부모 테이블*/
insert into tbl_parent(parent_name, parent_age, parent_address, parent_phone, parent_gender)
values('한동석', 20, '경기도 남양주', '01012341234', '남자');
insert into tbl_parent(parent_name, parent_age, parent_address, parent_phone, parent_gender)
values('임희수', 21, '잠실 시그니엘', '01078977897', '여자');
insert into tbl_parent(parent_name, parent_age, parent_address, parent_phone, parent_gender)
values('임수현', 21, '경기도 안성', '01088889999', '남자');

select * from tbl_parent;

/*아이 테이블*/
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('장동혁', 5, '남자', 1);
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('임웅빈', 4, '남자', 2);
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('오주연', 3, '여자', 3);
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('허은상', 11, '남자', 1);
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('김혜빈', 20, '여자', 2);

select * from tbl_child;

/*체험학습 테이블*/
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('매미 잡기 체험학습', '매미 잡으러 떠나자!', 5);
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('메뚜기 때려 잡기 체험학습', '메뚜기 다 잡자!', 50);
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('물놀이 체험학습', '한강 수영장으로 퐁당!', 20);
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('블루베리 채집 체험학습', '맛있어 블루베리 냠냠!', 25);
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('코딩 체험학습', '나도 빌게이츠!', 20);

select * from tbl_field_trip;
select * from tbl_child;
/*신청하기 테이블*/
insert into tbl_apply(child_id, field_trip_id)
values(1, 5);
insert into tbl_apply(child_id, field_trip_id)
values(2, 2);
insert into tbl_apply(child_id, field_trip_id)
values(3, 3);
insert into tbl_apply(child_id, field_trip_id)
values(4, 3);
insert into tbl_apply(child_id, field_trip_id)
values(4, 4);
insert into tbl_apply(child_id, field_trip_id)
values(5, 4);
insert into tbl_apply(child_id, field_trip_id)
values(5, 2);
insert into tbl_apply(child_id, field_trip_id)
values(5, 5);
insert into tbl_apply(child_id, field_trip_id)
values(5, 3);

insert into tbl_apply(child_id, field_trip_id)
values(5, 1);

select * from tbl_apply;

/*매미 체험학습에 신청한 아이의 전체 정보*/
select * from tbl_field_trip;
/*select * from tbl_child
where id in*/
select * from tbl_child tc 
inner join
(
	select child_id from tbl_apply ta 
	where field_trip_id in 
	(
		select id from tbl_field_trip tft 
		where field_trip_title = '매미 잡기 체험학습'
	)
)p1
on tc.id = p1.child_id ;

select * from tbl_field_trip tft ;

/*
select * from tbl_child
where id in
(
   select child_id from tbl_apply
   where field_trip_id =
   (
      select id from tbl_field_trip
      where field_trip_title = '매미 잡기 체험학습'
   )
);

select c.* from tbl_field_trip ft
inner join tbl_apply a
on ft.field_trip_title = '매미 잡기 체험학습'
and a.field_trip_id = ft.id
inner join tbl_child c
on c.id = a.child_id;
*/

/*체험학습을 2개 이상 신청한 아이의 정보와 부모의 정보 모두 조회*/
select c.*, p.* from tbl_child c
inner join
(
   select child_id from tbl_apply
   group by child_id
   having count(field_trip_id) >= 2
) a
on c.id = a.child_id
inner join tbl_parent p
on c.parent_id = p.id;

select child_id from tbl_apply
   group by field_trip_id;
/*나이가 21살인 부모의 아이들이 지원한 체험학습 전체 조회 */
select id from tbl_parent tp 
where parent_age = 21;

/*distinct는 중복된 행을 제거해준다.*/
select distinct  tft.*
from tbl_apply a
inner join 
(
	select id from tbl_child tc 
	where parent_id in 
	(
		select id from tbl_parent tp 
		where parent_age = 21
	)	
)c
on a.child_id = c.id
inner join tbl_field_trip tft 
on a.field_trip_id = tft.id;
/*평균 참가자(지원자) 수보다 적은 체험학습의 제목과 내용 조회 */
select * from tbl_field_trip
where id in
(
   select field_trip_id from tbl_apply
   group by field_trip_id
   having count(child_id) <   
   (
      select avg(child_count) from
      (
         select count(child_id) child_count from tbl_apply
         group by field_trip_id
      ) a
   )
);

/*참가자(지원자) 수가 가장 적은 체험학습의 제목과 내용 조회 */
select ft.* from tbl_field_trip ft
inner join
(
   select field_trip_id, count(child_id) from tbl_apply
   group by field_trip_id
   having count(child_id) in
   (
      select min(child_count) from
      (
         select count(child_id) child_count from tbl_apply
         group by field_trip_id
         order by child_count
      ) a1
   )
) a2
on ft.id = a2.field_trip_id;


/*==============================================================*/



insert into tbl_category_a(category_a_name)
values('과일');

select * from tbl_category_a;

insert into tbl_category_b(category_b_name, category_a_id)
values('사과', 1);

select * from tbl_category_b;

insert into tbl_category_c(category_c_name, category_b_id)
values('아오리 사과', 1);

select * from tbl_category_c;

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('풍성한 추석보내세요 사과와 함께', '사과중에 으뜸은 햇사과!', 1);

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('아오리 사과와 함께', '아이도 좋아하는 아오리 아오리 좋아!', 2);

create or replace view view_advertisement as
(
   select ad.id, ad.advertisement_title, ad.advertisement_content, a.category_a_name, b.category_b_name, c.category_c_name 
   from tbl_advertisement ad
   inner join tbl_category_c c
   on ad.category_c_id = c.id
   inner join tbl_category_b b
   on c.category_b_id = b.id
   inner join tbl_category_a a
   on b.category_a_id = a.id
);

select * from view_advertisement;

/*기업 정보 추가*/
insert into tbl_company(company_name, company_address, company_phone, company_type)
values('네이버', '서울', '0212341234', 'big');
insert into tbl_company(company_name, company_address, company_phone, company_type)
values('구글', '서울', '0255556666', 'big');
insert into tbl_company(company_name, company_address, company_phone, company_type)
values('동석마트', '서울', '0299998888', 'small');

/*광고 정보 추가*/
insert into tbl_category_a(category_a_name)
values('플랫폼');

select * from tbl_category_a;

insert into tbl_category_b(category_b_name, category_a_id)
values('은행', 2);

insert into tbl_category_b(category_b_name, category_a_id)
values('클라우드', 2);

select * from tbl_category_b;

insert into tbl_category_c(category_c_name, category_b_id)
values('결제', 2);

insert into tbl_category_c(category_c_name, category_b_id)
values('인터넷 뱅킹', 2);

insert into tbl_category_c(category_c_name, category_b_id)
values('개인 서버', 3);

insert into tbl_category_c(category_c_name, category_b_id)
values('이미지 갤러리', 3);

select * from tbl_category_c;


insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('결제가 내 손안에', '갑시다 결제 고고', 3);

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('인터넷으로 자유롭게', '자산 관리 합시다.', 4);

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('둥둥 하얀 구름', '너도 이제 대표!', 5);

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('너 128GB 샀어?', '난 32GB사고 512GB 클라우드 샀어!', 6);

select * from view_advertisement;

/*광고 지원 정보 추가*/
insert into tbl_apply(company_id, advertisement_id)
values(3, 1);
insert into tbl_apply(company_id, advertisement_id)
values(3, 2);

insert into tbl_apply(company_id, advertisement_id)
values(1, 3);
insert into tbl_apply(company_id, advertisement_id)
values(1, 5);

insert into tbl_apply(company_id, advertisement_id)
values(2, 3);
insert into tbl_apply(company_id, advertisement_id)
values(2, 4);
insert into tbl_apply(company_id, advertisement_id)
values(2, 5);
insert into tbl_apply(company_id, advertisement_id)
values(2, 5);
insert into tbl_apply(company_id, advertisement_id)
values(2, 6);

select * from tbl_company;
select * from tbl_advertisement;
select * from tbl_apply;


/*기업 중 대기업이 등록한 광고 전체 정보 조회*/
select * from view_advertisement ad
inner join
(
   select * from tbl_apply
   where company_id in
   (
      select id from tbl_company
      where company_type = 'big'
   )
) a
on ad.id = a.advertisement_id;

/*대기업이 신청한 광고 중 대 카테고리 별 신청 개수 조회*/
select category_a_name, count(c.id) from tbl_apply a
inner join tbl_company c
on c.company_type = 'big' and a.company_id = c.id
inner join view_advertisement ad
on a.advertisement_id = ad.id
group by category_a_name;

/*소 카테고리 별 가장 인기 많은 광고 정보 조회*/
select * from view_advertisement
where category_c_name =
(
   select category_c_name from tbl_apply a
   inner join view_advertisement ad
   on a.advertisement_id = ad.id
   group by category_c_name
   order by count(company_id) desc
   limit 0, 1
);

/*대 카테고리 중에서 중 카테고리가 2개 이상인 카테고리 이름 조회*/
select a.category_a_name from tbl_category_a a
inner join tbl_category_b b
on b.category_a_id = a.id
group by a.id
having count(b.id) >= 2;

/*광고를 가장 많이 신청한 기업 정보 조회*/
select * from tbl_company
where id =
(
   select company_id from tbl_apply
   group by company_id
   order by count(advertisement_id) desc
   limit 0, 1
);
