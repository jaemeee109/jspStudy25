package dao;

import java.util.ArrayList;

import dto.Concert;

public class ConcertRepository {

	private ArrayList<Concert> listOfConcerts = new ArrayList<Concert>();
	private static ConcertRepository instance = new ConcertRepository();
	public static ConcertRepository getInstance() {
		return instance;
	}
	
	public ConcertRepository() {
		Concert concert1 = new Concert("1357", "YUURI ASIA TOUR 2025", 150000);
		concert1.setC_artist("YUURI");
		concert1.setC_description("YUURI ASIA TOUR 2025 라는 타이틀 아래 일본 전국 10개 도시를 비롯해 상하이, 타이베이 등 아시아 각지를 돌며 전 공연 솔드아웃을 기록했던 지난 아레나 투어를 크게 뛰어넘는 규모로 25만 명의 관객을 동원할 예정입니다.");
		concert1.setC_publisher("iTONY ENTERTAINMENT");
		concert1.setC_category("콘서트");
		concert1.setC_unitsInStock(20000);
		concert1.setC_releaseDate("2025/11/01");
		concert1.setC_filename("YUURI.jpg");
		
		Concert concert2 = new Concert("9753", "윤하홀릭스 9기 팬미팅", 110000);
		concert2.setC_artist("윤하");
		concert2.setC_description("온 세상이 우리의 일곱 번째 만남을 축복하는 여름날 처음 만나는 수줍은 얼굴과 오랜만에 마주할 멋쩍은 미소와 함께하는 윤하의 7번째 팬미팅");
		concert2.setC_publisher("(주)씨나인엔터테인먼트");
		concert2.setC_category("팬미팅");
		concert2.setC_unitsInStock(5000);
		concert2.setC_releaseDate("2025/06/17");
		concert2.setC_filename("YOONHA.jpg");
		
		Concert concert3 = new Concert("5678", "2025 권은비 콘서트 THE RED", 165000);
		concert3.setC_artist("YUURI");
		concert3.setC_description("단 하나의 강렬한 색, 권은비의 [THE RED]");
		concert3.setC_publisher("울림엔터테인먼트");
		concert3.setC_category("콘서트");
		concert3.setC_unitsInStock(30000);
		concert3.setC_releaseDate("2025/08/23");
		concert3.setC_filename("EUNBI.jpg");
		
		listOfConcerts.add(concert1);
		listOfConcerts.add(concert2);
		listOfConcerts.add(concert3);
		
	}
	
	public ArrayList<Concert> getAllConcerts() {
		return listOfConcerts;
		
	}
	
	public Concert getConcertById(String c_Id) {
		Concert concertById = null;
		
		for (int i = 0; i < listOfConcerts.size(); i++) {
			Concert concert = listOfConcerts.get(i);
			
			if(concert != null && concert.getC_Id() != null && concert.getC_Id().equals(c_Id)) {
				concertById = concert;
				break;
			}
		}
		
		return concertById; // 찾은 공연 객체 리턴
		
	} // 공연 찾기 메서드 종료
	
	
	public void addConcert(Concert concert) { // 공연 추가 메서드
	listOfConcerts.add(concert);
	
	} // 공연 추가 메서드 종료
	
} 
	

