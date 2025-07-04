package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import mvc.model.cartDAO;
import mvc.model.cartDTO;

public class CartController extends HttpServlet {


	private static final long serialVersionUID = 1L; // 직렬화
	static final int LISTCOUNT =5; // 페이지에 출력할 상품 수
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get으로 들어온 요청을 post로 넘김
		doPost(request,response);
		
	} // do Get  종료
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제 요청을 처리하는 메서드
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		if (command.equals("/cartListAction.do")) {
			// 장바구니 목록 조회
			
			requestCartList(request);
			
			RequestDispatcher rd = request.getRequestDispatcher("./cart/list.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/cartAddAction.do")) {
			// 장바구니 상품 추가
			
			requestAddToCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/cartListAction.do");
			rd.forward(request, response);
		
		} else if (command.equals("/cartUpdateAction.do")) {
			// 장바구니 상품 수량 변경
			
			requestUpdateCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/cartListAction.do");
			rd.forward(request, response);
			
		} else if (command.equals("/cartDeleteAction.do")){
			// 장바구니 상품 1개 삭제
			
			requestDeleteCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/cartListAction.do");
			rd.forward(request, response);
			
		} else if (command.equals("/cartClearAction.do")) {
			// 장바구니 전체 비우기
			
			requestClearCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/cartListAction.do");
			rd.forward(request, response);
			
		} // if 종료
		
		
	} // doPost 종료

	private void requestClearCart(HttpServletRequest request) {
		// 장바구니 전체 비우기
		
		String id = request.getParameter("id");
		cartDAO dao = cartDAO.getInstance();
		dao.allDeleteCart(id);
		
	} // requestClearCart 종료

	private void requestDeleteCart(HttpServletRequest request) {
		// 장바구니 1개 삭제
		
		String id = request.getParameter("id");
		String c_id = request.getParameter("c_id");
		
		cartDAO dao = cartDAO.getInstance();
		dao.deleteCart(id, c_id);
		
	} //requestDeleteCart 종료

	private void requestUpdateCart(HttpServletRequest request) {
		// 장바구니 수량 수정
		
		String id = request.getParameter("id");
		String c_id = request.getParameter("c_id");
		int count = Integer.parseInt(request.getParameter("count"));
		
		cartDAO dao = cartDAO.getInstance();
		dao.addCart(id, c_id, count);
		// 수량 수정
		
	} //requestUpdateCart 종료

	private void requestAddToCart(HttpServletRequest request) {
		// 장바구니 상품 추가
		
		cartDAO dao = cartDAO.getInstance();
		cartDTO cart = new cartDTO();
		
		
		cart.setId(request.getParameter("id"));
		cart.setC_id(request.getParameter("c_id"));
		cart.setCount(Integer.parseInt(request.getParameter("count")));
		
		dao.addOrUpdateCart(cart); 
		// 이미 있으면 수량 추가, 없으면 새로 추가
		
	} //requestAddToCart 종료

	private void requestCartList(HttpServletRequest request) {
		// 장바구니 목록 조회
		
		
		String id = request.getParameter("id"); // 로그인한 사용자 id
		cartDAO dao = cartDAO.getInstance();
		ArrayList<cartDTO> cartList = dao.getCartList(id); // 해당 사용자의 장바구니 목록
		String name = dao.getMemberCart(id); // 사용자 이름
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("name", name);
		
		
		
	} // requestCartList 메서드 종료
	
	
	
	
	

} // class 종료
