package RedStore.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import RedStore.model.Cart;
/**
 * Servlet implementation class QuantityIncDec
 */
@WebServlet("/QuantityIncDec")
public class QuantityIncDec extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public QuantityIncDec() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out= response.getWriter()){
			String action = request.getParameter("action");
			int id= Integer.parseInt(request.getParameter("id"));
			@SuppressWarnings("unchecked")
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			if(action != null && id>=1) {
				if(action.equals("inc")) {
					for(Cart c:cart_list) {
						if(c.getId()==id) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
						else {
							out.println("Error");
						}
					}
				}
				
				
				if(action.equals("dec")) {
					for(Cart c:cart_list) {
						if(c.getId()==id && c.getQuantity()>1) {
							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							break;
						}
						
					}
					response.sendRedirect("cart.jsp");
				}
				else {
					response.sendRedirect("cart.jsp");
				}
				
			}
		}catch(Exception e) {
			e.getStackTrace();
		}
		
		
	}

	

}
