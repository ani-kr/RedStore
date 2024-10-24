<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth",auth);
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">



<body>

    <div class="header">
        <div class="container">
            <%@ include file= "includes/header.jsp" %>
        </div>
    
        <br>
        <div class="container help ">
        <%@ include file="includes/message.jsp" %>
            <h3>24x7 Help Support||Feed-back|| RedStore</h3>
            <p>The RedStore Help Centre page lists out various types of issues that you may have encountered so that there can be quick resolution and you can go back to shopping online. For example, you can get more information regarding order tracking, delivery date changes, help with returns (and refunds), and much more. The RedStore Help Centre also lists out more information that you may need regarding RedStore, payment, shopping, and more. The page has various filters listed out on the left-hand side so that you can get your queries solved quickly, efficiently, and without a hassle. You can get the RedStore Help Centre number or even access RedStore Help Centre support if you need professional help regarding various topics. The support executive will ensure speedy assistance so that your shopping experience is positive and enjoyable. You can even inform your loved ones of the support page so that they can properly get their grievances addressed as well. Once you have all your queries addressed, you can pull out your shopping list and shop for all your essentials in one place. You can shop during festive sales to get your hands on some unbelievable deals online. This information is updated on 18-May-23</p>

            <br>
            <div class="help-form">
                <div class="help-col1">
                    <h3>Types of Issues</h3>
                    <ul>
                        <li>Help with your issues</li>
                        <li>Help with your orders</li>
                        <li>Help with others</li>
                    </ul>
                    <br>
                    <h3>Help Topics</h3>
                    <ul>
                        <li>Order</li>
                        <li>Cancellation and Return</li>
                        <li>Payment</li>
                        <li>Shopping</li>
                        <li>Wallet</li>
                        <li>Delivery</li>
                        <li>Others</li>
                    </ul>
                </div>

                <div class="help-col2">

                    <form action="Help" method="post">
                        <h3>Write your query to us.</h3>
                        <input type="text" name="name" placeholder="Enter your name">
                        <input type="number" placeholder="Enter your phone number" name="phone">
                        <br>
                        <label for="query">Choose your related query:</label>
                        <select name="query" id="query">
                            <option>Order Related</option>
                            <option>Cancellation and Return</option>
                            <option>Payment</option>
                            <option>Shopping</option>
                            <option>Wallet</option>
                            <option>Delivery</option>
                            <option>Others</option>
                        </select>
                        <br>
                        <textarea class="concern" placeholder="Elaborate your concern:" name="comment"></textarea>
                        <br>
                        <button type="submit">Submit Query</button>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    
 </div>

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
</body>

</html>