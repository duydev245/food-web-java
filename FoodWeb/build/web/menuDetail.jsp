<%-- 
    Document   : menuDetail
    Created on : Jul 10, 2024, 3:45:28 PM
    Author     : htduy
--%>

<%@page import="java.util.List"%>
<%@page import="dto.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Duy Hoang Thanh & Phat Tran Tan" />
        <link rel="shortcut icon" href="./img/logo.jpg" type="image/jpg" /> 
        <title>Details Page</title>
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
                    <a
                        class="navbar-brand me-5 py-2 fs-4 fw-bold"
                        href="MainController?action=mainindex"
                        >
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
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <%-- body --%>
        <div class="container mt-5 mb-5">
            <%
                Menu mn = (Menu) request.getAttribute("menuDetail");
                List<String> images = mn.getImages();
                String[] imageArray = new String[4];
                for (int i = 0; i < 4; i++) {
                    imageArray[i] = (i < images.size()) ? images.get(i) : "";
                }
                String status = mn.isStatus() ? "<h5 class='text-success'>Available</h5>" : "<h5 class='text-danger'>Out of order</h5>";
            %>
            <div class="row">
                <h2 class="col-12 mb-2 text-start fs-1">
                    <%= mn.getName()%>
                </h2>
                <div class="col-8 p-2">
                    <div class="row">
                        <% for (int i = 0; i < 4; i++) {%>
                        <div class="col-6 p-2">
                            <img src="<%= imageArray[i]%>" class="rounded w-auto h-100" alt="..." />
                        </div>
                        <% }%>
                    </div>
                </div>
                <div class="col-4">
                    <div>
                        <h3 class="text-center">Nutrition Per Serving</h3>
                        <div class="d-flex align-items-center justify-content-around">
                            <h5>Total calories:</h5>
                            <h5><%= mn.getTotalCalories()%> kcal</h5>
                        </div>
                    </div>
                    <hr />
                    <div>
                        <h3 class="text-center">Description</h3>
                        <p class="fs-5">
                            <%= mn.getDescription()%>
                        </p>
                    </div>
                    <hr />
                    <div>
                        <div class="d-flex align-items-center justify-content-between text-danger">
                            <h5 class="fw-bold">Total price:</h5>
                            <h5><%= mn.getTotalPrice()%>$</h5>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <h5 class="text-dark fw-bold">Status:</h5>
                            <%= status%>
                        </div>
                    </div>
                    <div>
                        <%
                            if (mn.isStatus()) {
                        %>
                        <form action="MainController" method="post" style="display: inline">
                            <input type="hidden" name="itemid" value="<%= mn.getId()%>" />
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
                            <input type="hidden" name="itemid" value="<%= mn.getId()%>" />
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
