package mvc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.management.RuntimeErrorException;

import dto.Concert;
import mvc.database.DBConnection;


public class cartDAO {
	// C: addOrUpdateCart()
	// R: ArrayList<cartDTO> getCartList()/ getMemberCart()
	// U: addCart(), addOrUpdateCart()
	// D: deleteCart()/allDeleteCart()
	
	
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

			
			   String sql = "SELECT c.*, p.c_name, p.c_unitPrice, p.c_unitsInStock, p.c_releaseDate " +
		                 "FROM cart c " +
		                 "JOIN concert p ON c.c_id = p.c_id " +
		                 "WHERE c.id = ?";
			
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

			
				while (rs.next()) {
				    System.out.println("DB에서 장바구니 아이템 하나 조회됨 - c_id: "
				        + rs.getString("c_id") + ", count: " + rs.getInt("count"));
				    cartDTO cart = new cartDTO();
				    Concert concert = new Concert();

				    cart.setC_id(rs.getString("c_id"));      // 공연 번호
				    cart.setId(rs.getString("id"));          // 회원 ID

				   
				    cart.setCount(rs.getInt("count"));       // 상품 수량 

				    concert.setC_name(rs.getString("c_name"));
				    concert.setC_unitPrice(rs.getInt("c_unitPrice"));
				    concert.setC_unitsInStock(rs.getInt("c_unitsInStock"));
				    concert.setC_releaseDate(rs.getString("c_releaseDate"));

				    cart.setConcert(concert);
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
	 
	 
	 public void addOrUpdateCart(cartDTO cart) {
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;

		    try {
		        conn = DBConnection.getConnection();

		        String checkSql = "SELECT count FROM cart WHERE id = ? AND c_id = ?";
		        pstmt = conn.prepareStatement(checkSql);
		        pstmt.setString(1, cart.getId());
		        pstmt.setString(2, cart.getC_id());
		        rs = pstmt.executeQuery();

		        if (rs.next()) {
		            // 기존 수량이 있을 경우, 수량 더하기
		            int currentCount = rs.getInt("count");
		            pstmt.close();

		            String updateSql = "UPDATE cart SET count = count + ? WHERE id = ? AND c_id = ?";
		            pstmt = conn.prepareStatement(updateSql);
		            pstmt.setInt(1, cart.getCount());
		            pstmt.setString(2, cart.getId());
		            pstmt.setString(3, cart.getC_id());
		            pstmt.executeUpdate();
		        } else {
		            // 새로 추가
		            pstmt.close();
		            String insertSql = "INSERT INTO cart (id, c_id, count) VALUES (?, ?, ?)";
		            pstmt = conn.prepareStatement(insertSql);
		            pstmt.setString(1, cart.getId());
		            pstmt.setString(2, cart.getC_id());
		            pstmt.setInt(3, cart.getCount());
		            pstmt.executeUpdate();
		        }
		    } catch (Exception ex) {
		        System.out.println("addOrUpdateCart 오류:" + ex);
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (pstmt != null) pstmt.close();
		            if (conn != null) conn.close();
		        } catch (Exception ex) {
		            throw new RuntimeException(ex.getMessage());
		        }
		    }
		}

	 
	 public void addCart (String id, String c_id, int count) {
		 
		 // 장바구니 수량 수정
		 
		    Connection conn = null;
		    PreparedStatement pstmt = null;

		    String sql = "UPDATE cart SET count = ? WHERE id = ? AND c_id = ?";

		    try {
			        conn = DBConnection.getConnection();
			        pstmt = conn.prepareStatement(sql);
			        pstmt.setInt(1, count);
			        pstmt.setString(2, id);
			        pstmt.setString(3, c_id);
			        pstmt.executeUpdate();
			        
		    } catch (Exception ex) {
		        System.out.println("updateItemCount() 오류: " + ex);
		        
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
	 
	 
	 public void deleteCart(String id,String c_id) {
		 
		 //장바구니 삭제
		 
			Connection conn = null;
			PreparedStatement pstmt = null;		

			String sql = "delete from cart where id=? AND c_id=?";	

			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString (1, id); // 사용자 ID
				pstmt.setString(2, c_id); // 상품 ID
				pstmt.executeUpdate();

			} catch (Exception ex) {
				System.out.println("deleteCart()오류 : " + ex);
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
	 
	 public void allDeleteCart (String id) {
		 
		 // 장바구니 전체  삭제
		
		 	Connection conn = null;
		    PreparedStatement pstmt = null;

		    String sql = "DELETE FROM cart WHERE id = ?";
		    

		    try {
		        conn = DBConnection.getConnection();
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, id);
		        pstmt.executeUpdate();
		        
		    } catch (Exception ex) {
		        System.out.println("allDeleteCart() 오류: " + ex);
		        
		        
		    } finally {
		    	
		        try {
		            if (pstmt != null) pstmt.close();
		            if (conn != null) conn.close();
		        } catch (Exception ex) {
		            throw new RuntimeException(ex.getMessage());
		        }
		    }
		
	 }

	
	
}//class종료
