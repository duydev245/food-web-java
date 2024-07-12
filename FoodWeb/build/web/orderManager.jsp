<%-- 
    Document   : orderManager
    Created on : Jul 12, 2024, 12:07:27 AM
    Author     : Tan Phat
--%>

<%@page import="dto.Order"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Duy Hoang Thanh & Phat Tran Tan" />
        <link rel="shortcut icon" href="./img/logo.jpg" type="image/jpg" />
        <title>Order Management</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                                <a class="nav-link fs-4 fw-bold" href="MainController?action=orderManager" role="button" aria-haspopup="true" aria-expanded="false">Order Manager</a>
                            </li>
                            <li class="nav-item text-center">
                                <a class="nav-link fs-4 fw-bold" href="MainController?action=dishManager" role="button" aria-haspopup="true" aria-expanded="false">Dishes Manager</a>
                            </li>
                            <li class="nav-item text-center">
                                <a class="nav-link fs-4 fw-bold" href="MainController?action=userManager" role="button" aria-haspopup="true" aria-expanded="false">User Manager</a>
                            </li>
                            <li class="nav-item text-center">
                                <a class="nav-link js-toggle-cart" role="button" aria-haspopup="true" aria-expanded="false">
                                    <div>
                                        <i class="fa-solid fa-xl fa-shopping-cart mb-1"></i>
                                        <span class="badge rounded-pill badge-notification bg-light text-dark" id="cartCount"></span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="container mt-4">
            <!-- Search Orders -->
            <h2>Order Management</h2>
            <div class="mb-4">
                <form class="form-inline" action="OrderManagerServlet" method="GET">
                    <input type="hidden" name="action" value="searchByDate">
                    <label for="orderDate" class="mr-2">Search by Date:</label>
                    <input type="date" class="form-control mr-2" id="orderDate" name="orderDate">
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
            <div class="mb-4">
                <form class="form-inline" action="OrderManagerServlet" method="GET">
                    <input type="hidden" name="action" value="searchByCustomerInfo">
                    <label for="customerInfo" class="mr-2">Search by Phone/Email:</label>
                    <input type="text" class="form-control mr-2" id="customerInfo" name="customerInfo">
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
            <div class="mb-4">
                <form class="form-inline" action="OrderManagerServlet" method="GET">
                    <input type="hidden" name="action" value="groupByAddress">
                    <button type="submit" class="btn btn-success">Group by Address</button>
                </form>
            </div>

            <!-- Display Orders -->
            <c:choose>
                <c:when test="${not empty OrderList}">
                    <h2>Order List</h2>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer Name</th>
                                <th>Order Date</th>
                                <th>Ship Date</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>District</th>
                                <th>Ward</th>
                                <th>Total Price</th>
                                <th>Customer Note</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${OrderList}">
                            <tr>
                                <td>${order.orderId}</td>
                                <td>${order.accountName}</td>
                                <td>${order.orderDate}</td>
                                <td>${order.shipDate}</td>
                                <td>${order.shipAddress}</td>
                                <td>${order.shipCity}</td>
                                <td>${order.shipDistrict}</td>
                                <td>${order.shipWard}</td>
                                <td>${order.totalPrice}</td>
                                <td>${order.customerNote}</td>
                                <td>${order.status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:when test="${not empty OrdersGroupedByAddress}">
                    <h2>Orders Grouped by Address</h2>
                    <c:forEach var="entry" items="${OrdersGroupedByAddress}">
                        <h3>${entry.key}</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer Name</th>
                                    <th>Order Date</th>
                                    <th>Ship Date</th>
                                    <th>Total Price</th>
                                    <th>Customer Note</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${entry.value}">
                                <tr>
                                    <td>${order.orderId}</td>
                                    <td>${order.accountName}</td>
                                    <td>${order.orderDate}</td>
                                    <td>${order.shipDate}</td>
                                    <td>${order.totalPrice}</td>
                                    <td>${order.customerNote}</td>
                                    <td>${order.status}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>No orders found.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>


