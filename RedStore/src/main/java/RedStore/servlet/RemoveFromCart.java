package RedStore.servlet;

import java.io.IOException;
import java.util.*;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import RedStore.model.Cart;

/**
 * Servlet implementation class RemoveFromCart
 */
@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RemoveFromCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out=response.getWriter()){
			String id= request.getParameter("id");
			if(id!=null) {
				ArrayList<Cart> cart_list=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
				if(cart_list != null) {
					for(Cart c:cart_list) {
						if(c.getId()==Integer.parseInt(id)) {
							cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
				}
			}else {
				response.sendRedirect("cart.jsp");
			}
			response.sendRedirect("cart.jsp");
		}
	}

	
}
