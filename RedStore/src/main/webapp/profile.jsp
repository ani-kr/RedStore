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

<body>


    <div class="container">
        <%@ include file="includes/header.jsp" %>

    </div>

	<div class="container ">
	<%@ include file="includes/message.jsp" %>
	<h2 class="title">Update your profile</h2>
	
	<form action="Profile" method="post">
  			<div class="form-row">
			    <div class="col-4">
			    <label for="fName">First Name</label>
			      <input type="text" class="form-control" placeholder="First name" id="fName" name="fName">
			    </div>
			    <div class="col-4">
			    <label for="lName">Last Name</label>
			     <input type="text" class="form-control" placeholder="Last name" id="lName" name="lName">
			    </div>
			    
			    
			    <div class="col-2">
			    <label for="age">Age</label>
			      <input type="number" class="form-control" placeholder="Age" id="age" name="age">
			    </div>
			    
			    
			    <div class="col-2">
			    <label for="gender">Gender</label>
					  <select class="custom-select  my-2 mr-sm-2" id="gender" name="gender">
					    <option selected>Gender</option>
					    <option value="Male">Male</option>
					    <option value="Female">Female</option>
					  </select>
			    </div>
			    
  			</div>
  			

  			
  			<div class="form-row">
			    <div class="col-4">
			    <label for="email">Email</label>
			      <input type="email" class="form-control" placeholder="Email" value="<%=session.getAttribute("PEmail")%>" name="email" disabled>
			    </div>
			    
			    
			    <div class="col-3">
			    <label for="phone">Phone</label>
			      <input type="text" class="form-control" placeholder="Phone Number" id="phone" name="phone">
			    </div>
			    
			    
			    
  			</div>
  			
  			
					  <div class="form-group">
					    <label for="inputAddress">Address</label>
					    <input type="text" class="form-control" id="inputAddress" placeholder="House Number, Street, Road Name" name="inputaddress">
					  </div>
					  <div class="form-group">
					    <label for="inputAddress2">Address 2</label>
					    <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" name="inputaddress2">
					  </div>
					  <div class="form-row">
					    <div class="form-group col-md-6">
					      <label for="inputCity">City</label>
					      <input type="text" class="form-control" id="inputCity" name="inputcity">
					    </div>
					    <div class="form-group col-md-4">
					      <label for="inputState">State</label>
					     <input type="text" class="form-control" id="inputState" name="inputstate">
					    </div>
					    <div class="form-group col-md-2">
					      <label for="inputZip">Zip</label>
					      <input type="text" class="form-control" id="inputZip" name="pincode">
					    </div>
					  </div>
					 
					
					  <button type="submit" class="btn btn-primary" style="width:110px;">Submit</button>
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