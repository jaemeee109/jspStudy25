package dto;

public class Concert {
	
	// 필드
	private String c_Id; // 공연번호
	private String c_name; // 공연제목
	private int c_unitPrice; // 공연가격
	private String c_artist; // 공연가수
	private String c_description; // 공연소개
	private String c_publisher; // 공연회사
	private String c_category; // 공연종류
	private long c_unitsInStock; // 잔여좌석
	private String c_releaseDate; // 공연일
	private String c_filename; // 공연이미지
	
	
	// 기본생성자
	public Concert() {
		super();
	}

	
	// 생성자
	public Concert(String c_Id, String c_name, int c_unitPrice) {
		super();
		this.c_Id = c_Id;
		this.c_name = c_name;
		this.c_unitPrice = c_unitPrice;
	}

	
	// 메서드
	public String getC_Id() {
		return c_Id;
	}

	public void setC_Id(String c_Id) {
		this.c_Id = c_Id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_unitPrice() {
		return c_unitPrice;
	}

	public void setC_unitPrice(int c_unitPrice) {
		this.c_unitPrice = c_unitPrice;
	}

	public String getC_artist() {
		return c_artist;
	}

	public void setC_artist(String c_artist) {
		this.c_artist = c_artist;
	}

	public String getC_description() {
		return c_description;
	}

	public void setC_description(String c_description) {
		this.c_description = c_description;
	}

	public String getC_publisher() {
		return c_publisher;
	}

	public void setC_publisher(String c_publisher) {
		this.c_publisher = c_publisher;
	}

	public String getC_category() {
		return c_category;
	}

	public void setC_category(String c_category) {
		this.c_category = c_category;
	}

	public long getC_unitsInStock() {
		return c_unitsInStock;
	}

	public void setC_unitsInStock(long c_unitsInStock) {
		this.c_unitsInStock = c_unitsInStock;
	}

	public String getC_releaseDate() {
		return c_releaseDate;
	}

	public void setC_releaseDate(String c_releaseDate) {
		this.c_releaseDate = c_releaseDate;
	}

	public String getC_filename() {
		return c_filename;
	}

	public void setC_filename(String c_filename) {
		this.c_filename = c_filename;
	}
	
	
	
}
