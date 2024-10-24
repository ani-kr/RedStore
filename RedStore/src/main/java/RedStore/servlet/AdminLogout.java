package RedStore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogout
 */
@WebServlet("/AdminLogout")
public class AdminLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out  = response.getWriter()){
			if(request.getSession().getAttribute("authadmin")!= null) {
				request.getSession().removeAttribute("authadmin");
				
				
				HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("adminloggedout", "true");
        		
        		
				response.sendRedirect("account.jsp");
				
			}else {
				response.sendRedirect("index.jsp");
			}
		}
		
		
	}
	}



