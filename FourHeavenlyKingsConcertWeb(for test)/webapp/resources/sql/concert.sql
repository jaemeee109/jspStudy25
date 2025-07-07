CREATE TABLE IF NOT EXISTS concert(
c_id VARCHAR(10) NOT NULL,
c_name VARCHAR(20),
c_unitPrice  INTEGER,
c_artist VARCHAR(20),
c_description TEXT,
c_publisher VARCHAR(20),
c_category VARCHAR(20),	
c_unitsInStock LONG,
c_releaseDate VARCHAR(20),
c_fileName VARCHAR(20),
PRIMARY KEY (c_id)
)default CHARSET=utf8;

drop table concert;

select * from concert;

desc concert;

-더미데이터-
INSERT INTO concert VALUES('1357', 'YUURI ASIA TOUR 2025', '150000', 'YUURI', 'YUURI ASIA TOUR 2025 라는 타이틀 아래 일본 전국 10개 도시를 비롯해 상하이, 타이베이 등 아시아 각지를 돌며 전 공연 솔드아웃을 기록했던 지난 아레나 투어를 크게 뛰어넘는 규모로 25만 명의 관객을 동원할 예정입니다.', 'iTONY ENTERTAINMENT', '콘서트', '20000', '2025/11/01', 'YUURI.jpg');
INSERT INTO concert VALUES('9753', '윤하홀릭스 9기 팬미팅', '110000', '윤하', '온 세상이 우리의 일곱 번째 만남을 축복하는 여름날 처음 만나는 수줍은 얼굴과 오랜만에 마주할 멋쩍은 미소와 함께하는 윤하의 7번째 팬미팅', '(주)씨나인엔터테인먼트', '팬미팅', '5000', '2025/06/17', 'YOONHA.jpg');
INSERT INTO concert VALUES('5678', '2025 권은비 콘서트 THE RED', '165000', '권은비', '단 하나의 강렬한 색, 권은비의 [THE RED]', '울림엔터테인먼트', '콘서트', '30000', '2025/08/23', 'EUNBI.jpg');




