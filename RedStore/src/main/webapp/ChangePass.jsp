<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth",auth);
}
String useremail=(String)request.getSession().getAttribute("useremail");
%>

<!DOCTYPE html>

<html lang="en">
<head>

<style>
.box{
width: 400px;
margin: 0 auto;
height:50vh;
margin-top:20vh;
}


</style>

</head>
<body>
    <div class="header">
        <div class="container">
        <%@ include file="includes/header.jsp" %> 
        
    </div>
        </div>
            
            
            <div class="box">
        <%@ include file= "includes/message.jsp" %>
            <h4 style="align-text:center">Reset Password</h4>
               <form action="ChangePass" method="post">
		  <div class="form-group">
		
		    <input type="email" class="form-control" id="useremail" name="useremail" aria-describedby="emailHelp" value=<%=useremail %>>
		    
		    <input type="password" class="form-control" id="pass" name="pass"  placeholder="Enter new password">
		    
		    <input type="password" class="form-control" id="Cpass" name="Cpass"  placeholder="Confirm new password">
		  </div>
		  <div class="form-group">
		    				
		  </div>
		  
		  <button type="submit" class="btn btn-primary" style="width:150px">Reset Password</button>
		</form>
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