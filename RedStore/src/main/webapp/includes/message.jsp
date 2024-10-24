<% 

String loggedin = (String)session.getAttribute("loggedin");
if(loggedin == "true")
{
	
%>

<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Logged in Successflully !! </strong> Enjoy Shopping
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>


<%		
	session.removeAttribute("loggedin");
}

if(loggedin == "false"){
	%>
	<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>Invalid Username or Password !! </strong> Please check your login credentials.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	
	
	<%
	session.removeAttribute("loggedin");
}

String loggedout = (String)session.getAttribute("loggedout");
if(loggedout=="true")
{
	%>
	
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Logged Out Successflully !! </strong> Hope you will visit again.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("loggedout");
}

String signup = (String)session.getAttribute("signup");
if(signup=="true")
{
	%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Account created successflully !! </strong> Login to start shopping...
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("signup");
	
}


String help = (String)session.getAttribute("help");
if(help=="true")
{
	%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Your query was submitted succesfully.</strong> Our team will reach out to you shortly...
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("help");
	
}

String profile = (String)session.getAttribute("profile");
if(profile=="true")
{
	%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Your profile is updated successfully.</strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("profile");
	
}



String CheckO = (String)session.getAttribute("CheckO");
if(CheckO=="true")
{
	%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Your order has been placed successfully.</strong> <hp>To view your orders please <a href="orders.jsp" class="btn m-0">click here</a></hp>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("CheckO");
	
}


String CancelO = (String)session.getAttribute("CancelO");
if(CancelO=="true")
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Your order has been cancelled successfully.</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("CancelO");
	
}

String LoginCart = (String)session.getAttribute("LoginCart");
if(LoginCart=="false")
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Please login to place your order.</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("LoginCart");
	
}

String ProductExist = (String)session.getAttribute("ProductExist");
if(ProductExist=="true")
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Item already exists in cart. You may increase quantity in cart.</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("ProductExist");
	
}

String NoFill = (String)session.getAttribute("NoFill");
if(NoFill=="true")
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Please fill all the details...</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("NoFill");
	
}


String PassMiss = (String)session.getAttribute("PassMiss");
if(PassMiss=="true")
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Password not matched...Please enter again</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("PassMiss");
	
}


String AccExist = (String)session.getAttribute("AccExist");
if(AccExist=="true")
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Account already exist with this email address. Please login to enjoy shopping.</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("AccExist");
	
}



String adminloggedin = (String)session.getAttribute("adminloggedin");
if(adminloggedin=="true")
{
	%>
	
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Logged in Successflully !! </strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("adminloggedin");
}



String adminloggedout = (String)session.getAttribute("adminloggedout");
if(adminloggedout=="true")
{
	%>
	
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Logged Out Successflully !! </strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("adminloggedout");
}



String changed = (String)session.getAttribute("changed");
if(changed=="true")
{
	%>
	
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Your password has been reset successfully.</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("changed");
}

%>