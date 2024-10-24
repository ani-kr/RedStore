<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth",auth);
}


%>

<!DOCTYPE html>

<html lang="en">
<head>

<style>
.box{
width: 500px;
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
        
        <%@ include file= "includes/message.jsp" %>
    </div>
        </div>
            
            <div class="box">
            <h4>Inpur your details correctly to reset password</h4>
               <form action="ResetPass" method="post">
		  <div class="form-group">
		
		    <input type="email" class="form-control" id="useremail" name="useremail" aria-describedby="emailHelp" placeholder="Enter email">
		    
		  </div>
		  <div class="form-group">
		    				<select name="SQ" style="">
                            <option hidden value="">Choose your Security Question</option>
                            <option value="HomeTown">What's your hometown?</option>
                            <option value="YourPet">What's your pet name?</option>
                             <input type="text" placeholder="Wrie your answer here" name="SA">
                            </select>
		  </div>
		  
		  <button type="submit" class="btn btn-primary" style="width:110px">Verify</button>
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