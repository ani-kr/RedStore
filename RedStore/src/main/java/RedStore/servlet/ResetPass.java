package RedStore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Result;

import RedStore.connection.DbCon;
import RedStore.dao.UserDao;

/**
 * Servlet implementation class ResetPass
 */
@WebServlet("/ResetPass")
public class ResetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String useremail=request.getParameter("useremail");
		String SQ=request.getParameter("SQ");
		String SA=request.getParameter("SA");
	
		
		 try (PrintWriter out = response.getWriter()){
	        	
			 HttpSession httpSession= request.getSession();
			 Connection con=DbCon.getConnection();
				String query="select * from users where email=?";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, useremail);
				ResultSet rs= pst.executeQuery();
				
				while(rs.next()){
				String tSQ=rs.getString("SQ");
				String tSA=rs.getString("SA");
				
				if(SQ.equals(tSQ) && SA.equals(tSA)) {
	        		httpSession.setAttribute("useremail", useremail);
				
					response.sendRedirect("ChangePass.jsp");
				}else {
					httpSession.setAttribute("incorrectSA", "true");
					response.sendRedirect("ResetPage.jsp");
				}
				}
	        	
	        }catch (Exception e){
	        e.printStackTrace();	
	        }
		
		
	}

}
