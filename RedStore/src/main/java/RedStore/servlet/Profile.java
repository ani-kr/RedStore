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


@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try (PrintWriter out= response.getWriter()){
			
			try {
				String FName=request.getParameter("fName");
				String LName=request.getParameter("lName");
				String age=request.getParameter("age");
				String gender=request.getParameter("gender");
				String phone=request.getParameter("phone");
				String email=(String)request.getSession().getAttribute("PEmail");
				
				String inputaddress=request.getParameter("inputaddress");
				String inputaddress2=request.getParameter("inputaddress2");
				String inputcity=request.getParameter("inputcity");
				String inputstate=request.getParameter("inputstate");
				String pincode=request.getParameter("pincode");
				String address= inputaddress+ " "+ inputaddress2+" "+inputcity+" "+inputstate+" "+pincode;
				
				String name=FName+" "+LName;
				Connection con=DbCon.getConnection();
				PreparedStatement pst = con.prepareStatement("insert into profile(name,email,phone,age,gender,address)"+"values(?,?,?,?,?,?)");
				pst.setString(1, name);
				pst.setString(2, email);
				pst.setString(3, phone);
				pst.setString(4, age);
				pst.setString(5, gender);
				pst.setString(6, address);

				pst.executeUpdate();
				
				out.println(gender);
				HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("profile", "true");
        		httpSession.removeAttribute("PEmail");
        		httpSession.removeAttribute("CProfile");
        		httpSession.setAttribute("CProfile", "true");
				response.sendRedirect("index.jsp");
				
		}catch(SQLException e) {
			out.println(e.toString());
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	}
}


