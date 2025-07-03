package mvc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.management.RuntimeErrorException;

import mvc.database.DBConnection;


public class cartDAO {
	
	
	//필드
	private static cartDAO instance;
	// cartDAO 클래스 안에서 객체를 담을 변수 선언
	// 유일한 instance를 저장할 정적 변수
	
	
	//기본생성자
	private cartDAO() {
	// 외부에서 new로 객체를 생성하지 못하게 함
	}
	
	
	 public static cartDAO getInstance() {
	// 외부에서 이 메서드를 통해서만 객체 호출 가능
	        if (instance == null) {
	            instance = new cartDAO();
	        }
	        // instance가 null이면 cartDAO객체를 생성함 (딱 1번만 가능)
	        
	        return instance;
	        // 객체 반환
	        // 이미 생성된 객체가 있으면 그대로 리턴됨
	    }
	 
	
	 public ArrayList<cartDTO> getCartList(String id) {
		//  장바구니에 담긴 상품 목록
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			//DB에 연결하고 실행

			ArrayList<cartDTO> list = new ArrayList<cartDTO>();

			/* String sql = "SELECT * FROM cart Where id = ?"; */
			
			   String sql = "SELECT c.*, p.c_name, p.unitPrice, p.unitsInStock, p.releaseDate " +
		                 "FROM cart c " +
		                 "JOIN concert p ON c.c_id = p.c_id " +
		                 "WHERE c.id = ?";
			
		
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

			
				while (rs.next()) {
					
					cartDTO cart = new cartDTO();
		            ConcertDTO concert = new ConcertDTO();
		            // 나중에 상품보고 수정
		            
		            cart.setC_id("c_id"); // 예: 공연 번호
		            cart.setId(rs.getString("id")); // 회원 ID
		            concert.setCname("c_name"); // 공연 제목
		            concert.setUnitPrice(rs.getInt("unitPrice")); // 공연가격
		            concert.setUnitsInStock(rs.getInt("unitsInStock")); // 수량
		            concert.setReleaseDate(rs.getString("releaseDate")); // 공연일자
		            
		            cart.setConcert(concert); // cartDTO에 concert필드가 필요함
		            list.add(cart);
		            
		        }//while종료
				
				
			} catch (Exception ex) {
				
				System.out.println("getCartList() 오류 : " + ex);
				
			} finally {			
				try {				
					if (rs != null) 
						rs.close();							
					if (pstmt != null) 
						pstmt.close();				
					if (conn != null) 
						conn.close();	
					
				} catch (Exception ex) {
					
					throw new RuntimeException(ex.getMessage());
					
				}		
			}		
			return list; 
			// ArrayList<cartDTO>반환
		}
	 
	 
	 
	 public String getMemberCart (String id) {
	 // 장바구니에서 이름이 나옴
	 // 인증 된 사용자의 id 가져오기
	 // cart 테이블에서 id 가져오기, member 테이블에서 name 가져오기
		 
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 //DB와 연결,실행,결과를 담음

		 String name = null;
		 // 로그인한 사용자의 이름을 담을 변수
		 
		 
		//나중에 테이블 수정		 
		//SELECT m.name 
		//FROM cart c 
		//JOIN member m ON c.id = m.id 
		//WHERE c.id = ?
		 
		 String sql = "SELECT m.name FROM cart c JOIN member m ON c.id = m.id WHERE c.id = ?";
		 // cart의 id와 member의 name을 조인해서 가져옴
		 
		 try {
			 
			 conn = DBConnection.getConnection();
			 // DBConnection 클래스의 getConnection() 메서드를 통해 DB연결 요청
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) // 결과가 있다면 name값을 읽어와 name 변수에 저장
				 name = rs.getString("name");
			 // name 컬럼의 값을 읽어와 name 변수에 저장
			
				 return name;	
			// name 값을 리턴 (id가 없으면 null 반환)
			 
		 } catch (Exception ex) {
			 
			 System.out.println("getMemberCart()오류" + ex);
			 
		 } finally {
			 try {
				 	if (rs != null)
				 		rs.close();
				 	if (pstmt != null)
				 		pstmt.close();
				 	if (conn != null)
				 		conn.close();
				 	
			 } catch (Exception ex) {
				 
				 throw new RuntimeException(ex.getMessage());
			 }
		 }
		 return null;
		 // 아이디를 찾을 수 없을 경우 null을 반환
		 
	 }//getMemberCart 메서드 종료
	 
	 
	 public void addOrUpdateCart(cartDTO c_id)  {
			//board 테이블에 새로운 글 삽입하기
			
			
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				
			try {
					conn = DBConnection.getConnection();		
			
					String sql1 = "SELECT count From cart where c_id =?";
					// 해당 상품이 장바구니에 있는지 확인하는 쿼리문
					
-------------------------------------------------------------------------------							
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, board.getNum());
					pstmt.setString(2, board.getId());
					pstmt.setString(3, board.getName());
					pstmt.setString(4, board.getSubject());
					pstmt.setString(5, board.getContent());
					pstmt.setString(6, board.getRegist_day());
					pstmt.setInt(7, board.getHit());
					pstmt.setString(8, board.getIp());
			
					pstmt.executeUpdate();
					// INSERT 이기 때문에 executeUpdate() 사용, 성공시 테이블에 1개의 행이 추가됨
					
			} catch (Exception ex) {
				
				
				System.out.println("insertBoard() ???? : " + ex);
				
				
			} finally {
				
				try {									
					if (pstmt != null) 
						pstmt.close();				
					if (conn != null) 
						conn.close();
					
				} catch (Exception ex) {
					
					throw new RuntimeException(ex.getMessage());
					
				}		
			}		
		} 
	
	
	
}//class종료
