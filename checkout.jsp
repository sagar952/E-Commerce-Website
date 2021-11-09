<% User user = (User) session.getAttribute("current-user");
    if (user == null) {
//if use not log in
        session.setAttribute("message", "you are not Logged in !!  Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkout</title>
        <%@include  file="components/component_css_js.jsp" %>
    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>
        
        <!--//message-->
        <%@include  file="components/message.jsp" %>
        
        <!--now create two form--> 
        <div class="container mt-5">
            <div class="row">
                <!--first form-->
                <div class="col-md-6">
                    <div class="card ">
                        <div class="card-body">
                            <h3 class="text-center "><span class="fa fa-archive" ></span>Your selected Products</h3>

                            <div class="cart-body">

                            </div>
                        </div>
                    </div>
                </div>
                <!--card 2nd for details-->
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="text-center"><span class="fa fa-edit"></span>your details for order</h3>
                        <div class="card-body">
                            <form action="CheckoutServlet" method="post">

                                <div class="form-group">
                                    <label>your name:</label>
                                    <input value="<%=user.getUserName() %>" type="text" placeholder="enter your name" name="cart_user_name" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>your email:</label>
                                    <input value="<%=user.getUserEmail() %>" type="email" placeholder="enter your email" name="cart_user_email" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>your contact:</label>
                                    <input value="<%=user.getUserPhone()%>" type="number" placeholder="enter your contact" name="cart_user_contact" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>your shipping address:</label>
                                    <textarea type="text" value="<%=user.getUserAddress() %>" class="form-control" name="cart_user_address" rows="5" cols="5"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Order Now</button>
                                    <button  class="btn btn-outline-primary">Continue Shopping</button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%@include  file="components/component_modals.jsp" %>
    </body>
</html>
