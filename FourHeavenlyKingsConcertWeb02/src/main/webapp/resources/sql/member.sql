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
drop table member; --나중에 테이블 삭제할때 사용하자
delete from member;

-- 멤버 더미데이터
INSERT INTO member VALUES('user8282', '8282','홍길동', '남', '1999-01-01', 'hkd@naver.com','01082821253','대한민국동서남북','2025-07-06')
INSERT INTO member VALUES('user4860','4860','김춘식','여','2020-05-05','kat@naver.com','01020200505','대한민국수원시','2025-07-06')
INSERT INTO member VALUES('user5060','5060','이네모','남','2020-05-06','nemosdream@naver.com','01088888888','대한민국','2025-07-06')
