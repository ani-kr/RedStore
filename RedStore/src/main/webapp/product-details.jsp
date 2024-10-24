<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth",auth);
}

ProductDao pd= new ProductDao(DbCon.getConnection());
List<Product> products = pd.getEightProducts();

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">


<body>


    <div class="container">
        <%@ include file="includes/header.jsp" %>

    </div>


    <!-- ------ single product details ------- -->

	<%
	
		int id= Integer.parseInt(request.getParameter("id"));
	try{
		
		
		Connection con=DbCon.getConnection();
		String query = "select * from products where id=?";
		PreparedStatement pst=con.prepareStatement(query);
		pst.setInt(1, id);
		ResultSet rs= pst.executeQuery();
		
		while(rs.next()) {
			//int id=rs.getInt("id");
			String name = rs.getString("name");
			String desc=rs.getString("description");
			Double price=rs.getDouble("price");
			String image=rs.getString("image");
			
	
			%>
			
			<div class="smallcontainer singleproduct">
        <div class="row">
            <div class="col2">
                <img src="images/<%=image %>.jpg" width="100%"  id="productimg">

                <div class="small-img-row">

					
                    <div class="small-img-col">
                        <img src="images/<%=image %>.jpg" width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="images/<%=image %>.jpg" width="100%" alt="" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="images/<%=image %>.jpg" width="100%" alt="" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="images/<%=image %>.jpg" width="100%" alt="" class="small-img">
                    </div>
                </div>

            </div>
            <div class="col2">
            
            	
                <h2><%=name %></h2>
                <h4>Rs <%=price %></h4>
                
                <a href="AddToCart?id=<%=id %>" class="btn mb-4">Add to Cart</a>
                <h3>Product Details</h3>
                <br>
                <p><%=desc %></p>
            
                
            </div>
        </div>
    </div>
			
			
			
			
			
			
			<% 

		}		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>


    

    <!-- -------- title -------  -->
    <div class="smallcontainer">
        <div class="row row2">
            <h2>Related Products</h2>
            <p>View More</p>
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

    <%@ include file= "includes/footer.jsp" %>





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


    <!-- ---------- js for product gallery -------  -->

    <script>
        var ProductImg = document.getElementById("productimg");
        var SmallImg = document.getElementsByClassName("small-img");

        SmallImg[0].onclick = function () {
            ProductImg.src = SmallImg[0].src;
        }
        SmallImg[1].onclick = function () {
            ProductImg.src = SmallImg[1].src;
        }
        SmallImg[2].onclick = function () {
            ProductImg.src = SmallImg[2].src;
        }
        SmallImg[3].onclick = function () {
            ProductImg.src = SmallImg[3].src;
        }
    </script>
</body>

</html>