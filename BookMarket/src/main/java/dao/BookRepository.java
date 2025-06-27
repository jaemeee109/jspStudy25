package dao;

import java.util.ArrayList;
import dto.Book;

public class BookRepository {

	private ArrayList<Book> listOfBooks= new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
		
	
		
		public Book getBookById(String bookId) {
			// 도서 목록에서 일치하는 도서 호출
			
			Book bookById=null;
			
			for (int i=0; i <listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
				if (book != null && book.getBookId()!=null &&
						book.getBookId().equals(bookId)) {
					bookById=book;
					break;
				}//if종료
					
			}//for종료
			return bookById;
		} // Book getBookById 메서드 종료
		
		public BookRepository() {
		
		Book book1 = new Book ("ISBN9791196254865","원더",15300);
		book1.setAuthor("R.J.팔라시오");
		book1.setDescription("원더는 선천적 안면 기형으로 태어난 열 살 소년 어거스트가 처음으로 학교에 들어간 뒤 벌어지는 일 년 동안의 일을 다룬 이야기이다. 작가는 어거스트가 안면 기형이라는 자신의 장애, 얼굴만 보고 사람을 평가하는 사람들의 편견, 아이들의 끈질긴 괴롭힘을 불굴의 의지와 가족의 사랑과 친절을 베푸는 친구의 우정의 힘으로 극복하며 세상에서 가장 아름다운 아이로 거듭나는 과정을 유쾌하게 풀어내고 있다.");
		book1.setPublisher("책과콩나무");
		book1.setCategory("영미소설");
		book1.setUnitInStock(1000);
		book1.setReleaseDate("2013/01/03");
		book1.setFilename("ISBN9791196254865.JPG");
		
		Book book2 = new Book ("ISBN9791165341909","달러구트 꿈 백화점",12420);
		book2.setAuthor("이미예");
		book2.setDescription("<달러구트 꿈 백화점>은 '무의식에서만 존재하는 꿈을 정말 사고 팔 수 있을까?'라는 기발한 질문에 답을 찾아가며, 꿈을 만드는 사람, 파는 사람, 사는 사람의 비밀스런 에피소드를 담고 있는 판타지 소설이다. 텀블벅 펀딩 1812% 달성, 전자책 출간 즉시 베스트셀러 1위를 3주간 기록하며 수많은 독자들의 요청으로 종이책으로 출간하게 되었다.");
		book2.setPublisher("팩토리나인");
		book2.setCategory("한국판타지소설");
		book2.setUnitInStock(1000);
		book2.setReleaseDate("2020/04/21");
		book2.setFilename("ISBN9791165341909.JPG");
		
		Book book3 = new Book ("ISBN9788937473296","더 셜리클럽",12600);
		book3.setAuthor("박서련");
		book3.setDescription("스무 살 한국인 '설희'는 호주의 할머니 '셜리'들의 클럽에 가입을 신청한다. 설희의 영어식 이름이 셜리이기 때문이다. 발음이 비슷해서 정했을 뿐인 이름이지만 이름으로 인한 놀랍고 사랑스러운 만남은 소설 내내 이어진다. 셜리라는 이름을 가진 사람들의 클럽인 '더 셜리 클럽'은 셜리가 아주 예전에 유행한 이름인 탓에 멤버 중 할머니가 많다. 그저 이름이 같다는 이유로 그들은 재미(Fun)와 음식(Food)과 우정(Friend)를 나눈다.");
		book3.setPublisher("민음사");
		book3.setCategory("한국소설");
		book3.setUnitInStock(1000);
		book3.setReleaseDate("2020/08/21");
		book3.setFilename("ISBN9788937473296.jpg");
		
		
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}
	
	public ArrayList<Book> getAllBooks(){
		// 도서 목록을 가져오는 메서드
		return listOfBooks;
	}
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
	
	
}
