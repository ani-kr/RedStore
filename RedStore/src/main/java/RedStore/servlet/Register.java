package RedStore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.mysql.cj.xdevapi.Statement;

import RedStore.connection.DbCon;
import RedStore.model.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try (PrintWriter out= response.getWriter()){	
			try {
				String userMail=request.getParameter("uemail");
				String userName=request.getParameter("uname");
				String Pass=request.getParameter("upass");
				String CPass=request.getParameter("cpass");
				String SQ=request.getParameter("SQ");
				String SA=request.getParameter("SA");
				
				HttpSession httpSession= request.getSession();
				//validation

				if(userName.isBlank() || userMail.isBlank() || Pass.isBlank() || CPass.isBlank()) {
					httpSession.setAttribute("NoFill", "true");
					response.sendRedirect("account.jsp");
					
				}else {
					
					if(Pass.equals(CPass)) {
						Connection con=DbCon.getConnection();
						
						PreparedStatement pst1 = con.prepareStatement("select * from users where email=?");
						pst1.setString(1, userMail);
						ResultSet rs= pst1.executeQuery();
						
						if(!rs.next()) {
							PreparedStatement pst = con.prepareStatement("insert into users(name,email,password,SQ,SA)"+ "values(?,?,?,?,?)");
							
							
							pst.setString(1, userName);
							pst.setString(2, userMail);
							pst.setString(3, Pass);
							pst.setString(4, SQ);
							pst.setString(5, SA);

							pst.executeUpdate();
							
			        		httpSession.setAttribute("signup", "true");
			        		httpSession.setAttribute("PEmail", userMail);
			        		httpSession.setAttribute("CProfile", "false");
			        		response.sendRedirect("index.jsp");
						}
						else {
							httpSession.setAttribute("AccExist", "true");
							response.sendRedirect("account.jsp");
						}
		
						
					}else {
						httpSession.setAttribute("PassMiss", "true");
						response.sendRedirect("account.jsp");
					}
					
					
				}
				

				
			}
			catch(SQLException e) {
				out.println(e.toString());
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}



	private PreparedStatement prepareStatement(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

}
