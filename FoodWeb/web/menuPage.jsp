<%-- Document : menuPage Created on : Jul 3, 2024, 9:29:18 AM Author : htduy
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <form action="MainController" method="get" class="d-flex">
          <input
            class="form-control me-2"
            type="search"
            name="txtsearch"
            placeholder="Search"
            aria-label="Search"
          />
          <button
            id="btnSearch"
            class="rounded px-3 py-2"
            type="submit"
            value="search"
            name="action"
          >
            <i class="fa fa-search"></i>
          </button>
        </form>

        <form action="MainController" method="get" class="mt-4">
          <div class="row">
            <div class="col-3">
              <select name="txtType" class="form-select fw-bold">
                <option value="">Type</option>
                <option value="1">Protein Plus</option>
                <option value="2">Vegan + Vegie</option>
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
              <select name="txtPrice" class="form-select fw-bold">
                <option value="">Price</option>
                <option value="1">100$ - 200$</option>
                <option value="2">200$ - 400$</option>
                <option value="3">Upper 400$</option>
              </select>
            </div>
            <div class="col-3">
              <button
                type="submit"
                value="filter"
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
        <div class="col-4 mb-5">
          <div class="card">
            <div class="row px-3">
              <div class="col-6 p-2">
                <img
                  src="https://img.hellofresh.com/q_60,w_640,f_auto,c_limit,fl_lossy/hellofresh_s3/image/663e57a9fe8a253ad9a7d6e2-3ee40305.jpeg"
                  class="card-img-top rounded w-auto h-100"
                  alt="..."
                />
              </div>
              <div class="col-6 p-2">
                <img
                  src="https://img.hellofresh.com/q_60,w_640,f_auto,c_limit,fl_lossy/hellofresh_s3/image/645e87b278ea89b5870601a4-c7176d1e.jpg"
                  class="card-img-top rounded w-auto h-100"
                  alt="..."
                />
              </div>
            </div>
            <div class="row px-3">
              <div class="col-6 p-2">
                <img
                  src="https://img.hellofresh.com/q_60,w_640,f_auto,c_limit,fl_lossy/hellofresh_s3/image/643d78435d43c53662003f65-44c90c92.jpg"
                  class="card-img-top rounded w-auto h-100"
                  alt="..."
                />
              </div>
              <div class="col-6 p-2">
                <img
                  src="https://images.everyplate.com/f_auto,fl_lossy,q_auto,w_525/everyplate_s3/image/pineapple-turmeric-juice-w11-7585adae.jpg"
                  class="card-img-top rounded w-auto h-100"
                  alt="..."
                />
              </div>
            </div>

            <div
              class="card-body"
              style="border-top: 2px solid rgb(208, 204, 204)"
            >
              <a href="">
                <h5 class="card-title">
                  Enjoy dietitian-designed meals packed with premium,
                  nutritional quality.
                </h5>
              </a>
              <p class="card-text text-danger fw-bold">Price: 260$</p>
              <div class="row">
                <!-- <div class="col-2">
                  <a href="#">
                    <button class="btn btn-danger w-100 h-100">
                      <i class="fa fa-heart"></i>
                    </button>
                  </a>
                </div> -->
                <div class="col-12">
                  <a href="#">
                    <button class="btn btn-warning w-100 h-100 fw-bold">
                      <i class="fa fa-shopping-cart"></i>
                      Add to Cart
                    </button>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
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
                <tr>
                  <th scope="row">Thịt Kho Tộ</th>
                  <td>
                    <button class="btn btn-danger rounded-circle">-</button>
                    <span class="fw-bold">1</span>
                    <button class="btn btn-primary rounded-circle">+</button>
                  </td>
                  <td>150000 VND</td>
                  <td><button class="btn btn-danger">X</button></td>
                </tr>
                <tr>
                  <th scope="row">Thịt Kho Tộ</th>
                  <td>
                    <button class="btn btn-danger rounded-circle">-</button>
                    <span class="fw-bold">1</span>
                    <button class="btn btn-primary rounded-circle">+</button>
                  </td>
                  <td>150000 VND</td>
                  <td><button class="btn btn-danger">X</button></td>
                </tr>
                <tr>
                  <th scope="row">Thịt Kho Tộ</th>
                  <td>
                    <button class="btn btn-danger rounded-circle">-</button>
                    <span class="fw-bold">1</span>
                    <button class="btn btn-primary rounded-circle">+</button>
                  </td>
                  <td>150000 VND</td>
                  <td><button class="btn btn-danger">X</button></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="cart__totals">
          <h3 class="text-start">Total: 500000 VND</h3>

          <div class="form__footer mt-3">
            <button
              class="btn btn-success py-3 px-4 fs-5 fw-bold"
              onclick="payNow()"
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
      document.getElementById("cartCount").innerHTML = "4";

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