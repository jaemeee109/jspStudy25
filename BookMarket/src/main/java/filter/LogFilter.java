package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.FileWriter;
import java.io.PrintWriter;

public class LogFilter implements Filter{
	
	
	
	@Override
	public void init(FilterConfig Config) throws ServletException {
		
	System.out.println("BookMarket 초기화");
		
	}




	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws java.io.IOException, ServletException {
		
		System.out.println("접속한 클라이언트 IP: " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		System.out.println("접속한 URL 경로 : " + getURLPath(request));
		System.out.println("요청 처리 시작 시각 : " + getCurrentTime());
		
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println("요청 처리 종료 시각 : " + getCurrentTime());
		System.out.println("요청 처리 소요 시간 : " + (end-start)+"ms");
		System.out.println("============================");
		
	}
	




	@Override
	public void destroy() {
		
	}
	
	
	private String getURLPath(ServletRequest request) {
		
		HttpServletRequest req;
		String currentPath = "";
		String queryString = "";
		if (request instanceof HttpServletRequest) {
			req = (HttpServletRequest)request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null? "" : "?" + queryString;
		}
		
		return currentPath+queryString;
		
		}
	private String getCurrentTime() {
		
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calender = Calendar.getInstance();
		calender.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calender.getTime());
	}



	
}
