<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%
    User user2 = (User) session.getAttribute("current-user");
    if (user2 == null) {

        session.setAttribute("message", "you are not Logged in !!  Login first");
        response.sendRedirect("login.jsp");
    } else {
//admin can check normal user page donot need auth.
    }
%>
<%
             ProductDao list=new ProductDao(FactoryProvider.getFactory());
                             List<Product> pDao=list.getAllProducts();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal-mycart</title>
        <%@include  file="components/component_css_js.jsp" %>
    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>

        <h1>it is normal panel</h1>
        
                    <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-columns">
                               <!--card-->
                                  <%
                                for (Product prod : pDao) {
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
                                if (pDao.size() == 0) {
                                  out.println("<h3>No item in this category</h3>");
                                }
                            %>
                               
                                    
                                </div>
                                
                            </div>
                        </div>
                    
           
                    
                    </div>
          
        

        
        
        
        <!--common modal start-->



        <%@include  file="components/component_modals.jsp" %>


        <!--common modal end here-->
    </body>
</html>
