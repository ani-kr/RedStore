<%@page import="java.text.DecimalFormat"%>
<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%@page import="RedStore.dao.*"%>
<%@page import="java.util.*" %>
<%
DecimalFormat dcf=new DecimalFormat("#.##");
request.setAttribute("dcf",dcf);

User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth",auth);
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
.title1 {
    text-align: center;
    position: relative;
    line-height: 60px;
    color: #555;
}

.title1::after {
    content: "";
    background: #ff523b;
    width: 80px;
    height: 5px;
    border-radius: 5px;
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translate(-50%);
}
</style>
</head>


<body>


    <div class="container">
        <%@ include file="includes/header.jsp" %>
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


    <!-- -------- cart item details -------  -->
    	<h2 class="title1">Your Cart</h2>
    <div class="smallcontainer mb-4">
    	<h5>To view your orders please <a href="orders.jsp" class="btn">click here</a></h5>
        <table>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th style="text-align:right;">Sub-Total</th>
            </tr>
            
            <% if(cart_list != null){
				for(Cart c:cartProduct){%>
					<tr>
	                <td>
	                    <div class="cart-info">
	                        <img src="images/<%=c.getImage() %>.jpg" alt="">
	                        <div>
	                            <p><%=c.getName() %></p>
	                            <small>Price: Rs <%=c.getPrice() %></small>
	                            <a href="RemoveFromCart?id=<%= c.getId() %>">Remove</a>
	                        </div>
	                    </div>
	                </td>
	                <td>
	                <a class="btn-sm btn-decre" href="QuantityIncDec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
	                <input type="text" value="<%=c.getQuantity()%>">
	                <a class="btn-sm btn-incre" href="QuantityIncDec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
	                </td>
	                <td>Rs <%=c.getPrice() %></td>
	            </tr>
				<% }
            }
            	%>
            

           

        <div class="total-price">
        
            <table>
                <tr>
                    <td>Sub-Total</td>
                    <td>Rs ${total}</td>
                </tr>

                <tr>
                    <td>Tax</td>
                    <td>Rs ${dcf.format(total*0.1 )}</td>
                </tr>

                <tr>
                    <td>Total</td>
                    <td style="font-weight:bolder;">Rs ${total+ (total*0.1) }</td>
                </tr>
            </table>
        <a class="btn" href="payment.jsp">Check Out</a>
        </div>
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