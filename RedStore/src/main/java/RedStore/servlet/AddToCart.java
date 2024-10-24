package RedStore.servlet;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import RedStore.model.*;


@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		User auth = (User) request.getSession().getAttribute("auth");
		if(auth != null){
			
				try(PrintWriter out= response.getWriter()){
					ArrayList<Cart> cartList  = new ArrayList<>();
					int id= Integer.parseInt(request.getParameter("id"));
					Cart cm= new Cart();
					cm.setId(id);
					cm.setQuantity(1);
					
					HttpSession session =request.getSession();
					@SuppressWarnings("unchecked")
					ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
					
					if(cart_list == null) {
						cartList.add(cm);
						session.setAttribute("cart-list", cartList);
						response.sendRedirect("products.jsp");
					}
					else {
						cartList = cart_list;
						boolean exist=false;
						
						for(Cart c:cartList) {
							if(c.getId()==id) {
								exist=true;
								HttpSession httpSession= request.getSession();
					    		httpSession.setAttribute("ProductExist", "true");
					    		response.sendRedirect("products.jsp");
							}	
						}
						
						if(!exist) {
							cartList.add(cm);
							response.sendRedirect("products.jsp");
						}
					
					
					}
				}
				
		}else {
			HttpSession httpSession= request.getSession();
    		httpSession.setAttribute("LoginCart", "false");
    		response.sendRedirect("account.jsp");
		}
	}

}
