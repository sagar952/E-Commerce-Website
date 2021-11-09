

<%@page import="com.mycart.entities.User"%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

    <div class="container">
        <a class="navbar-brand fa fa-cart-arrow-down " href="index.jsp">MyCart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a data-toggle="modal" data-target="#cart" class="nav-link fa fa-cart-plus" style="font-size:20px;"><span class="cart-items" ></span></a>
                </li>


                <%
                    User user1 = (User) session.getAttribute("current-user");
                    if (user1 == null) {

                %>

                <li class="nav-item active">
                    <a class="nav-link fa fa-user-circle" href="login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link fa fa-user-plus" href="Register.jsp">Register</a>
                </li>

            </ul> 
            <%     } else {

            %>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link " href="<%= user1.getUserTYpe().equals("admin") ? "admin.jsp":"normal.jsp"%>"><span class="fa fa-user-circle-o"></span><%= user1.getUserName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link  " href="LogoutServlet"><span class="fa fa-user-o"></span>Logout</a>
                </li>

            </ul> 
            <%
                }

            %>         

        </div>
    </div>

</nav>
