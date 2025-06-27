<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.BookRepository" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>

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
	
	
	BookRepository dao = BookRepository.getInstance();
	
	Book newBook = new Book();
	
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(filename);
	
	dao.addBook(newBook);
	
	response.sendRedirect("books.jsp");
	
%>
