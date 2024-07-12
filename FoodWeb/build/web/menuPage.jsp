<%-- Document : menuPage Created on : Jul 3, 2024, 9:29:18 AM Author : htduy
--%> 
<%@page import="dto.Account"%>
<%@page import="java.util.List"%>
<%@page import="dto.Menu"%>
<%@page import="dto.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Duy Hoang Thanh & Phat Tran Tan" />
        <link rel="shortcut icon" href="./img/logo.jpg" type="image/jpg" />
        <title>Menus Page</title>
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

        <link rel="stylesheet" href="./css/styleMenu.css" />
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

                            <%
                                Account acc = (Account) session.getAttribute("LoginedUser");
                                if (acc != null) {
                            %>
                            <li class="nav-item text-center">
                                <a
                                    class="nav-link fs-4 fw-bold"
                                    href="MainController?action=user&accid=<%= acc.getId()%>"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    <i class="fa fa-user"></i>
                                </a>
                            </li>
                            <%
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

                            <li class="nav-item text-center">
                                <a
                                    class="nav-link js-toggle-cart"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    <div>
                                        <i class="fa-solid fa-xl fa-shopping-cart mb-1"></i>
                                        <span
                                            class="badge rounded-pill badge-notification bg-light text-dark"
                                            id="cartCount"
                                            ></span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- body -->
        <div class="container mt-5 mb-5">
            <div class="text-center">
                <h2 class="mb-2 fs-1">Check out our weekly menus!</h2>
                <p class="w-75 m-auto px-1 py-0 fs-5">
                    Choose from a menu of 35 dietitian-designed meals and 60+ add-on
                    options every week.
                </p>
            </div>

            <div class="filterPart my-4">
                <form action="MainController" method="post" class="d-flex">
                    <input
                        class="form-control me-2"
                        type="search"
                        name="txtsearch"
                        placeholder="Search"
                        aria-label="Search"
                        value='${param.searchItem}'
                        />
                    <button
                        id="btnSearch"
                        class="rounded px-3 py-2"
                        type="submit"
                        value="searchMenu"
                        name="action"
                        >
                        <i class="fa fa-search"></i>
                    </button>
                </form>

                <form action="MainController" method="get" class="mt-4">
                    <div class="row">
                        <div class="col-3">
                            <select name="txtType" class="form-select fw-bold">
                                <option value="">Category</option>
                                <option value="Protein+">Protein Plus</option>
                                <option value="Vegan & Veggie">Vegan & Veggie</option>
                            </select>
                        </div>
                        <div class="col-3">
                            <select name="txtWeeklyMenu" class="form-select fw-bold">
                                <option value="">Weekly Menu</option>
                                <option value="1">Jul 14 - Jul 20</option>
                                <option value="2">Jul 21 - Jul 27</option>
                                <option value="3">Jul 28 - Aug 3</option>
                            </select>
                        </div>
                        <div class="col-3">
                            <select name="txtPeriod" class="form-select fw-bold">
                                <option value="">Period</option>
                                <option value="1">Brunch</option>
                                <option value="2">Lunch</option>
                                <option value="3">Dinner</option>
                            </select>
                        </div>
                        <div class="col-3">
                            <button
                                type="submit"
                                value="filterMenus"
                                name="action"
                                id="btnSearch"
                                class="rounded fw-bold px-3 py-2 w-100"
                                >
                                Submit
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="menuList row">
                <%
                    String status = "";
                    ArrayList<Menu> list = (ArrayList<Menu>) request.getAttribute("menuList");
                    if (list != null) {
                        for (Menu menu : list) {
                            status = menu.isStatus() ? "<span class='text-success'>Available</span>" : "<span class='text-danger'>Out of order</span>";
                            List<String> images = menu.getImages();
                            String image1 = images.size() > 0 ? images.get(0) : "";
                            String image2 = images.size() > 1 ? images.get(1) : "";
                            String image3 = images.size() > 2 ? images.get(2) : "";
                            String image4 = images.size() > 3 ? images.get(3) : "";
                %>
                <div class="col-4 mb-5">
                    <div class="card">
                        <div class="row px-3">
                            <div class="col-6 p-2">
                                <img src="<%= image1%>" class="card-img-top rounded w-auto h-100" alt="..."/>
                            </div>
                            <div class="col-6 p-2">
                                <img src="<%= image2%>" class="card-img-top rounded w-auto h-100" alt="..."/>
                            </div>
                        </div>
                        <div class="row px-3">
                            <div class="col-6 p-2">
                                <img src="<%= image3%>" class="card-img-top rounded w-auto h-100" alt="..."/>
                            </div>
                            <div class="col-6 p-2">
                                <img src="<%= image4%>" class="card-img-top rounded w-auto h-100" alt="..."/>
                            </div>
                        </div>
                        <div class="card-body" style="border-top: 2px solid rgb(208, 204, 204)">
                            <a href="viewDetailMenuServlet?menuid=<%= menu.getId()%>">
                                <h5 class="card-title"><%= menu.getName()%></h5>
                            </a>
                            <p class="card-text text-danger fw-bold">Price: <%= menu.getTotalPrice()%>$</p>
                            <p class="card-text fw-bold"><%= status%></p>
                            <div class="row">
                                <div class="col-12">
                                    <%
                                        if (menu.isStatus()) {
                                    %>
                                    <form action="MainController" method="post" style="display: inline">
                                        <input type="hidden" name="itemid" value="<%= menu.getId()%>" />
                                        <input type="hidden" name="action" value="addtocart" />
                                        <input type="hidden" name="actionFrom" value="menu" />
                                        <input type="hidden" name="nextAction" value="openmenu" />
                                        <button class="btn btn-warning w-100 h-100 fw-bold">
                                            <i class="fa fa-shopping-cart"></i>
                                            Add to Cart
                                        </button>
                                    </form>
                                    <%    } else {

                                    %>
                                    <form action="MainController" method="post" style="display: inline">
                                        <input type="hidden" name="itemid" value="<%= menu.getId()%>" />
                                        <input type="hidden" name="action" value="addtocart" />
                                        <input type="hidden" name="actionFrom" value="menu" />
                                        <input type="hidden" name="nextAction" value="openmenu" />
                                        <button class="btn btn-warning w-100 h-100 fw-bold" disabled>
                                            <i class="fa fa-shopping-cart"></i>
                                            Add to Cart
                                        </button>
                                    </form>                       
                                    <% }%>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>

            </div>
        </div>

        <%
            ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
            int total = 0;
            int cartSize = (cart != null) ? cart.size() : 0;
        %>
        <!-- Cart -->
        <div class="cart is-hidden">
            <div class="cart__overlay"></div>
            <div class="cart__contents">
                <div class="cart__products">
                    <h2>Shopping Cart</h2>
                    <div class="products">
                        <table class="table table-striped my-1">
                            <thead>
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody id="cartList">
                                <%
                                    if (cart != null) {
                                        for (CartItem item : cart) {
                                            total += item.getQuantity() * item.getItem().getPrice();
                                %>
                                <tr>
                                    <th scope="row"><%= item.getItem().getName()%></th>
                                    <td>
                                        <div style="display: flex; align-items: center; gap: 7px">
                                            <form action="ModifyCartServlet" method="post" style="display:inline;">
                                                <input type="hidden" name="itemid" value="<%= item.getItem().getId()%>">
                                                <input type="hidden" name="action" value="decrease">
                                                <input type="hidden" name="nextAction" value="openmenu">
                                                <button type="submit" class="btn btn-danger rounded-circle">-</button>
                                            </form>
                                            <span class="fw-bold"><%= item.getQuantity()%></span>
                                            <form action="ModifyCartServlet" method="post" style="display:inline;">
                                                <input type="hidden" name="itemid" value="<%= item.getItem().getId()%>">
                                                <input type="hidden" name="action" value="increase">
                                                <input type="hidden" name="nextAction" value="openmenu">
                                                <button type="submit" class="btn btn-primary rounded-circle">+</button>
                                            </form>
                                        </div>
                                    </td>
                                    <td><%= item.getItem().getPrice()%>$</td>
                                    <td>
                                        <form action="ModifyCartServlet" method="post">
                                            <input type="hidden" name="itemid" value="<%= item.getItem().getId()%>">
                                            <input type="hidden" name="action" value="remove">
                                            <input type="hidden" name="nextAction" value="openmenu">
                                            <button type="submit" class="btn btn-danger">X</button>
                                        </form>
                                    </td>
                                </tr>
                                <% }
                                } else { %> 
                                <tr>
                                    <td class="text-center fw-bold fs-3" colspan="4">Cart is empty</td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="cart__totals">
                    <h3 class="text-start">Total: <%= total%>$</h3>

                    <div class="form__footer mt-3">
                        <button
                            class="btn btn-success py-3 px-4 fs-5 fw-bold"
                            >
                            Pay Now
                        </button>
                        <button
                            class="btn btn-secondary py-3 px-4 fs-5 fw-bold js-toggle-cart"
                            >
                            Continue Shopping
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer
            id="footer"
            class="text-center text-lg-start text-light gradient-custom"
            >
            <section class="p-4">
                <div class="container mt-5">
                    <div class="row mt-3">
                        <div class="col-lg-4 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                <i class="fa fa-utensils"></i>
                                Do Food - Delicious Food
                            </h6>
                            <hr />
                            <p style="width: 80%">
                                We pride ourselves on efficiency, hard work, and delivering the
                                best quality products and ingredients at the best value. Your
                                satisfaction is our top priority.
                            </p>
                        </div>

                        <div class="col-lg-4 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Our networks</h6>
                            <hr />
                            <p>
                                <a href="#!" class="text-reset">Facebook</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Instagram</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Twitter</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Google</a>
                            </p>
                        </div>

                        <div class="col-lg-4 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Contact Us</h6>
                            <hr />
                            <p>
                                <i class="fas fa-home me-3"></i> Ho Chi Minh, Dictrict 9, Viet
                                Nam
                            </p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                dofoodmail.work@mail.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                            <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                        </div>
                    </div>
                </div>
            </section>

            <div
                class="text-center p-4"
                style="background-color: rgba(0, 0, 0, 0.05)"
                >
                &copy; May 2024
                <a class="text-reset fw-bold" href="#">Do Food Store</a>
            </div>
        </footer>

        <!-- Back to top button -->
        <button onclick="topFunction()" id="myBtn">
            <i class="fa fa-angle-up"></i>
        </button>

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
            // count cart
            document.getElementById("cartCount").innerHTML = <%= cartSize%>;

            // toggle shopping cart
            $(".js-toggle-cart, .cart__overlay").on("click", function () {
                $(".cart").toggleClass("is-hidden");
            });

            // back to top
            let mybutton = document.getElementById("myBtn");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (
                        document.body.scrollTop > 20 ||
                        document.documentElement.scrollTop > 20
                        ) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
    </body>
</html>
