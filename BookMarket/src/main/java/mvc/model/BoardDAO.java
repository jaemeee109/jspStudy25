package mvc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;


public class BoardDAO {
	
	
	//필드
	private static BoardDAO instance;
	
	
	//기본생성자
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		
		if (instance ==null)
			instance = new BoardDAO();
		return instance;
		
	}

	public int getListCount(String items, String text) {
	//board 테이블의 레코드 개수
					
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// DB에 연결하고 쿼리실행
			
			int x = 0;
			// 게시글 저장 변수

			String sql;
			
			if (items == null && text == null)
				sql = "select  count(*) from board";
				// 전체 글 조회
			else
				sql = "SELECT   count(*) FROM board where " + items + " like '%" + text + "%'";
				//  조건 조회
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				
				if (rs.next()) 
					x = rs.getInt(1);
				
				// count(*)-> next() -> x에 저장
				
			} catch (Exception ex) {
				System.out.println("getListCount() 레코드수 : " + ex);
				
				
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
			return x;
			// 글의 개수 반환
		}
	
		public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		//board 테이블의 레코드 가져오기
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			int total_record = getListCount(items, text );
			// 글의 개수 파악
			int start = (page - 1) * limit;
			// 현재 페이지에서 시작할 글의 번호
			int index = start + 1;
			// 실제 DB에서 가져올 번호

			
			String sql;

			if (items == null && text == null)
				sql = "select * from board ORDER BY num DESC";
			else
				sql = "SELECT  * FROM board where " + items + " like '%" + text + "%' ORDER BY num DESC ";
		
			
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			
		
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rs = pstmt.executeQuery();
				// TYPE_SCROLL_SENSITIVE 커서를 자유롭게 이동
				// CONCUR_UPDATABLE 결과 수정 가능
				
				
				while (rs.absolute(index)) { // index번째 게시글로 이동
					BoardDTO board = new BoardDTO();
					board.setNum(rs.getInt("num")); // 글번호
					board.setId(rs.getString("id")); // 작성자id
					board.setName(rs.getString("name")); // 작성자 이름
					board.setSubject(rs.getString("subject")); // 작성자 제목
					board.setContent(rs.getString("content")); // 내용
					board.setRegist_day(rs.getString("regist_day")); //등록일
					board.setHit(rs.getInt("hit")); // 조회수
					board.setIp(rs.getString("ip")); // 작성자ip
					list.add(board);
					
				
					
					if (index < (start + limit) && index <= total_record)
						index++;
					else
						break;
					
					
					
				}
				return list;
				//  ArrayList<BoardDTO>를 리턴
				
				
			} catch (Exception ex) {
				System.out.println("getBoardList() ���� : " + ex);
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
}
	
	public String getLoginNameById(String id) {
		//member 테이블에서 인증된 id의 사용자명 가져오기
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
	
		String name = null;
		// 사용자의 이름을 담을 변수
		
		
		String sql = "select * from member where id = ? ";
	
		try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
		
			if (rs.next()) 
				name = rs.getString("name");	
			// 결과가 있으면 행의 name을 꺼내서 name변수에 저장
			
			return name;
			// 결과값 반환
			
		} catch (Exception ex) {
			System.out.println("getBoardByNum() ???? : " + ex);
			
			
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
		// 결과가 없거나 에러가 나면 null 반환
	}
	
	
		public void insertBoard(BoardDTO board)  {
		//board 테이블에 새로운 글 삽입하기
		
		
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			
		try {
				conn = DBConnection.getConnection();		
		
				String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
			
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
	
		public void updateHit(int num) {
		//선택된 글의 조회 수 증가시키기
		
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
		try {
				conn = DBConnection.getConnection();
		
				String sql = "select hit from board where num = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				// num번 글의 조회수인 hit을 가져옴
				
				
				int hit = 0;
		
				if (rs.next())
					hit = rs.getInt("hit") + 1;
				
				// 조회수가 있으면 1 증가
			
		
				sql = "update board set hit=? where num=?";
				pstmt = conn.prepareStatement(sql);		
				pstmt.setInt(1, hit);
				pstmt.setInt(2, num);
				pstmt.executeUpdate();
				
				// 수정된 조회수를 DB에 반영
				
				
		} catch (Exception ex) {
			
			System.out.println("updateHit() ???? : " + ex);
			
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
	}
		
	
	public BoardDTO getBoardByNum(int num, int page) {
		//선택된 글 상세 내용 가져오기
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;
	
		updateHit(num);
		// 현재 글의 조회수를 1 증가시킴 ( 사용자가 이 글을 조회했다고 처리)
		String sql = "select * from board where num = ? ";
		// 글번호에 해당하는 게시글 1개를 조회하는 sql문
		
		try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
	
			if (rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
			} // 조회된 결과가 있으면 새 BoardDTO 객체 생성, 각 컬럼 값을 BoardDTO에 담음
			
			return board;
			// BoardDTO 객체를 반환
			
		} catch (Exception ex) {
			
			System.out.println("getBoardByNum() ????: " + ex);
			
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
		return null; // 조회 실패시 null
	}
	
	public void updateBoard(BoardDTO board) {
	//선택된 글 내용 수정하기
		
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
				String sql = "update board set name=?, subject=?, content=? where num=?";
				
				// 글번호 num을 기준으로 이름,제목,내용 수정
				
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				conn.setAutoCommit(false);
				// 수동 커밋 설정
		
				pstmt.setString(1, board.getName());
				pstmt.setString(2, board.getSubject());
				pstmt.setString(3, board.getContent());
				pstmt.setInt(4, board.getNum());
		
				pstmt.executeUpdate();			
				conn.commit(); // 성공시 DB에 반영
	
		} catch (Exception ex) {
			
			System.out.println("updateBoard() ???? : " + ex);
			
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
	
	
	
	
	public void deleteBoard(int num) {
	//선택된 글 삭제하기
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
	
		String sql = "delete from board where num=?";	
		// 글번호(num)에 해당하는 글을 삭제하는 sql문
	
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			// db연결-> 글번호 호출-> sql실행(해당 글 삭제)
	
		} catch (Exception ex) {
			System.out.println("deleteBoard() ???? : " + ex);
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
}
		
	
	
