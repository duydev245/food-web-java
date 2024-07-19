<%-- 
    Document   : orderManager
    Created on : Jul 12, 2024, 12:07:27 AM
    Author     : Tan Phat
--%>

<%@page import="dto.Account"%>
<%@page import="dto.Order"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Duy Hoang Thanh & Phat Tran Tan" />
        <link rel="shortcut icon" href="./img/logo.jpg" type="image/jpg" />
        <title>Order Management</title>
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
        <link rel="stylesheet" href="./css/navbar.css" />
        <style>
            div{
                font-family: Arial, sans-serif;
                font-size: 16px;
            }
            table {
                border-collapse: collapse;
                width: 100%;
                color: #333;
                font-family: Arial, sans-serif;
                font-size: 16px;
                text-align: left;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                margin: auto;
                margin-top: 50px;
                margin-bottom: 50px;
            }
            thead{
                text-align: center;
                background-color: rgb(2, 72, 157);
                color: white;
            }
        </style>
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
                                <a class="nav-link fs-4 fw-bold" href="MainController?action=orderManager" role="button" aria-haspopup="true" aria-expanded="false">Order Management</a>
                            </li>
                            <li class="nav-item text-center">
                                <a class="nav-link fs-4 fw-bold" href="MainController?action=dishManager" role="button" aria-haspopup="true" aria-expanded="false">Dishes Management</a>
                            </li>
                            <li class="nav-item text-center">
                                <a class="nav-link fs-4 fw-bold" href="MainController?action=userManager" role="button" aria-haspopup="true" aria-expanded="false">User Management</a>
                            </li>
                            <%
                                Account acc = (Account) session.getAttribute("LoginedUser");
                                if (acc != null) {
                                    if (acc.getRole().equals("admin")) {
                            %>
                            <li class="nav-item text-center">
                                <a
                                    class="nav-link fs-4 fw-bold"
                                    href="MainController?action=adminindex"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    <i class="fa fa-user"></i>
                                </a>
                            </li> 
                            <%                                }
                            } else {
                            %>
                            <li class="nav-item text-center">
                                <a
                                    class="nav-link fs-4 fw-bold"
                                    href="MainController?action=welcome"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    <i class="fa fa-sign-in-alt"></i>
                                </a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="container mt-4">
            <!-- Search Orders -->
            <h1 class="mb-2 fw-bold">Order Management</h1>
            <div class="background" style="border-collapse: collapse;
                 width: 100%;
                 color: #333;
                 font-family: Arial, sans-serif;
                 font-size: 16px;
                 text-align: left;
                 border-radius: 10px;
                 overflow: hidden;
                 box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                 margin: auto;
                 margin-top: 50px;
                 padding: 10px;
                 margin-bottom: 50px;" >
                <div class="mb-4">
                    <form class="form-inline row" action="OrderManagerServlet" method="GET">
                        <div class="col-5">
                            <label for="orderDateFrom" class="mr-2">From Date:</label>
                            <input type="date" class="form-control mr-2" id="orderDateFrom" name="orderDateFrom">
                        </div>
                        <div class="col-5">
                            <label for="orderDateTo" class="mr-2">To Date:</label>
                            <input type="date" class="form-control mr-2" id="orderDateTo" name="orderDateTo">
                        </div>
                        <div class="mt-4 col-2">
                            <input type="hidden" name="action" value="searchByDateRange">
                            <button type="submit" class="btn btn-primary">Apply</button>
                        </div>
                    </form>
                </div>
                <div class="mb-4">
                    <form class="row form-inline" action="OrderManagerServlet" method="GET">
                        <div class="form-group col-11">
                            <input type="hidden" name="action" value="searchByCustomerInfo">
                            <label for="customerInfo" class="mr-2">Search by Phone/Email:</label>
                            <input type="text" class="form-control mr-2" id="customerInfo" name="customerInfo">
                        </div>
                        <div class="col-1">
                            <button type="submit" class="mt-4 btn btn-primary">Search</button>
                        </div>
                    </form>
                </div>

                <!-- Filter Orders -->
                <form method="get" action="OrderManagerServlet">
                    <input type="hidden" name="action" value="filterOrders">

                    <div class="form-group">
                        <label for="city">City:</label>
                        <select id="city" name="city" class="form-control" onchange="this.form.submit()">
                            <option value="">All</option>
                            <c:forEach var="city" items="${CityList}">
                                <option value="${city}" ${city eq param.city ? 'selected' : ''}>${city}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="district">District:</label>
                        <select id="district" name="district" class="form-control" onchange="this.form.submit()">
                            <option value="">All</option>
                            <c:forEach var="district" items="${DistrictList}">
                                <option value="${district}" ${district eq param.district ? 'selected' : ''}>${district}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="ward">Ward:</label>
                        <select id="ward" name="ward" class="form-control" onchange="this.form.submit()">
                            <option value="">All</option>
                            <c:forEach var="ward" items="${WardList}">
                                <option value="${ward}" ${ward eq param.ward ? 'selected' : ''}>${ward}</option>
                            </c:forEach>
                        </select>
                    </div>
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
                    <h1 class="mb-2 fw-bold">Order List</h1>
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
                                <th>Status change</th>
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
                                    <td id="status-${order.orderId}">
                                        <c:choose>
                                            <c:when test="${order.status == 1}">Pending</c:when>
                                            <c:when test="${order.status == 2}">Delivery</c:when>
                                            <c:when test="${order.status == 3}">Completed</c:when>
                                            <c:otherwise>Unknown</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form class="status-update-form" data-order-id="${order.orderId}">
                                            <select name="status" class="status-select form-control">
                                                <option value="1" ${order.status == 1 ? 'selected' : ''}>Pending</option>
                                                <option value="2" ${order.status == 2 ? 'selected' : ''}>Delivery</option>
                                                <option value="3" ${order.status == 3 ? 'selected' : ''}>Completed</option>
                                            </select>
                                        </form>
                                    </td>
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
                                    <th>Status change</th>
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
                                        <td id="status-${order.orderId}">
                                            <c:choose>
                                                <c:when test="${order.status == 1}">Pending</c:when>
                                                <c:when test="${order.status == 2}">Delivery</c:when>
                                                <c:when test="${order.status == 3}">Completed</c:when>
                                                <c:otherwise>Unknown</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <form class="status-update-form" data-order-id="${order.orderId}">
                                                <select name="status" class="status-select form-control">
                                                    <option value="1" ${order.status == 1 ? 'selected' : ''}>Pending</option>
                                                    <option value="2" ${order.status == 2 ? 'selected' : ''}>Delivery</option>
                                                    <option value="3" ${order.status == 3 ? 'selected' : ''}>Completed</option>
                                                </select>
                                            </form>
                                        </td>
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
        <script>
                            $(document).ready(function () {
                                $(".status-select").change(function () {
                                    var form = $(this).closest(".status-update-form");
                                    var orderId = form.data("order-id");
                                    var status = $(this).val();

                                    $.ajax({
                                        type: "POST",
                                        url: "OrderManagerServlet",
                                        data: {
                                            action: "updateStatus",
                                            orderId: orderId,
                                            status: status
                                        },
                                        success: function (response) {
                                            // Cập nhật trạng thái trong cột "Status"
                                            var statusText;
                                            if (status == 1) {
                                                statusText = "Pending";
                                            } else if (status == 2) {
                                                statusText = "Delivery";
                                            } else if (status == 3) {
                                                statusText = "Completed";
                                            } else {
                                                statusText = "Unknown";
                                            }
                                            $("#status-" + orderId).text(statusText);
                                            alert("Order status updated successfully!");
                                        },
                                        error: function () {
                                            alert("Failed to update order status. Please try again.");
                                        }
                                    });
                                });
                            });
        </script>
    </body>
</html>


