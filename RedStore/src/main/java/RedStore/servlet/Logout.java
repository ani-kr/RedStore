package RedStore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import RedStore.model.Cart;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try(PrintWriter out  = response.getWriter()){
			if(request.getSession().getAttribute("auth")!= null) {
				request.getSession().removeAttribute("cart-list");
				request.getSession().removeAttribute("auth");
				
				
				HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("loggedout", "true");
        		
				response.sendRedirect("account.jsp");
				
			}else {
				response.sendRedirect("index.jsp");
			}
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	

}
