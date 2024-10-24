package RedStore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import RedStore.connection.DbCon;

/**
 * Servlet implementation class Help
 */
@WebServlet("/Help")
public class Help extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Help() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			try (PrintWriter out= response.getWriter()){
			
			try {
				String name=request.getParameter("name");
				String phone=request.getParameter("phone");
				String query=request.getParameter("query");
				String comment=request.getParameter("comment");
				
				//validation
		
				Connection con=DbCon.getConnection();
				PreparedStatement pst = con.prepareStatement("insert into help(name,phone,query,comment)"+ "values(?,?,?,?)");
				
				
				pst.setString(1, name);
				pst.setString(2, phone);
				pst.setString(3, query);
				pst.setString(4, comment);

				pst.executeUpdate();
				
				HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("help", "true");
        		
        		response.sendRedirect("help.jsp");
				
			}
			catch(SQLException e) {
				out.println(e.toString());
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
