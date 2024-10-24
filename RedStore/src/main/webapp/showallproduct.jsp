
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%
Admin authadmin = (Admin) request.getSession().getAttribute("authadmin");
if(authadmin != null){
	request.setAttribute("authadmin",authadmin);
}

%>

<!DOCTYPE html>

<html lang="en">

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
    
    
    <style>
    table{
    border:2px solid black;
    }
    
    table tr, table td{
    border:2px solid black;
    
    }
    </style>
</head>
<body>

    <div class="header">
        <div class="container mb-4">
        
        <div class="navbar">
                <div class="logo">
                    <img src="images/logo.png" width="125px" alt="...">
                </div>

                <nav>
                    <ul id="menuitems">
                        <li><a href="admin-home.jsp">Show All Users</a></li>
                        <li><a href="showallproduct.jsp">Show All Products</a></li>
                      	<li><a href="AdminLogout">LogOut</a></li>
     
                    </ul>
                </nav>
                     
                <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
            </div>
            
            
            <h2 class="title">Users Data</h2>
            
            <table>
            <tr>
                <th>Product Id</th>
                <th>Name</th>
                <th>Price</th>
                <th style="text-align:center;">Description</th>
                
            </tr>
            
            	
  			<%

try{
	Connection con=DbCon.getConnection();
	String query="select * from products";
	PreparedStatement pst = con.prepareStatement(query);
	ResultSet rs= pst.executeQuery();
	
	while(rs.next()){
	String id=rs.getString("id");
	String name=rs.getString("name");
	String desc=rs.getString("description");
	String price=rs.getString("price");
	
	
	%>
		
		
		 <tr>
            	<td><%=id %></td>
            	<td><%=name %></td>
            	<td><%=price %></td>
            	<td style="text-align:center;"><%=desc %></td>
            	
            	
	        </tr>
            
	
	<%
	
	}
	
	}
catch(SQLException e){
	out.println(e.toString());
}

%>
            
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
</body>

</html>