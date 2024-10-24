<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	response.sendRedirect("index.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.new-form {
    height:490px;
}
</style>

</head>


<body>

		<div class="header">
			<div class="container">  
           <%@ include file="includes/header.jsp" %>

           </div>
         </div>
    <!-- ---------- account page ----------  -->
    <div class="account-page">
        <div class="container">
        <%@ include file="includes/message.jsp" %>
            <div class="row">
                <div class="col2">
                    <img src="images/image1.png" alt="" width="100%">
                </div>

                <div class="col2">
                    <div class="form-container new-form" height=490px>
                        <div class="form-btn">
                            <span onclick="login()">Login</span>
                            <span onclick="register()">Register</span>
                            <hr id="Indicator">
                        </div>

                        <form action="Login" id="LoginForm" method="post">
                            <input type="text" placeholder="Username" name="uemail">
                            <input type="password" placeholder="Password" name="upass">
                            <button type="submit" class="btn">Login</button>
                            
                            <br> <br>
                            
                            <p class="text-danger">Forgor password?</p>
                          	<a href="ResetPage.jsp"><p class="text-success"> Click here to reset password</p></a>  
                            <a href="admin-login.jsp">If you are an admin, Click here</a>
                        </form>

                        <form action="Register" id="RegForm" method="post">
                        	<input type="text" placeholder="Username" name="uname">
                            <input type="email" placeholder="Email" name="uemail">
                            <select name="SQ">
                            <option hidden value="">Choose your Security Question</option>
                            <option value="HomeTown">What's your hometown?</option>
                            <option value="YourPet">What's your pet name?</option>
                             <input type="text" placeholder="Wrie your answer here" name="SA">
                            </select>
                            <input type="password" placeholder="Password" name="upass">
                            <input type="password" placeholder="Confirm Password" name="cpass">
                            
                            <button type="submit" class="btn">Sign Up</button>
                        </form>
                    </div>
                </div>
            </div>
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





    <!-- ----------------- js for toggle form ----------  -->

    <script>
        var LoginForm = document.getElementById("LoginForm");
        var RegForm = document.getElementById("RegForm");
        var Indicator = document.getElementById("Indicator");

        function register() {
            RegForm.style.transform = "translateX(0px)";
            LoginForm.style.transform = "translateX(0px)";
            Indicator.style.transform = "translateX(100px)";
        }

        function login() {
            RegForm.style.transform = "translateX(300px)";
            LoginForm.style.transform = "translateX(300px)";
            Indicator.style.transform = "translateX(0px)";
        }
    </script>
</body>

</html>