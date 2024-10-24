<%@page import="RedStore.dao.*"%>
<%@page import="RedStore.model.*"%>
<%@page import="java.util.*"%>
<%@page import="RedStore.connection.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list !=null){
	request.setAttribute("cart_list",cart_list);
}
String CProfile = (String)session.getAttribute("CProfile");
%>
<!DOCTYPE html>

<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RedStore | Ecommerce Website Design</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/26b92dd57e.js" crossorigin="anonymous"></script>
    
</head>


            <div class="navbar">
                <div class="logo">
                    <img src="images/logo.png" width="125px" alt="...">
                </div>

                <nav>
                    <ul id="menuitems">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="products.jsp">Products</a></li>
                        <li><a href="help.jsp">Help</a></li>
                                              
                        <%
                        if(auth != null){ 
                        	if(CProfile=="false"){%>
                        		<li><a href="profile.jsp">Profile</a></li>
                        	<%}else{%>                        		
                        	<li><a href="Viewprofile.jsp">Profile</a></li>
                        	<% }
                        %>
                        	
                        	<li><a href="Logout">LogOut</a></li>
                       <%}            
                        else{ %>
                        <li><a href="account.jsp">Account</a></li>
                        <%	
                        }
                        %>
                        
                    </ul>
                </nav>
<%
                        if(auth != null){ %>
                <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" alt=""><span class="badge badge-danger">${cart_list.size()}</span></a>
                 <%}
                        %>
                <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
            </div>

       
