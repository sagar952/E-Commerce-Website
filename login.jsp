
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login-MyCart</title>
        <!--bootstrap and normal css-->
        <%@include  file="components/component_css_js.jsp" %>
        <!--font awesome icons-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--navbar-->
        <%@include  file="components/navbar.jsp" %>
        <!--image background-->

        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-2">
                        <!--card header-->
                        <div class="card-header custom-bg">
                            <h3 class="text-center"><span class="fa fa-drivers-license-o text-center custom-bg "></span>Login Here !!</h3>

                        </div>
                        <!--card body-->
                        <div class="card-body ">
                            <%@include  file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input  name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="Register.jsp" class="mb-2 text-center d-block">if not registered click here</a>
                                <div class="container text-center ">
                                    <button type="submit" class="btn btn-primary custom-bg ">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg">Reset</button>
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
