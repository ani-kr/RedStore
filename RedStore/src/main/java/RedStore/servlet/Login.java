package RedStore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.jasper.tagplugins.jstl.core.Out;

import RedStore.connection.DbCon;
import RedStore.dao.UserDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
   

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
  
        try (PrintWriter out = response.getWriter()){
        	
        	String email=request.getParameter("uemail");
            String password=request.getParameter("upass"); 
            
            
        	UserDao udao = new UserDao(DbCon.getConnection());
        	RedStore.model.User user = udao.userLogin(email, password);
        	
        	if(user != null) {
        		
        		request.getSession().setAttribute("auth", user);
     
        		HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("loggedin", "true");
        		httpSession.setAttribute("useremail", email);
        		response.sendRedirect("index.jsp");
        		
        	}
        	else {
        		HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("loggedin", "false");
        		
        		response.sendRedirect("account.jsp");
        		
        	}
        	
        	
        }catch (Exception e){
        	
        }
        
        
	}
    
		
	}


