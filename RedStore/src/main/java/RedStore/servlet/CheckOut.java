package RedStore.servlet;

import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import RedStore.connection.DbCon;
import RedStore.dao.OrderDao;
import RedStore.model.Cart;
import RedStore.model.Order;
import RedStore.model.User;


@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public CheckOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		try{
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			//retrive all cart product
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			User auth = (User) request.getSession().getAttribute("auth");
			
			if(cart_list != null) {
				for(Cart c:cart_list) {
					Order order= new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					OrderDao oDao =  new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);
					if(!result) break;
					
				}
				
				cart_list.clear();
				HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("CheckO", "true"); 
        		response.sendRedirect("index.jsp");
				
				
			}
		}catch(SQLException e) {
			out.println(e.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
