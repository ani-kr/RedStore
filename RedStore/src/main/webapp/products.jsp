<%@page import="java.util.*"%>
<%@page import="RedStore.dao.ProductDao"%>
<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth",auth);
}

ProductDao pd= new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<body>


    <div class="container">
        <%@ include file="includes/header.jsp" %>
        <%@ include file="includes/message.jsp" %>

    </div>

    <div class="smallcontainer">
        <div class="row row2">
            <h2>All Products</h2>
            
        </div>
    </div>


    <div class="smallcontainer">

        <div class="row">
        
        <%

        if(!products.isEmpty()){
        	for(Product p:products){
        	
        	%>
        		<div class="col4">
                <a href="product-details.jsp?id=<%=p.getId()%>">
                    <img src="images/<%=p.getImage() %>.jpg" alt="">
                </a>
               <h6><a href="product-details.jsp?id=<%=p.getId()%>">
                   <%=p.getName() %></a>
               </h6>
                
                <p>Rs <%=p.getPrice() %></p>
                <a href="AddToCart?id=<%=p.getId() %>" class="btn mt-0">Add to Cart</a>
            </div><%
        	}
        }
        
        %>
            

            
        </div>

        <div class="page-btn">
            <span>1</span>
            <span>2</span>
            <span>3</span>
            <span>4</span>
            <span>&#8594;</span>
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
</body>

</html>