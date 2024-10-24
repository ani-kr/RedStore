package RedStore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import RedStore.connection.DbCon;

/**
 * Servlet implementation class ChangePass
 */
@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession httpSession= request.getSession();
		String useremail=(String)request.getSession().getAttribute("useremail");
		String pass=request.getParameter("pass");
		String Cpass=request.getParameter("Cpass");
	
		System.out.println(pass);
		System.out.println(Cpass);
		System.out.println(useremail);
		
		 try (PrintWriter out = response.getWriter()){
	        	
			 if(pass.equals(Cpass)) {
				 
				 Connection con=DbCon.getConnection();
				String query="update users set password=? where email=?";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,pass);
				pst.setString(2, useremail);
				
				pst.executeUpdate();
				httpSession.setAttribute("changed", "true");
				response.sendRedirect("account.jsp");
			 }else {
				 httpSession.setAttribute("PassMiss", "true");
				 response.sendRedirect("ChangePass.jsp");
			 }
				
				
	        	
	        }catch (Exception e){
	        e.printStackTrace();	
	        }
		
		
	}

}
