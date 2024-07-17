<%-- 
    Document   : userManager
    Created on : Jul 10, 2024, 1:48:36 PM
    Author     : Tan Phat
--%>

<%@page import="dto.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Duy Hoang Thanh & Phat Tran Tan" />
        <link rel="shortcut icon" href="./img/logo.jpg" type="image/jpg" />
        <title>User Management</title>
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
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="container mt-4">
            <h1 class="mb-4">User Management</h1>

            <!-- Display Users -->
            <h2>Manage Users</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Ward ID</th>
                        <th>District ID</th>
                        <th>City ID</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Account> accounts = (ArrayList<Account>) request.getAttribute("ListUser");
                        if (accounts != null) {
                            for (Account acc : accounts) {
                    %>
                    <tr>
                        <td><%= acc.getId()%></td>
                        <td><%= acc.getFullName()%></td>
                        <td><%= acc.getEmail()%></td>
                        <td><%= acc.getPhone()%></td>
                        <td><%= acc.getAddress()%></td>
                        <td><%= acc.getWardId()%></td>
                        <td><%= acc.getDistrictId()%></td>
                        <td><%= acc.getCityId()%></td>
                        <td><%= acc.getRole()%></td>
                        <td><%= acc.isStatus() ? "Active" : "Inactive"%></td>
                        <td>
                            <form method="post" action="UserManagerServlet?action=block" style="display:inline-block;">
                                <input type="hidden" name="userId" value="<%= acc.getId()%>">
                                <input type="hidden" name="userStatus" value="<%= acc.isStatus()%>">
                                <button type="submit" class="btn btn-sm <%= acc.isStatus() ? "btn btn-danger" : "btn btn-success"%>">
                                    <%= acc.isStatus() ? "Block" : "Unblock"%>
                                </button>
                            </form>
                            <button type="button" class="btn btn-primary btn-sm" onclick="editUser('<%= acc.getId()%>', '<%= acc.getFullName()%>', '<%= acc.getEmail()%>', '<%= acc.getPhone()%>', '<%= acc.getAddress()%>', <%= acc.getWardId()%>, <%= acc.getDistrictId()%>, <%= acc.getCityId()%>, '<%= acc.getRole()%>', <%= acc.isStatus()%>)">Edit</button>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>

            <!-- Edit User Modal -->
            <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="get" action="UserManagerServlet">
                                <input type="hidden" id="editUserId" name="userId">
                                <div class="form-group">
                                    <label for="editUserName">Full Name:</label>
                                    <input type="text" class="form-control" id="editUserName" name="userName" required>
                                </div>
                                <div class="form-group">
                                    <label for="editUserEmail">Email:</label>
                                    <input type="email" class="form-control" id="editUserEmail" name="userEmail" required>
                                </div>
                                <div class="form-group">
                                    <label for="editUserPhone">Phone:</label>
                                    <input type="text" class="form-control" id="editUserPhone" name="userPhone" required>
                                </div>
                                <div class="form-group">
                                    <label for="editUserAddress">Address:</label>
                                    <input type="text" class="form-control" id="editUserAddress" name="userAddress" required>
                                </div>
                                <div class="form-group">
                                    <label for="editUserWardId">Ward ID:</label>
                                    <input type="number" class="form-control" id="editUserWardId" name="userWardId" required>
                                </div>
                                <div class="form-group">
                                    <label for="editUserDistrictId">District ID:</label>
                                    <input type="number" class="form-control" id="editUserDistrictId" name="userDistrictId" required>
                                </div>
                                <div class="form-group">
                                    <label for="editUserCityId">City ID:</label>
                                    <input type="number" class="form-control" id="editUserCityId" name="userCityId" required>
                                </div>
                                <div class="form-group">
                                    <label for="editUserRole">Role:</label>
                                    <input type="text" class="form-control" id="editUserRole" name="userRole" required>
                                </div>
                                <div class="form-group">
                                    <label for="editUserStatus">Status:</label>
                                    <select class="form-control" id="editUserStatus" name="userStatus">
                                        <option value="true">Active</option>
                                        <option value="false">Inactive</option>
                                    </select>
                                </div>
                                <button type="submit" name="action" value="update" class="btn btn-primary">Update User</button>
                            </form>
                        </div>
                    </div>
                </div>
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
        <script>
                                function editUser(id, fullName, email, phone, address, wardId, districtId, cityId, role, status) {
                                    document.getElementById('editUserId').value = id;
                                    document.getElementById('editUserName').value = fullName;
                                    document.getElementById('editUserEmail').value = email;
                                    document.getElementById('editUserPhone').value = phone;
                                    document.getElementById('editUserAddress').value = address;
                                    document.getElementById('editUserWardId').value = wardId;
                                    document.getElementById('editUserDistrictId').value = districtId;
                                    document.getElementById('editUserCityId').value = cityId;
                                    document.getElementById('editUserRole').value = role;
                                    document.getElementById('editUserStatus').value = status ? "true" : "false";
                                    $('#editUserModal').modal('show');
                                }
        </script>
    </body>
</html>
