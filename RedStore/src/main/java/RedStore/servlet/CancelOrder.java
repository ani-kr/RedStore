package RedStore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import RedStore.connection.DbCon;
import RedStore.dao.OrderDao;

/**
 * Servlet implementation class CancelOrder
 */
@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public CancelOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		try(PrintWriter out= response.getWriter()){
			String id= request.getParameter("id");
			if(id!= null) {
			OrderDao orderDao = new OrderDao(DbCon.getConnection())	;
			orderDao.cancelOrder(Integer.parseInt(id));
			}
			
			HttpSession httpSession= request.getSession();
    		httpSession.setAttribute("CancelO", "true");
			response.sendRedirect("orders.jsp");
		}catch(Exception e) {
			
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
