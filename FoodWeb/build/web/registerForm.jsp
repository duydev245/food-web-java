<%-- Document : registerForm Created on : Jun 3, 2024, 7:25:57 PM Author : htduy
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="author" content="Duy Hoang Thanh & Phat Tran Tan" />
    <link rel="shortcut icon" href="./img/logo.jpg" type="image/jpg" />
    <title>Register Now</title>
    <!-- bootstrap cdn -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />

    <!-- my css -->
    <link rel="stylesheet" href="./css/styleRegister.css" />
  </head>
  <body>
    <section class="h-custom gradient-custom-2">
      <div class="container py-5">
        <div class="row d-flex justify-content-center align-items-center">
          <div class="col-12">
            <div class="card card-registration" style="border-radius: 15px">
              <div class="card-body p-0">
                <form action="MainController" method="post">
                  <div class="row g-0">
                    <div class="col-6 p-5">
                      <h3 class="mb-5" style="color: #02489d">
                        General Information
                      </h3>

                      <div class="form-floating mb-4 pb-2">
                        <input
                          name="txtname"
                          type="text"
                          class="form-control"
                          id="floatingInput"
                          placeholder="name"
                        />
                        <label for="floatingInput">Full Name</label>
                      </div>

                      <div class="form-floating mb-4 pb-2">
                        <input
                          name="txtpassword"
                          type="password"
                          class="form-control"
                          id="floatingInput"
                          placeholder="password"
                        />
                        <label for="floatingInput">Password</label>
                      </div>

                      <div class="form-floating mb-4 pb-2">
                        <input
                          name="txtemail"
                          type="email"
                          class="form-control"
                          id="floatingInput"
                          placeholder="email"
                        />
                        <label for="floatingInput">Email</label>
                      </div>

                      <div class="form-floating mb-4">
                        <input
                          name="txtphone"
                          type="phone"
                          class="form-control"
                          id="floatingInput"
                          placeholder="phone"
                        />
                        <label for="floatingInput">Phone Number</label>
                      </div>

                      <div class="mb-4 mx-1">
                        <a href="MainController?action=welcome" style="text-decoration: none;">Sign In</a>
                      </div>

                      <p class="mb-4 mx-1 text-muted">&copy; May 2024</p>
                    </div>

                    <div class="col-6 p-5 bg-indigo">
                      <h3 class="mb-5 text-white">Details Information</h3>

                      <div class="form-floating mb-4 pb-2">
                        <input
                          name="txtaddress"
                          type="text"
                          class="form-control"
                          id="floatingInput"
                          placeholder="address"
                        />
                        <label for="floatingInput">Address</label>
                      </div>

                      <div class="mb-4 pb-2">
                        <select
                          class="form-select form-select-lg"
                          name="txtward"
                        >
                          <option>Ward</option>
                          <option value="1">Ward 1</option>
                          <option value="2">Ward 2</option>
                          <option value="3">Ward 3</option>
                          <option value="4">Ward 4</option>
                          <option value="5">Ward 5</option>
                        </select>
                      </div>

                      <div class="mb-4 pb-2">
                        <select
                          class="form-select form-select-lg"
                          name="txtdistrict"
                        >
                          <option>District</option>
                          <option value="1">Dictrict 1</option>
                          <option value="2">Dictrict 2</option>
                          <option value="3">Dictrict 3</option>
                          <option value="4">Dictrict 4</option>
                          <option value="5">Dictrict 5</option>
                        </select>
                      </div>

                      <div class="mb-4 pb-2">
                        <select
                          class="form-select form-select-lg"
                          name="txtcity"
                        >
                          <option>City (Province)</option>
                          <option value="1">Ho Chi Minh City</option>
                        </select>
                      </div>

                      <button
                        type="submit"
                        class="btn-submit"
                        value="saveuser"
                        name="action"
                      >
                        Register
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- bootstrap cdn -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>

<!-- 
    full_name       NVARCHAR(255) NOT NULL,
    [password]      NVARCHAR(MAX) NOT NULL,
    email			NVARCHAR(255) NOT NULL,
    phone           NVARCHAR(20),

    [address]       NVARCHAR(255),
    ward_id         SMALLINT,
    district_id     SMALLINT,
    city_id         SMALLINT, -->
