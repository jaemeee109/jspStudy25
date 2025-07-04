-- 멤버 테이블 생성
create table member(
	id varchar(20) not null,
	password varchar(20) not null,
	name varchar(10) not null,
	gender varchar(4),
	birth varchar(20),
	mail varchar(30),
	phone varchar(20),
	address varchar(90),
	regist_day varchar(50),
	primary key(id)
) default CHARSET=UTF8;

select*from member;
drop table member; 나중에 테이블 삭제할때 사용하자.