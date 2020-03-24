package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderDao;
import bean.OrderVo;

@WebServlet("*.order")
public class AdminorderServlet extends HttpServlet {
	String url = "admin/order.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp= req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);
	
		switch(tempURL) {
		
		case "/order_select.order"://가져오는
			order(req , resp);
			break;
		
		
		
		}

	}
	private void order(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      String findStr=req.getParameter("findStr");
	      OrderDao dao=new OrderDao();
	      List<OrderVo> list = dao.select(findStr);
	      req.setAttribute("list", list);
	      String path=url+"?str=./order.jsp&findStr="+findStr;
	      RequestDispatcher rd = req.getRequestDispatcher(path);
	      rd.forward(req, resp);
	      
	      
	   }


}
