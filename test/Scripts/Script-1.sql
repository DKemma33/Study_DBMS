create table tbl_member(
   id bigint unsigned auto_increment primary key,
   member_id varchar(255) not null unique,
   member_password varchar(255) not null,
   member_email varchar(255) not null unique,
   member_birth date
);



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


/*사용자의 프로필 사진을 3개 추가한다.*/
/*사용자의 프로필 사진 중 대표 이미지를 모두 가져오기*/
/*2번 프로필 사진의 회원번호를 알아내서*/
/*프로필 사진의 주인 정보를 조회하기*/
/*다른 이미지를 대표로 설정하기(1번 회원)*/
/*대표 이미지가 아닌 이미지를 파일의 이름으로 삭제하기(1번 회원)*/