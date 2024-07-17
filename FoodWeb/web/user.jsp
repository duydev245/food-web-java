<%-- 
    Document   : user
    Created on : Jul 11, 2024, 7:25:47 AM
    Author     : htduy
--%>

<%@page import="dto.Item"%>
<%@page import="dto.Account"%>
<%@page import="dto.CustomerPlan"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Duy Hoang Thanh & Phat Tran Tan" />
        <link rel="shortcut icon" href="./img/logo.jpg" type="image/jpg" />
        <title>User Page</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css"
            integrity="sha512-Ez0cGzNzHR1tYAv56860NLspgUGuQw16GiOOp/I2LuTmpSK9xDXlgJz3XN4cnpXWDmkNBKXR/VDMTCnAaEooxA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
            />
        <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet" />
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"
            />

        <link rel="stylesheet" href="./css/styleDetail.css" />
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand me-5 py-2 fs-4 fw-bold" href="MainController?action=mainindex">
                        <i class="fa fa-utensils"></i>
                        Do Food - Delicious Food
                    </a>

                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto nav1">
                            <li class="nav-item text-center">
                                <a
                                    class="nav-link fs-4 fw-bold"
                                    href="MainController?action=opendish"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    Dishes
                                </a>
                            </li>

                            <li class="nav-item text-center">
                                <a
                                    class="nav-link fs-4 fw-bold"
                                    href="MainController?action=openmenu"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    Menus
                                </a>
                            </li> 

                            <li class="nav-item text-center">
                                <a
                                    class="nav-link fs-4 fw-bold"
                                    href="MainController?action=signout"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    Log Out
                                </a>
                            </li>                            
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%
            ArrayList<CustomerPlan> mealPlan = (ArrayList<CustomerPlan>) session.getAttribute("mealPlan");
            Account acc = (Account) session.getAttribute("LoginedUser");
            String msg = (String) request.getAttribute("message");
            String color = (String) request.getAttribute("color");
        %>
        <h1 class="mt-2 text-center text-primary">Welcome <%= acc.getFullName()%>!</h1>

        <div class="container">
            <div id="user-infor">
                <h5>Your Information:</h5>
                <form action="MainController" method="post">
                    <input type="hidden" name="accountId" value="<%= acc.getId()%>" />
                    <div class="row mt-2">
                        <div class="col-6">
                            <div class="form-floating mb-4 pb-2">
                                <input
                                    name="txtname"
                                    type="text"
                                    class="form-control"
                                    id="floatingInput"
                                    placeholder="name"
                                    value="<%= acc.getFullName()%>"
                                    />
                                <label for="floatingInput">Full Name</label>
                            </div>

                            <div class="form-floating mb-4 pb-2">
                                <input
                                    name="txtemail"
                                    type="email"
                                    class="form-control"
                                    id="floatingInput"
                                    placeholder="email"
                                    value="<%= acc.getEmail()%>"
                                    />
                                <label for="floatingInput">Email</label>
                            </div>

                            <div class="form-floating mb-4 pb-2">
                                <input
                                    name="txtaddress"
                                    type="text"
                                    class="form-control"
                                    id="floatingInput"
                                    placeholder="address"
                                    value="<%= acc.getAddress()%>"
                                    />
                                <label for="floatingInput">Address</label>
                            </div>

                            <div class="form-floating mb-4">
                                <input
                                    name="txtphone"
                                    type="phone"
                                    class="form-control"
                                    id="floatingInput"
                                    placeholder="phone"
                                    value="<%= acc.getPhone()%>"
                                    />
                                <label for="floatingInput">Phone Number</label>
                            </div>

                        </div>

                        <div class="col-6">
                            <div class="mb-4 pb-2">
                                <select
                                    class="form-select"
                                    name="txtward"
                                    >
                                    <option>Ward</option>
                                    <option value="1" <%= acc.getWardId() == 1 ? "selected" : ""%>>Ward 1</option>
                                    <option value="2" <%= acc.getWardId() == 2 ? "selected" : ""%>>Ward 2</option>
                                    <option value="3" <%= acc.getWardId() == 3 ? "selected" : ""%>>Ward 3</option>
                                    <option value="4" <%= acc.getWardId() == 4 ? "selected" : ""%>>Ward 4</option>
                                    <option value="5" <%= acc.getWardId() == 5 ? "selected" : ""%>>Ward 5</option>
                                </select>
                            </div>

                            <div class="mb-4 pb-2">
                                <select
                                    class="form-select"
                                    name="txtdistrict"
                                    >
                                    <option>District</option>
                                    <option value="1" <%= acc.getDistrictId() == 1 ? "selected" : ""%>>District 1</option>
                                    <option value="2" <%= acc.getDistrictId() == 2 ? "selected" : ""%>>District 2</option>
                                    <option value="3" <%= acc.getDistrictId() == 3 ? "selected" : ""%>>District 3</option>
                                    <option value="4" <%= acc.getDistrictId() == 4 ? "selected" : ""%>>District 4</option>
                                    <option value="5" <%= acc.getDistrictId() == 5 ? "selected" : ""%>>District 5</option>
                                </select>
                            </div>

                            <div class="mb-4 pb-2">
                                <select
                                    class="form-select"
                                    name="txtcity"
                                    >
                                    <option>City (Province)</option>
                                    <option value="1" <%= acc.getCityId() == 1 ? "selected" : ""%>>Ho Chi Minh City</option>
                                    <option value="2" <%= acc.getCityId() == 2 ? "selected" : ""%>>Binh Duong Province</option>
                                    <option value="3" <%= acc.getCityId() == 3 ? "selected" : ""%>>Dong Nai</option>
                                </select>
                            </div>

                            <button
                                type="submit"
                                class="btn btn-success"  
                                value="updateInfor"
                                name="action"
                                >
                                Update
                            </button>
                        </div>
                    </div>
                </form>
                <!-- Display feedback message -->
                <div class="<%= color%> fw-bold">
                    <p><%= msg != null ? msg : ""%></p>
                </div>
            </div>
            <div id="Meal-plan">
                <h5>Your Customer Plan:</h5>
                <table class="table table-striped my-1 text-center">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Name</th>
                            <th scope="col">Image</th>
                            <th scope="col">Price</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (mealPlan != null && !mealPlan.isEmpty()) {
                                int count = 0;
                                for (CustomerPlan plan : mealPlan) {
                                    Item item = plan.getItem();
                        %>
                        <tr>
                            <th scope="row"><%= ++count%></th>
                            <td>
                                <a href="MainController?action=detailDishes&itemid=<%= item.getId()%>">
                                    <%= item.getName()%>
                                </a>
                            </td>
                            <td style="width: 20%"><img src="<%= item.getImage1()%>" class="w-100"/></td>
                            <td><%= item.getPrice()%>$</td>
                            <td>
                                <a href="MainController?action=deleteMealPlan&itemid=<%= item.getId()%>">
                                    <button class="btn btn-danger">X</button>
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5">No items in the plan</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>              
            </div>
        </div>

        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"
            integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.min.js"
            integrity="sha512-EKWWs1ZcA2ZY9lbLISPz8aGR2+L7JVYqBAYTq5AXgBkSjRSuQEGqWx8R1zAX16KdXPaCjOCaKE8MCpU0wcHlHA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        ></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="//cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    </body>
</html>
