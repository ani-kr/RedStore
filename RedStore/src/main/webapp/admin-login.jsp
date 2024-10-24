<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<title>RedStore || Admin Login</title>

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
    
    
    
    <style >
    #Indicator1 {
    width: 100px;
    border: none;
    background: #ff523b;
    height: 3px;
    margin-top: 8px;
   
}

	.span1{
    font-weight: bold;
    padding: 0 10px;
    color: #555;
    cursor: pointer;
    display: inline-block;
	}
    </style>
</head>

<body>

	<div class="header">
			<div class="container">  
            <div class="navbar">
                <div class="logo">
                    <img src="images/logo.png" width="125px" alt="...">
                </div>
                
                <nav>
                    <ul id="menuitems">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="products.jsp">Products</a></li>
                        <li><a href="account.jsp">Account</a></li>
                       
                        
                    </ul>
                </nav>
            </div>
       </div>
      </div>
      
       <!-- ------------account------ -->
      
      <div class="account-page">
        <div class="container">
        <%@ include file="includes/message.jsp" %>
            <div class="row">
                <div class="col2">
                    <img src="images/image1.png" alt="" width="100%">
                </div>

                <div class="col2">
                    <div class="form-container">
                        <div class="form-btn">
                            <h6 class="span1">Admin Login</h6>
                            <hr id="Indicator1">
                        </div>

                        <form action="AdminLogin" id="AdminLogin" method="post">
                            <input type="text" placeholder="Username" name="uemail">
                            <input type="password" placeholder="Password" name="upass">
                            <button type="submit" class="btn">Login</button>
                            
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

    




</body>
</html>