<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Liên Hệ</title>

    <script type="text/javascript" src="assests/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assests/js/parallax.min.js"></script>
    <script type="text/javascript" src="assests/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assests/css/bootstrap.min.css" />

    <link rel="stylesheet" href="./assests/css/style.trang-chu.css">
    <link rel="stylesheet" href="./assests/css/style.lien-he.css">
    
    <link rel="stylesheet" type="text/css" href="./assests/css/util.css">
    <link rel="stylesheet" type="text/css" href="./assests/css/main.css">
    <link rel="stylesheet" href="./assests/css/global.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
    .outline{
        border: 1px solid gray;
        border-radius:20px;
    }
    </style>
</head>

<body>

<jsp:include page="_shared/user/nav.jsp" flush="true"/>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page"><a href="#">Liên hệ</a></li>
        </ol>
    </nav>



    <div class="maincontent">
        <!-- Contact form -->
        <div class="container">
            <h3 class="title-lien-he mb-am-22">Vị trí nhà hàng</h3>
            <br>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.86217864602!2d106.69171481421604!3d10.821857492290736!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528edfe9be909%3A0xf26d8955dfb14ac6!2zTmjDoCBow6BuZyBWxrDhu51uIENhdQ!5e0!3m2!1svi!2s!4v1539590933885"
                width="1170" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
        <!-- <section class="section-contact bg1-pattern p-t-90 p-b-113"> -->
            <div class="container">
                <h3 class="t-center title-lien-he mt-50 mb-20">
                    Góp ý cho chúng tôi
                </h3>

                <form class="wrap-form-reservation size22 m-l-r-auto">
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Name -->
                            <span class="txt9">
                                Họ và tên
                            </span>

                            <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="name" placeholder="Name">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Email -->
                            <span class="txt9">
                                Email
                            </span>

                            <div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="email" placeholder="Email">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Phone -->
                            <span class="txt9">
                                Số điện thoại
                            </span>

                            <div class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="phone" placeholder="Phone">
                            </div>
                        </div>

                        <div class="col-12">
                            <!-- Message -->
                            <span class="txt9">
                                Góp ý
                            </span>
                            <textarea class="bo-rad-10 size35 bo2 txt10 p-l-20 p-t-15 m-b-10 m-t-3" name="message"
                                placeholder="Message"></textarea>
                        </div>
                    </div>

                    <div class="wrap-btn-booking flex-c-m m-t-13">
                        <!-- Button3 -->
                        <button type="submit" class="btn btn-success w-90">
                            Gửi
                        </button>
                    </div>
                </form>
            </div>
        <!-- </section> -->
    </div>

    <footer>
        <div class="footer parallax-window" data-parallax="scroll" data-image-src="assests/images/blur-close-up-cutlery-370984.jpg">
            <div class="container-fluid">
                <div class="footer-title">
                    <h1 class="font-blonde-script">Liên hệ</h1>
                    <img src="assests/images/logo.png" height="100" width="100" />
                    <p>
                        <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry</i>
                    </p>
                    <form action="" method="post" class="email-input">
                        <div class="row">
                            <div class="input-group col-6 offset-3">
                                <input type="text" class="form-control" placeholder="Nhập email của bạn" aria-label="Recipient's username"
                                    aria-describedby="button-addon2">
                                <div class="input-group-append">
                                    <input class="btn btn-info" type="submit" id="button-addon2" value="Đăng ký" />
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
                        <h1 class="font-blonde-script content-header">Thông tin liên hệ</h1>
                        <p>
                            <b>Địa chỉ:</b>
                            75/6 Trương Văn Hải, Tăng Nhơn Phú B, Q9
                        </p>
                        <p>
                            <b>Email:</b>
                            nhahang@gmail.com
                        </p>
                        <p>
                            <b>Hot line:</b>
                            (098) 765 9898
                        </p>
                        <span class="social">
                            <a></a>
                        </span>
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
</body>

</html>