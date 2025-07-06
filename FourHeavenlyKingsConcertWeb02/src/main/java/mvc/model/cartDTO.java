package mvc.model;

import dto.Concert;

public class cartDTO {
	
	// 필드
	private String c_id; // 공연번호
	private String id; // 회원 아이디
	private int count ; // 장바구니 수량
	

	private Concert concert; // 콘서트 dto 생성
	
	
	

	// 기본생성자
	public cartDTO() {
		
	}

	// 메서드 
	// 게터세터
	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public Concert getConcert() {
		return concert;
	}

	public void setConcert(Concert concert) {
		this.concert = concert;
	
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	// 테스트용 코드

	@Override
	public String toString() {
		return "cartDTO [c_id=" + c_id + ", id=" + id + ", count=" + count + "]";
	}

	
	
	
	
	

} // class 종료
