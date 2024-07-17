<%-- 
    Document   : dishManager
    Created on : Jul 10, 2024, 1:41:42 PM
    Author     : Tan Phat
--%>

<%@page import="dto.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Duy Hoang Thanh & Phat Tran Tan" />
        <link rel="shortcut icon" href="./img/logo.jpg" type="image/jpg" />
        <title>Dish Management</title>
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
            <!-- Display Orders -->
            <h2>Menu Management</h2>
            <button type="button" class="btn btn-success mb-4" data-toggle="modal" data-target="#addItemModal">Add New Item</button>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Dish Name</th>
                        <th>Dish Price</th>
                        <th>Status</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Calories</th>
                        <th>Recipe</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Item> list = (ArrayList<Item>) request.getAttribute("ListDishes");
                        if (list != null) {
                            for (Item it : list) {
                    %>
                    <tr>
                        <td><%= it.getId()%></td>
                        <td><img src="<%= it.getImage1()%>" alt="Dish Image" width="120" height="100"></td>
                        <td><%= it.getName()%></td>
                        <td>$<%= it.getPrice()%></td>
                        <td><%= it.isStatus() ? "Available" : "Unavailable"%></td>
                        <td><%= it.getDesc()%></td>
                        <td><%= it.getCategory()%></td>
                        <td><%= it.getCalories()%></td>
                        <td><%= it.getRecipe()%></td>
                        <td>
                            <form method="post" action="DishManagerServlet?action=delete" style="display:inline-block;">
                                <input type="hidden" name="itemId" value="<%= it.getId()%>">
                                <button type="submit" class="btn btn-danger btn-sm mb-2">Delete</button>
                            </form>
                            <form method="post" action="DishManagerServlet?action=updateStatus" style="display:inline-block;">
                                <input type="hidden" name="itemId" value="<%= it.getId()%>">
                                <button type="submit" class="btn btn-warning btn-sm mb-2">Update Status</button>
                            </form>
                            <button type="button" 
                                    class="btn btn-primary btn-sm" 
                                    data-toggle="modal" 
                                    data-target="#editItemModal"
                                    data-id="<%= it.getId()%>"
                                    data-name="<%= it.getName().replace("'", "&apos;")%>"
                                    data-description="<%= it.getDesc().replace("'", "&apos;")%>"
                                    data-price="<%= it.getPrice()%>"
                                    data-status="<%= it.isStatus()%>"
                                    data-category="<%= it.getCategory().replace("'", "&apos;")%>"
                                    data-calories="<%= it.getCalories()%>"
                                    data-image="<%= it.getImage1()%>"
                                    data-recipe="<%= it.getRecipe().replace("'", "&apos;").replace("\n", "\\n").replace("\r", "\\r")%>"
                                    onclick="editItem(this)">Edit</button>

                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>

            <!-- Add New Menu Item Modal -->
            <div class="modal fade" id="addItemModal" tabindex="-1" role="dialog" aria-labelledby="addItemModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addItemModalLabel">Add New Menu Item</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="DishManagerServlet?action=add">
                                <div class="form-group">
                                    <label for="itemName">Item Name:</label>
                                    <input type="text" class="form-control" id="itemName" name="itemName" required>
                                </div>
                                <div class="form-group">
                                    <label for="itemDescription">Item Description:</label>
                                    <textarea class="form-control" id="itemDescription" name="itemDescription" rows="3" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="itemPrice">Item Price:</label>
                                    <input type="number" step="0.01" class="form-control" id="itemPrice" name="itemPrice" required>
                                </div>
                                <div class="form-group">
                                    <label for="itemStatus">Item Status:</label>
                                    <select class="form-control" id="itemStatus" name="itemStatus">
                                        <option value="true">Available</option>
                                        <option value="false">Unavailable</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="itemCategory">Item Category:</label>
                                    <input type="text" class="form-control" id="itemCategory" name="itemCategory" required>
                                </div>
                                <div class="form-group">
                                    <label for="itemCalories">Item Calories:</label>
                                    <input type="number" class="form-control" id="itemCalories" name="itemCalories" required>
                                </div>
                                <div class="form-group">
                                    <label for="itemImage">Item Image URL:</label>
                                    <input type="text" class="form-control" id="itemImage" name="itemImage" required>
                                </div>
                                <div class="form-group">
                                    <label for="itemRecipe">Item Recipe:</label>
                                    <textarea class="form-control" id="itemRecipe" name="itemRecipe" rows="3" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Add Item</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Edit Menu Item Modal -->
            <div class="modal fade" id="editItemModal" tabindex="-1" role="dialog" aria-labelledby="editItemModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editItemModalLabel">Edit Menu Item</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="DishManagerServlet?action=update">
                                <input type="hidden" id="editItemId" name="itemId">
                                <div class="form-group">
                                    <label for="editItemName">Item Name:</label>
                                    <input type="text" class="form-control" id="editItemName" name="itemName" required>
                                </div>
                                <div class="form-group">
                                    <label for="editItemDescription">Item Description:</label>
                                    <textarea class="form-control" id="editItemDescription" name="itemDescription" rows="3" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="editItemPrice">Item Price:</label>
                                    <input type="number" step="0.01" class="form-control" id="editItemPrice" name="itemPrice" required>
                                </div>
                                <div class="form-group">
                                    <label for="editItemStatus">Item Status:</label>
                                    <select class="form-control" id="editItemStatus" name="itemStatus">
                                        <option value="true">Available</option>
                                        <option value="false">Unavailable</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="editItemCategory">Item Category:</label>
                                    <input type="text" class="form-control" id="editItemCategory" name="itemCategory" required>
                                </div>
                                <div class="form-group">
                                    <label for="editItemCalories">Item Calories:</label>
                                    <input type="number" class="form-control" id="editItemCalories" name="itemCalories" required>
                                </div>
                                <div class="form-group">
                                    <label for="editItemImage">Item Image URL:</label>
                                    <input type="text" class="form-control" id="editItemImage" name="itemImage" required>
                                </div>
                                <div class="form-group">
                                    <label for="editItemRecipe">Item Recipe:</label>
                                    <textarea class="form-control" id="editItemRecipe" name="itemRecipe" rows="3" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
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
                                        function editItem(button) {
                                            const id = button.getAttribute('data-id');
                                            const name = button.getAttribute('data-name');
                                            const description = button.getAttribute('data-description');
                                            const price = button.getAttribute('data-price');
                                            const status = button.getAttribute('data-status');
                                            const category = button.getAttribute('data-category');
                                            const calories = button.getAttribute('data-calories');
                                            const image = button.getAttribute('data-image');
                                            const recipe = button.getAttribute('data-recipe');

                                            document.getElementById('editItemId').value = id;
                                            document.getElementById('editItemName').value = name;
                                            document.getElementById('editItemDescription').value = description;
                                            document.getElementById('editItemPrice').value = price;
                                            document.getElementById('editItemStatus').value = status;
                                            document.getElementById('editItemCategory').value = category;
                                            document.getElementById('editItemCalories').value = calories;
                                            document.getElementById('editItemImage').value = image;
                                            document.getElementById('editItemRecipe').value = recipe;
                                        }
        </script>


    </body>
</html>

