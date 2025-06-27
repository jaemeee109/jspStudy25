<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.*"%> 
<%@ page import ="java.util.*"%> 
<%@ page import ="java.io.*"%> 

<%
    	MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 5*1023*1024, "utf-8",
    			new DefaultFileRenamePolicy());
    
    	Enumeration params = multi.getParameterNames();
    	
    	while (params.hasMoreElements()){
    		String name=(String) params.nextElement();
    		String value=multi.getParameter(name);
    		out.println(name + " = " + value + "<br>");
    		
    	}
    	out.println("----------<br>");
    	
    	Enumeration files = multi.getFileNames();
    	
    	while (files.hasMoreElements()){
    		String name=(String) files.nextElement();
    		String filename=multi.getFilesystemName(name);
    		String original=multi.getOriginalFileName(name);
    		String type=multi.getContentType(name);
    		File file = multi.getFile(name);
    		out.println("요청파라미터이름:" + name + "<br>");
    		out.println("실제파일이름:" + original + "<br>");
    		out.println("저장파일이름:" + filename + "<br>");
    		out.println("파일컨텐츠유형:" + type + "<br>");
    		
    		
    	if (file != null){
    		out.println("파일크기: " + file.length());
    		out.println("<br>");
    	}
    }
%>