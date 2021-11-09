
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register-MyCart</title>
        <%@include  file="components/component_css_js.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>
        <!--background-->

        <!--form-->

        <!--form create--> 
        <div class="container-fluid mb-5">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card px-5">
                        <%@include  file="components/message.jsp" %>
                        <div class="card-body">

                            <h3 class="text-center"><span class="fa fa-address-card"></span>Register Here!!</h3>
                            <form action="RegisterServlet" method="post" class="m-auto">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="text"  name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">
                                </div>
                                <div class="form-group">
                                    <label for="name">User User phone no.</label>
                                    <input type="number" name="user_phone" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Phone number">
                                </div>

                                <div class="form-group">
                                    <label for="name">User Type</label>
                                    <input type="text" name="user_type" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Phone number">
                                </div>


                                <div class="form-group">
                                    <label for="name">User Address</label>
                                    <textarea  name="user_address" style="height:150px;" class="form-control" placeholder="enter your Address"></textarea>
                                </div>
                                <a href="login.jsp" class="mb-2 text-center d-block">if registered click here</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>

                            </form>
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
