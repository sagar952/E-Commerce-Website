

<%@page import="java.util.Map"%>
<%@page import="com.mycart.helper.CountProductCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.helper.FactoryProvider"%>

<%@page import="com.mycart.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
//if use not log in
        session.setAttribute("message", "you are not Logged in !!  Login first ");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserTYpe().equals("normal")) {
//if user normal
            session.setAttribute("message", "you are not Admin !! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }

    }
%>

  <%                                CategoryDao list = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> catList = list.getAllCategory();
                            %>
<%
        Map<String,Long> map=CountProductCategory.getCountCategoryProducts(FactoryProvider.getFactory());


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-mycart</title>
        <%@include  file="components/component_css_js.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>
        
        <!--navbar-->
        <%@include  file="components/navbar.jsp" %>        



        <!--boxes-->
        <div  class=" container admin">
            <div clas="container-fluid text-center">
                <%@include  file="components/message.jsp" %>
            </div>
            <!--row for box-->
            <div class="row mt-3">
                <!--first box--> 
                <div class="col-md-4 text-center">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/group-users.png" class="img-fluid rounded-circle"  style="max-width: 125px;"/>
                            </div>
                            <h4><%=map.get("countUsers") %></h4>
                            <h3 class="text-muted text-UpperCase">Users</h3>  

                        </div>
                    </div>
                </div>

                <!--2nd box-->
                <div class="col-md-4 text-center">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/menu.png" class="img-fluid rounded-circle" style="max-width: 125px;"/>
                            </div>
                            <h4><%=catList.size() %></h4>
                            <h3 class="text-muted text-UpperCase">Categories</h3>  

                        </div>
                    </div>
                </div>



                <!--3rd card-->
                <div class="col-md-4 text-center">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/product.png" class="img-fluid rounded-circle" style="max-width: 125px;" />
                            </div>
                            <h4><%=map.get("countProucts")%></h4>
                            <h3  class="text-muted text-UpperCase">Products</h3>  

                        </div>
                    </div>
                </div>
            </div>

            <!--2nd row-->
            <div class="row mt-3">
                <!--1st card-->
                <div class="col-md-6 text-center">
                    <div class="card" data-toggle="modal" data-target="#cat-modal" >
                        <div class="card-body">

                            <div class="container">
                                <img src="img/keys.png" class="img-fluid rounded-circle" style="max-width: 125px;"/>
                            </div>
                            <p class="mt-2">Click here to add new Category</p>
                            <h2 class="text-muted text-UpperCase">Add Category</h2>

                        </div>
                    </div>
                </div>

                <!--2nd card-->

                <!--1st card-->
                <div class="col-md-6 text-center">
                    <div class="card" data-toggle="modal" data-target="#prod-modal">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/product.png" class="img-fluid rounded-circle" style="max-width: 125px;"/>
                            </div>
                            <p class="mt-2" >Click here to add new Product</p>
                            <h2  class="text-muted text-UpperCase" >Add product</h2>


                        </div>
                    </div>
                </div>

            </div>

        </div>

        <!-- start modal add new category-->

        <!-- Modal -->
        <div class="modal fade " id="cat-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg ">
                        <h5 class="modal-title  text-white  " id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory" />


                            <div class="form-group">
                                <input type="text" placeholder="enter the title" name="catTitle" class="form-control" required/>
                            </div>
                            <div class="form-group">
                                <textarea  style="height: 300px" type="text" placeholder="enter category description" name="catDesc" class="form-control" required ></textarea>
                            </div>
                            <div class="container text-center mt-1">
                                <button type="submit" class="btn btn-outline-success">Add Category</button>
                                <button type="reset" class="btn btn-outline-success">reset</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--end of add new category modal-->




        <!--Add product modal-->


        <!-- Modal -->
        <div class="modal fade " id="prod-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg ">
                        <h5 class="modal-title  text-white  " id="exampleModalLabel">Fill Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct" />

                            <!--product name-->
                            <div class="form-group">
                                <input type="text" placeholder="enter the product name" name="pName" class="form-control" required/>
                            </div>

                            <!--product desc-->
                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" type="text" name="pDesc" placeholder="enter the product description" required></textarea>
                            </div>
                            <!--product price-->
                            <div class="form-group">
                                <input type="number" name="pPrice" placeholder="enter the product price" class="form-control" required/>
                            </div>
                            <!--product discount-->
                            <div class="form-group">
                                <input type="number" name="pDiscount" placeholder="enter the product discount" class="form-control" required/>  
                            </div>

                            <!--product quantity-->
                            <div class="form-group">
                                <input type="number" name="pQuantity" placeholder="enter the product qunatity" class="form-control" required/>
                            </div>
                          

                            <!--product category-->
                            <div class="form-group">
                                <select  name="catId" class="form-control" id="">

                                    <%
                                        for (Category cat : catList) {
                                    %>
                                    <option value="<%= cat.getCategoryId()%>"><%= cat.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <!--image select-->
                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>
                                <input type="file" name="pPic" class="form-control" required/>
                            </div>


                            <div class="container text-center mt-1">
                                <button type="submit" class="btn btn-outline-success">Add Product</button>
                                <button type="reset" class="btn btn-outline-success">reset</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--<end of add product modal-->


        <!--common modal start-->



        <%@include  file="components/component_modals.jsp" %>


        <!--common modal end here-->

    </body>
</html>
