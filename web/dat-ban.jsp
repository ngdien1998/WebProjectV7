<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đặt bàn</title>

    <script
      type="text/javascript"
      src="./assests/js/jquery-3.3.1.min.js"
    ></script>
    <script type="text/javascript" src="./assests/js/parallax.min.js"></script>
    <script type="text/javascript" src="./assests/js/bootstrap.min.js"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="assests/css/bootstrap.min.css"
    />

    <link rel="stylesheet" href="./assests/css/style.trang-chu.css" />
    <link rel="stylesheet" href="./assests/css/style.lien-he.css" />
    <!--
      ===============================================================================================
    -->
    <link
      rel="stylesheet"
      type="text/css"
      href="./assests/vendor/bootstrap/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./assests/vendor/daterangepicker/daterangepicker.css"
    />
    <!--
      ===============================================================================================
    -->
    <link rel="stylesheet" type="text/css" href="./assests/css/util.css" />
    <link rel="stylesheet" type="text/css" href="./assests/css/main.css" />
    <link rel="stylesheet" href="./assests/css/global.css" />
    <!--
      ===============================================================================================
    -->
    <style>
      .outline {
        border: 1px solid gray;
        border-radius: 20px;
      }
      small {
        color: red;
      }
    </style>
    <script>
      function validateData() {
        var date = $("#date").val();
        var time = $("#time").val();
        var people = $("#people").val();
        var name = $("#name").val();
        var sdt = $("#phone").val();
        var email = $("#email").val();
        if (people == "" || name == "" || sdt == "" || email == "") {
          alert("Vui lòng nhập đầy đủ thông tin");
          return false;
        }

        if (!/^[0-9]{1,2}$/.test(people)) {
          //alert("Nhập số người phải là nhập số");
          $("#people-message").text("Số người phải nhập số");
          return false;
        } else {
          $("#people-message").text(" ");
        }

        var testsdt = /^[0-9]{10}$/;
        if (!testsdt.test(sdt)) {
          // alert("Số điện thoại không đúng định dạng");
          $("#phone-message").text("Số điện thoại không đúng định dạng");
          sdt.focus;
          return false;
        } else {
          $("#phone-message").text(" ");
        }

        var testemail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!testemail.test(email)) {
          //alert('Vui lòng nhập email hợp lệ.\nExample@gmail.com');
          $("#email-message").text("Email không đúng định dạng");
          email.focus;
          return false;
        } else {
          $("#email-message").text(" ");
        }

        return true;
      }
    </script>
  </head>

  <body>
  <jsp:include page="_shared/user/nav.jsp" flush="true"/>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
        <li class="breadcrumb-item active" aria-current="page">
          <a href="#">Đặt bàn</a>
        </li>
      </ol>
    </nav>

    <div class="maincontent">
      <div class="container">
        <section class="section-reservation bg1-pattern p-t-100 p-b-113">
          <div class="container">
            <div class="row">
              <div class="col-lg-12 ">
                <div class="t-center">
                  <h3 class="tit3 t-center m-b-35 m-t-2 title-dat-ban">
                    Đặt Bàn
                  </h3>
                </div>

                <form class="wrap-form-reservation size22 m-l-r-auto">
                  <div class="row">
                    <div class="col-md-4">
                      <!-- Date -->
                      <span class="txt9"> Date </span>

                      <div
                        class="wrap-inputdate pos-relative txt10 size12 bo2 bo-rad-10 m-t-3 m-b-23"
                      >
                        <input
                          class="my-calendar bo-rad-10 sizefull txt10 p-l-20"
                          type="text"
                          name="date"
                        />
                        <i
                          class="btn-calendar fa fa-calendar ab-r-m hov-pointer m-r-18"
                          aria-hidden="true"
                          id="date"
                        ></i>
                      </div>
                    </div>

                    <div class="col-md-4">
                      <!-- Time -->
                      <span class="txt9"> Time </span>

                      <div
                        class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23"
                      >
                        <input
                          class="bo-rad-10 sizefull txt10 p-l-20"
                          type="time"
                          name="phone"
                          placeholder="Phone"
                          id="time"
                        />
                      </div>
                    </div>
                    <div class="col-md-4">
                      <!-- People -->
                      <span class="txt9"> People </span>

                      <div
                        class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23 people-book-table"
                      >
                        <input
                          class="bo-rad-10 sizefull txt10 p-l-20"
                          type="number"
                          name="people"
                          placeholder="People"
                          id="people"
                        />
                        <small id="people-message"></small>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-4">
                      <!-- Name -->
                      <span class="txt9"> Name </span>

                      <div
                        class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"
                      >
                        <input
                          class="bo-rad-10 sizefull txt10 p-l-20"
                          type="text"
                          name="name"
                          placeholder="Name"
                          id="name"
                        />
                      </div>
                    </div>

                    <div class="col-md-4">
                      <!-- Phone -->
                      <span class="txt9"> Phone </span>

                      <div
                        class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23"
                      >
                        <input
                          class="bo-rad-10 sizefull txt10 p-l-20"
                          type="text"
                          name="phone"
                          placeholder="Phone"
                          id="phone"
                        />
                        <small id="phone-message"></small>
                      </div>
                    </div>

                    <div class="col-md-4">
                      <!-- Email -->
                      <span class="txt9"> Email </span>

                      <div
                        class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23"
                      >
                        <input
                          class="bo-rad-10 sizefull txt10 p-l-20"
                          type="text"
                          name="email"
                          placeholder="Email"
                          id="email"
                        />
                        <small id="email-message"></small>
                      </div>
                    </div>
                  </div>

                  <div class="wrap-btn-booking flex-c-m m-t-6">
                    <!-- Button3 -->
                    <button
                      type="submit"
                      class="btn btn-success"
                      onclick="return validateData()"
                    >
                      Đặt bàn
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>

    <footer>
      <div
        class="footer parallax-window"
        data-parallax="scroll"
        data-image-src="assests/images/blur-close-up-cutlery-370984.jpg"
      >
        <div class="container-fluid">
          <div class="footer-title">
            <h1 class="font-blonde-script">Liên hệ</h1>
            <img src="assests/images/logo.png" height="100" width="100" />
            <p>
              <i
                >Lorem Ipsum is simply dummy text of the printing and
                typesetting industry</i
              >
            </p>
            <form action="" method="post" class="email-input">
              <div class="row">
                <div class="input-group col-6 offset-3">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Nhập email của bạn"
                    aria-label="Recipient's username"
                    aria-describedby="button-addon2"
                  />
                  <div class="input-group-append">
                    <input
                      class="btn btn-info"
                      type="submit"
                      id="button-addon2"
                      value="Đăng ký"
                    />
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="row">
            <div class="col-md-4 col-sm-6 col-12 footer-content">
              <h1 class="font-blonde-script content-header">Thời gian</h1>
              <table class="table">
                <tr>
                  <td style="padding-top: 0;">Thứ 2</td>
                  <td style="padding-top: 0;" align="right">8:00 - 22:00</td>
                </tr>
                <tr>
                  <td>Thứ 3</td>
                  <td align="right">8:00 - 22:00</td>
                </tr>
                <tr>
                  <td>Thứ 4</td>
                  <td align="right">8:00 - 22:00</td>
                </tr>
                <tr>
                  <td>Thứ 6</td>
                  <td align="right">8:00 - 22:00</td>
                </tr>
                <tr>
                  <td>Thứ 7</td>
                  <td align="right">8:00 - 22:00</td>
                </tr>
              </table>
            </div>
            <div class="col-md-4 col-sm-6 col-12 footer-content">
              <h1 class="font-blonde-script content-header">
                Thông tin liên hệ
              </h1>
              <p><b>Địa chỉ:</b> 75/6 Trương Văn Hải, Tăng Nhơn Phú B, Q9</p>
              <p><b>Email:</b> nhahang@gmail.com</p>
              <p><b>Hot line:</b> (098) 765 9898</p>
              <span class="social"> <a></a> </span>
            </div>
            <div class="col-md-4 col-sm-6 col-12 send-contact footer-content">
              <h1 class="font-blonde-script content-header">Gửi liên hệ</h1>
              <form action="#" method="post">
                <div class="form-row">
                  <div class="col-6">
                    <input type="text" class="form-control" />
                  </div>
                  <div class="col-6">
                    <input type="text" class="form-control" />
                  </div>
                </div>
                <textarea class="form-control" rows="8"></textarea>
                <input type="submit" value="Gửi" class="btn btn-light" />
                <input type="button" value="Hủy" class="btn btn-light" />
              </form>
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!--
      ===============================================================================================
    -->
    <script
      type="text/javascript"
      src="./assests/vendor/jquery/jquery-3.2.1.min.js"
    ></script>
    <!--
      ===============================================================================================
    -->
    <script
      type="text/javascript"
      src="./assests/vendor/animsition/js/animsition.min.js"
    ></script>
    <!--
      ===============================================================================================
    -->

    <script
      type="text/javascript"
      src="./assests/vendor/bootstrap/js/bootstrap.min.js"
    ></script>
    <!--
      ===============================================================================================
    -->
    <script
      type="text/javascript"
      src="./assests/vendor/select2/select2.min.js"
    ></script>
    <!--
      ===============================================================================================
    -->
    <script
      type="text/javascript"
      src="./assests/vendor/daterangepicker/moment.min.js"
    ></script>
    <script
      type="text/javascript"
      src="./assests/vendor/daterangepicker/daterangepicker.js"
    ></script>
    <script src="./assests/js/main.js"></script>
    <script>
      $(".select2-selection").click(function() {
        $(".selection-1").addClass();
      });
    </script>
  </body>
</html>
