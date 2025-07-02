<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.BookRepository" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "dbconn.jsp" %>


<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\jsp-workspace\\BookMarket\\src\\main\\webapp\\resources\\images";
	int maxSize = 5*1024*1024; // 업로드파일 최대 크기
	String encType = "UTF-8"; // 인코딩 유형
	
	MultipartRequest multipartRequest = new MultipartRequest(request,realFolder,maxSize,encType, 
			new DefaultFileRenamePolicy());

	String bookId = multipartRequest.getParameter("bookId");
	String name = multipartRequest.getParameter("name");
	String unitPrice = multipartRequest.getParameter("unitPrice");
	String author = multipartRequest.getParameter("author");
	String publisher = multipartRequest.getParameter("publisher");
	String releaseDate = multipartRequest.getParameter("releaseDate");
	String description = multipartRequest.getParameter("description");
	String category = multipartRequest.getParameter("category");
	String unitsInStock = multipartRequest.getParameter("unitsInStock");
	String condition = multipartRequest.getParameter("condition");
	
	Enumeration files = multipartRequest.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multipartRequest.getFilesystemName(fname);
	
	
	int price;
	
	
	if (unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	
	long stock;
	
	if (unitsInStock.isEmpty())
		stock=0;
	
	else
		stock=Long.valueOf(unitsInStock);
	
	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	String sql = "SELECT*FROM book WHERE b_id=?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs= pstmt.executeQuery();
	
	if (rs.next()) {		
		if (fileName != null) {
			sql = "UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=?, b_fileName=? WHERE b_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);		
			pstmt.setString(9, condition);	
			pstmt.setString(10, fileName);	
			pstmt.setString(11, bookId);	
			pstmt.executeUpdate();
			
					
		} else {
			sql = "UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=? WHERE b_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);		
			pstmt.setString(9, condition);			
			pstmt.setString(10, bookId);	
			pstmt.executeUpdate();
		}		
	}
	

	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	

	response.sendRedirect("editBook.jsp?edit=update");


%>
