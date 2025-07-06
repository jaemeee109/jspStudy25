package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.model.cartDAO;
import mvc.model.cartDTO;

public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        String uri     = req.getRequestURI();
        String ctx     = req.getContextPath();
        String command = uri.substring(ctx.length());

        if (command.equals("/cartListAction.do")) {
            requestCartList(req);
            req.getRequestDispatcher("/cart/list.jsp")
               .forward(req, resp);

        } else if (command.equals("/cartAddAction.do")) {
            requestAddToCart(req);
            resp.sendRedirect(ctx + "/cartListAction.do");

        } else if (command.equals("/cartUpdateAction.do")) {
            requestUpdateCart(req);
            // ← forward 삭제, 오직 redirect
            resp.sendRedirect(ctx + "/cartListAction.do");

        } else if (command.equals("/cartDeleteAction.do")) {
            requestDeleteCart(req);
            resp.sendRedirect(ctx + "/cartListAction.do");

        } else if (command.equals("/cartClearAction.do")) {
            requestClearCart(req);
            resp.sendRedirect(ctx + "/cartListAction.do");
        }
    }


    private void requestCartList(HttpServletRequest req) {
        String id = (String) req.getSession().getAttribute("sessionId");
        ArrayList<cartDTO> cartList = cartDAO.getInstance().getCartList(id);
        req.setAttribute("cartList", cartList);
    }

    private void requestAddToCart(HttpServletRequest req) {
        String id   = (String) req.getSession().getAttribute("sessionId");
        String c_id = req.getParameter("c_id");
        int count   = Integer.parseInt(req.getParameter("count"));
        cartDTO cart = new cartDTO();
        cart.setId(id);
        cart.setC_id(c_id);
        cart.setCount(count);
        cartDAO.getInstance().addOrUpdateCart(cart);
    }

    private void requestUpdateCart(HttpServletRequest req) {
        String id   = (String) req.getSession().getAttribute("sessionId");
        String c_id = req.getParameter("c_id");
        int count   = Integer.parseInt(req.getParameter("count"));
        cartDAO.getInstance().addCart(id, c_id, count);
    }

    private void requestDeleteCart(HttpServletRequest req) {
        String id   = (String) req.getSession().getAttribute("sessionId");
        String c_id = req.getParameter("c_id");
        cartDAO.getInstance().deleteCart(id, c_id);
    }

    private void requestClearCart(HttpServletRequest req) {
        String id = (String) req.getSession().getAttribute("sessionId");
        cartDAO.getInstance().allDeleteCart(id);
    }
}
