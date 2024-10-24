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
import RedStore.dao.AdminDao;
import RedStore.model.Admin;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try (PrintWriter out = response.getWriter()){
        	
        	String email=request.getParameter("uemail");
            String password=request.getParameter("upass"); 
            
      
        	AdminDao adao = new AdminDao(DbCon.getConnection());
        	Admin admin = adao.adminLogin(email, password);
        	
        	
        	if(admin != null) {
        		
        		request.getSession().setAttribute("authadmin", admin);
     
        		HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("adminloggedin", "true");
        		httpSession.setAttribute("useremail", email);
        		response.sendRedirect("admin-home.jsp");
        		
        	}
        	else {
        		HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("adminloggedin", "false");
        		
        		response.sendRedirect("admin-login.jsp");
        		
        	}
        	
        	
        }catch (Exception e){
        	
        }
		
		
		
	}

}
