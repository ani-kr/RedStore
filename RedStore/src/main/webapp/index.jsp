
<%@page import="RedStore.connection.DbCon"%>
<%@page import="RedStore.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth",auth);
}

ProductDao pd= new ProductDao(DbCon.getConnection());
List<Product> products = pd.getEightProducts();
List<Product> products1 = pd.getFourProducts();
%>

<!DOCTYPE html>

<html lang="en">

<body>
    <div class="header">
        <div class="container">
        <%@ include file="includes/header.jsp" %> 
        
        <%@ include file= "includes/message.jsp" %>
            <div class="row">
                <div class="col1">
             
                    <h1>Give your workout <br> a new style!</h1>
                    <br>
                    <p>Success isn't always about greatness. It's about consistency. Consistent <br> hardwork gains
                        success.
                        Greatness will come.</p>
                    <a href="" class="btn">Explore Now &#8594;</a>
                </div>

                <div class="col2">
                    <img src="images/image1.png" alt="">
                </div>
            </div>
        </div>
    </div>



    <!-- ------------------------- Featured Categories ---------------------  -->

    <div class="category">

        <div class="smallcontainer">
            <div class="row">
                <div class="col3">
                    <img src="images/category-1.jpg" alt="">
                </div>
                <div class="col3">
                    <img src="images/category-2.jpg" alt="">
                </div>
                <div class="col3">
                    <img src="images/category-3.jpg" alt="">
                </div>
            </div>
        </div>
    </div>


    <!-- ----------------- Featured Products--------------- -->

    <div class="smallcontainer">
        <h2 class="title">Featured Products</h2>
        <div class="row">
            
            <%
        if(!products1.isEmpty()){
        	for(Product p:products1){
        	%>
        		<div class="col4">
                <a href="product-details.jsp?id=<%=p.getId()%>">
                    <img src="images/<%=p.getImage() %>.jpg" alt="">
                </a>
               <h4><a href="product-details.jsp?id=<%=p.getId()%>" style="font-weight:normal;">
                   <%=p.getName() %></a>
               </h4>
                
                <p>Rs <%=p.getPrice() %></p>
            </div><%
        	}
        }
        %> 
        </div>

        <h2 class="title">Latest Products</h2>
        <div class="row">
        
        <%
        if(!products.isEmpty()){
        	for(Product p:products){
        	%>
        		<div class="col4">
                <a href="product-details.jsp?id=<%=p.getId()%>">
                    <img src="images/<%=p.getImage() %>.jpg" alt="">
                </a>
               <h4><a href="product-details.jsp?id=<%=p.getId()%>" style="font-weight:normal;">
                   <%=p.getName() %></a>
               </h4>
                
                <p>Rs <%=p.getPrice() %></p>
            </div><%
        	}
        }
        %>    
        </div>
   
        </div>
    


    <!-- --------------offer ----------------- -->
    <div class="offer">
        <div class="smallcontainer">
            <div class="row">
                <div class="col2">
                    <img src="images/exclusive.png" class="offer-img">
                </div>
                <div class="col2">
                    <p>Exclusively Available on RedStore</p>
                    <h1>Smart Band 4</h1>
                    <small>The Mi Smart Band 4 featires a 39.9% larger (than Mi Band 3) AMOLED color full-touch
                        display
                        with adjustable brightness, so everything is clear as can be.</small>
                    <a href="" class="btn">Buy Now &#8594;</a>
                </div>
            </div>
        </div>
    </div>

    <!-- ---------------Testimonial------------- -->

    <div class="testimonial">
        <div class="smallcontainer">
            <div class="row">
                <div class="col3">
                    <i class="fa fa-quote-left"></i>
                    <p>The quality of the products are very nice and the prices are very affordable and the website 						is very loyal to the customers.
                    </p>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                        <i class="far fa-star"></i>
                    </div>
                    <img src="images/user-1.png" alt="">
                    <h3>Neha Gupta</h3>
                </div>

                <div class="col3">
                    <i class="fa fa-quote-left"></i>
                    <p>The website is fluent and I used to consider it superior,fast and light weight in comparsion 						to other websites.
                    </p>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                        <i class="far fa-star"></i>
                    </div>
                    <img src="images/user-2.png" alt="">
                    <h3>Rohit Singh</h3>
                </div>

                <div class="col3">
                    <i class="fa fa-quote-left"></i>
                    <p>I receive product on time, the website takes very less time to load.The website is user 						friendly.The product buying from this website were worth it.
                    </p>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                        <i class="far fa-star"></i>
                    </div>
                    <img src="images/user-3.png" alt="">
                    <h3>Shivani</h3>
                </div>
            </div>
        </div>
    </div>

    <!-- ---------- brand-------- -->
    <div class="brands">
        <div class="smallcontainer">
            <div class="row">
                <div class="col5">
                    <img src="images/logo-coca-cola.png" alt="">
                </div>

                <div class="col5">
                    <img src="images/logo-godrej.png" alt="">
                </div>

                <div class="col5">
                    <img src="images/logo-oppo.png" alt="">
                </div>

                <div class="col5">
                    <img src="images/logo-paypal.png" alt="">
                </div>

                <div class="col5">
                    <img src="images/logo-philips.png" alt="">
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
</body>

</html>