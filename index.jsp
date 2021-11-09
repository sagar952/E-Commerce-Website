


<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home-MyCart</title>
        <%@include  file="components/component_css_js.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>

        <div class="row mt-3 mx-4">
            <%                  CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                String id = request.getParameter("category");
//            out.print(id);
                List<Category> list = catDao.getAllCategory();

                List<Product> list1 = null;
                if (id == null) {
                    list1 = pDao.getAllProducts();
                } else if (id.trim().equals("all")) {
                    list1 = pDao.getAllProducts();
                } else {
                    int catID = Integer.parseInt(id.trim());
                    list1 = pDao.getAllProductsById(catID);
                }
//                   get Products


            %>
            <!--//show categories-->
            <div class="col-md-2 mt-3">
                <div class="form-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products
                    </a>
                    <%                        for (Category cat : list) {

                    %>
                    <a href="index.jsp?category=<%=cat.getCategoryId()%>" class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>

                    <%
                        }
                    %>

                </div>

            </div>


            <!--show products-->

            <div class="col-md-10">
                <!--row-->
                <div class="row mt-3">
                    <!--full column 12 grids-->
                    <div class="col-md-12">
                        <!--card wrap with cards-->
                        <div class="card-columns">
                            <!--traversing products-->

                            <%
                                for (Product prod : list1) {
                            %>

                            <div class="card product-card">
                                <div class="container text-center">
                                    <img class="card-img-top m-2" src="img/<%=prod.getpPhoto()%>" style="max-height:200px;max-width:100%;width:auto;">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%=prod.getpName()%></h5>
                                    <p class="card-text"><%=Helper.get10Words(prod.getpDesc())%></p>
                                </div>

                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%=prod.getProductId()%>,'<%=prod.getpName()%>',<%=prod.getPriceAfterSubtractDiscount()%>)">Add to cart</button>
                                    <button class="btn custom-bg text-white" ><span>&#8377</span><span><%=prod.getPriceAfterSubtractDiscount() %></span><span> &#8377</span><span class="discount-label"><%=prod.getpPrice()%> /-</span><span><%=prod.getpDiscount() %>%</span><span> off</span></button>
                                </div>
                            </div>

                            <%

                                }
                                if (list1.size() == 0) {
                                  out.println("<h3>No item in this category</h3>");
                                }
                            %>
                        </div>
                    </div>
                </div>


            </div>
        </div>
   <!--common modal start-->
   
  
   
   <%@include  file="components/component_modals.jsp" %>
   
   
   <!--common modal end here-->
                        
    </body>
</html>
