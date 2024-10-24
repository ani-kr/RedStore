<%@page import="java.text.DecimalFormat"%>
<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%@page import="RedStore.dao.*"%>
<%@page import="java.util.*" %>
<%
DecimalFormat dcf=new DecimalFormat("#.##");
request.setAttribute("dcf",dcf);

List<Order> orders= null;
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth",auth);
	orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
}else{
	
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<body>


    <div class="container">
        <%@ include file="includes/header.jsp" %>
        <%@ include file="includes/message.jsp" %>
		<%
		List<Cart> cartProduct =null;
if(cart_list !=null){
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total=pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list",cart_list);
	request.setAttribute("total",total);
}
%>
    </div>

<h2 class="title">Your Orders</h2>
    <!-- -------- cart item details -------  -->
    <div class="smallcontainer cart-page" style="min-height:35vh;">
        <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th style="text-align:right;padding-right:2vw">Cancel</th> 
            </tr>
         </thead>
         
         <tbody>
         <%
         if(orders != null){
        	 for(Order o:orders){%>
        	 <tr>
        		<td><%=o.getDate() %> </td>
        		<td><%=o.getName() %> </td>
        		<td><%=o.getQuantity() %> </td>
        		<td><%=o.getPrice() %> </td>
        		<td><a class="btn" style="padding:1; margin:0;;" href="CancelOrder?id=<%=o.getOrderId()%>">Cancel</a></td>
        	</tr>
        	<%}
         }
         %>
         </tbody>
	</table>
	</div>
      
    



    <!-- ------------footer------ -->

    <%@ include file="includes/footer.jsp" %>





    <!-- ----------JS for toggle menu------- -->
    <script>
        var menuitems = document.getElementById("menuitems");
        menuitems.style.maxHeight = "0px";

        function menutoggle() {
            if (menuitems.style.maxHeight == "0px") {
                menuitems.style.maxHeight = "200px";
            }
            else {
                menuitems.style.maxHeight = "0px";
            }
            console.log("Working")
        }
    </script>


    <!-- ---------- js for product gallery -------  -->

    <script>
        var ProductImg = document.getElementById("productimg");
        var SmallImg = document.getElementsByClassName("small-img");

        SmallImg[0].onclick = function () {
            ProductImg.src = SmallImg[0].src;
        }
        SmallImg[1].onclick = function () {
            ProductImg.src = SmallImg[1].src;
        }
        SmallImg[2].onclick = function () {
            ProductImg.src = SmallImg[2].src;
        }
        SmallImg[3].onclick = function () {
            ProductImg.src = SmallImg[3].src;
        }
    </script>
</body>

</html>