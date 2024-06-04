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
                <form action="MainController">
                  <div class="row g-0">
                    <div class="col-6 p-5">
                      <h3 class="mb-5" style="color: #02489d">
                        Thông tin chung
                      </h3>

                      <div class="form-floating mb-4 pb-2">
                        <input
                          name="txtname"
                          type="text"
                          class="form-control"
                          id="floatingInput"
                          placeholder="name"
                        />
                        <label for="floatingInput">Họ và tên</label>
                      </div>

                      <div class="form-floating mb-4 pb-2">
                        <input
                          name="txtpassword"
                          type="password"
                          class="form-control"
                          id="floatingInput"
                          placeholder="password"
                        />
                        <label for="floatingInput">Mật khẩu</label>
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
                        <label for="floatingInput">Số điện thoại</label>
                      </div>

                      <div class="mb-4 mx-1">
                        <a href="signin.jsp" style="text-decoration: none;">Đăng nhập tài khoản</a>
                      </div>

                      <p class="mb-4 mx-1 text-muted">&copy; May 2024</p>
                    </div>

                    <div class="col-6 p-5 bg-indigo">
                      <h3 class="mb-5 text-white">Thông tin chi tiết</h3>

                      <div class="form-floating mb-4 pb-2">
                        <input
                          name="txtaddress"
                          type="text"
                          class="form-control"
                          id="floatingInput"
                          placeholder="address"
                        />
                        <label for="floatingInput">Địa chỉ</label>
                      </div>

                      <div class="mb-4 pb-2">
                        <select
                          class="form-select form-select-lg"
                          name="txtward"
                        >
                          <option>Phường (Xã)</option>
                          <option value="1">Phường 1</option>
                          <option value="2">Phường 2</option>
                          <option value="3">Phường 3</option>
                        </select>
                      </div>

                      <div class="mb-4 pb-2">
                        <select
                          class="form-select form-select-lg"
                          name="txtdistrict"
                        >
                          <option>Quận (Huyện)</option>
                          <option value="1">Quận 1</option>
                          <option value="2">Quận 2</option>
                          <option value="3">Quận 3</option>
                        </select>
                      </div>

                      <div class="mb-4 pb-2">
                        <select
                          class="form-select form-select-lg"
                          name="txtcity"
                        >
                          <option>Thành Phố (Tỉnh)</option>
                          <option value="1">TP.Hồ Chí Minh</option>
                          <option value="2">Tỉnh Đồng Nai</option>
                          <option value="3">Tỉnh Bình Dương</option>
                        </select>
                      </div>

                      <button
                        type="submit"
                        class="btn-submit"
                        value="saveuser"
                        name="action"
                      >
                        Đăng Ký
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
