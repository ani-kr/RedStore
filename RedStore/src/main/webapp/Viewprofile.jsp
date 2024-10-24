<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
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


<!DOCTYPE html>
<html lang="en">

<head>
<style>

.box{
    max-width: 500px;
    margin: auto;
    padding-left: 30px;
    padding-right: 30px;
    min-height:70vh;
    
}


body{
background: radial-gradient(#ffdf, #ffd6d6);
}
</style>
</head>

<body>
    <div class="container">
        <%@ include file="includes/header.jsp" %>
    </div>

	<div class="container container-box">
	<%@ include file="includes/message.jsp" %>
	<h2 class="title">Your profile</h2>
	
	
  			
  			
  			<%
String useremail=(String)session.getAttribute("useremail");

try{
	Connection con=DbCon.getConnection();
	String query="select * from profile where email=?";
	PreparedStatement pst = con.prepareStatement(query);
	
	pst.setString(1, useremail);
	ResultSet rs= pst.executeQuery();
	
	while(rs.next()){
	String name=rs.getString("name");
	String email=rs.getString("email");
	String phone=rs.getString("phone");
	String age=rs.getString("age");
	String gender=rs.getString("gender");
	String address=rs.getString("address");
	
	%>
		
		
		 <div class="box">
                
                
                <form>
				  <div class="form-group">
				    <label class="my-0">Name</label>
				    <input type="text" class="form-control"  aria-describedby="emailHelp" value="<%=name%>" disabled>
				    <label class="my-0">Email</label>
				    <input type="text" class="form-control"  aria-describedby="emailHelp" value="<%=email%>" disabled>
				    <label class="my-0">Phone</label>
				    <input type="text" class="form-control"  aria-describedby="emailHelp" value="<%=phone%>" disabled>
				    <label class="my-0">Age</label>
				    <input type="text" class="form-control"  aria-describedby="emailHelp" value="<%=age%>" disabled>
				    <label class="my-0">Gender</label>
				    <input type="text" class="form-control"  aria-describedby="emailHelp" value="<%=gender%>" disabled>
				    <label class="my-0">Address</label>
				    <textarea class="form-control text-wrap" style="height:13vh" aria-describedby="emailHelp" disabled><%=address %></textarea>
				    
				  </div>
				 
				</form>
             	
  
            </div>
            
	
	<%
	
	}
	
	}
catch(SQLException e){
	out.println(e.toString());
}

%>
  			
  			
  			
	
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