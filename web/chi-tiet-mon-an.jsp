<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết món ăn</title>

    <script type="text/javascript" src="assests/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assests/js/parallax.min.js"></script>
    <script type="text/javascript" src="assests/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assests/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="./assests/css/global.css">
    <link rel="stylesheet" href="./assests/css/style.trang-chu.css">
    <link rel="stylesheet" href="./assests/css/style.chi-tiet-mon-an.css">
</head>

<body>
<jsp:include page="_shared/user/nav.jsp" flush="true"/>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
        <li class="breadcrumb-item"><a href="#">Danh mục</a></li>
        <li class="breadcrumb-item active" aria-current="page">Chi tiết món ăn</li>
    </ol>
</nav>
<div class="maincontent">
    <div class="container">


        <div class="row">
            <div class="col-12 col-md-6">
                <div class="container">
                    <img src="${requestScope.monAn.hinhMonAn}" alt="" width="100%">
                </div>
            </div>
            <div class="col-12 col-md-6">
                <!-- info product -->
                <h3 class="title-detail">${requestScope.monAn.tenMonAn}</h3>
                <div class="price-detail">${requestScope.monAn.gia}</div>
                <div class="description-detail">
                    <p>
                        ${requestScope.monAn.moTa}
                    </p>
                </div>
                <div class="input-group mb-3" id="area-mon-an" style="width:120px">
                    <div class="input-group-prepend">
                        <button class="btn btn-outline-primary" type="button" id="button-subtract">-</button>
                    </div>
                    <input type="text" class="form-control number-product" id="txt-so-luong"
                            aria-describedby="button-addon1"
                            value="1">
                    <div class="input-group-prepend">
                        <button class="btn btn-outline-primary" type="button" id="button-add"
                                style="border-radius:0px 4px 4px 0px;">+
                        </button>
                    </div>
                </div>
                <input type="hidden" id="txt-id-mon-an" value="${requestScope.monAn.idMonAn}"/>
                <button class="btn btn-success" id="them-vao-gio-hang">Thêm vào giỏ</button>
            </div>
        </div>
        <hr>

        <div class="product-detail">
            <div class="judge-title">
                <p class="product-detail-title">
                    <b>CHI TIẾT MÓN ĂN</b>
                </p>
            </div>
            <div class="content-detail">
                <p>
                    Cua rang me là món ăn ngon, hội tụ được bốn vị: chua, cay, mặn, ngọt… Đây là một món khá cầu kì nhưng chỉ phù hợp để ăn chơi, được chị em phụ nữ đặc biệt ưa thích. Còn với cánh mày râu thì hơi “kén” hơn một chút do có vị ngọt, mà ngọt thì uống bia, rượu thì không được “vào” cho lắm.
                    Tất nhiên cánh mày râu thì ưa cái vị mặn mặn của Cua rang muối, hoặc cái thơm ngọt của Cua thịt hấp bia hơn. Nhưng nói thật, nhìn cái cảnh chị em xuýt xoa vừa vặn càng cua, xong rồi "chép chép" mấy ngòn tay còn vương sốt me thì cũng khó mà cầm lòng cho được
                </p>
            </div>
        </div>
        <hr>
        <div class="comment col-12">

            <div id="user-judgement">
                <div class="judge-title">
                    <p class="no-margin" style="float:left">
                        <b>ĐÁNH GIÁ</b>
                    </p>
                    <a href="#!" class="small-text" style="float:right">
                        <i class="fas fa-info-circle"></i> Chính sách đánh giá
                    </a>
                    <div class="clearfix"></div>
                </div>
                <div class="danhgia">
                    <textarea class="form-control" rows="3" id="comment"
                            placeholder="Nhập góp ý của quý khách"></textarea>
                    <a href="#!" class="btn btn-success margin-top-8px" style="float:right">
                        Góp ý</a>
                </div>

                <div class="clearfix"></div>

                <div id="user-comments">
                    <div>
                        <div class="comment">
                            <div class="user-avatar">
                                <img src="./assests/images/people.jpg" alt="user-avatar" width="50" height="50"
                                        style="border-radius:50%" style="border-radius:50%">
                            </div>

                            <div class="user-comment">
                                <div class="user-name">
                                    <p class="no-margin">
                                        <b>Nguyễn Thị Minh Thư</b>
                                    </p>
                                    <p class="date-comment" class="small-text">17 tháng 4, 2018</p>
                                </div>
                                <p class="comment-text" class="lighten-text">
                                    Món ăn khá ngon
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="comment">
                            <div class="user-avatar">
                                <img src="./assests/images/people.jpg" alt="user-avatar" width="50" height="50"
                                        style="border-radius:50%">
                            </div>

                            <div class="user-comment">
                                <div class="user-name">
                                    <p class="no-margin">
                                        <b>Trí Trần</b>
                                    </p>
                                    <p class="date-comment" class="small-text">17 tháng 4, 2018</p>
                                </div>
                                <p class="comment-text" class="lighten-text">
                                    Vô cùng ngon, bổ dưỡng cho người dùng
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="comment">
                            <div class="user-avatar">
                                <img src="./assests/images/people.jpg" alt="user-avatar" width="50" height="50"
                                        style="border-radius:50%">
                            </div>

                            <div class="user-comment">
                                <div class="user-name">
                                    <p class="no-margin">
                                        <b>Nguyễn văn hiếu</b>
                                    </p>
                                    <p class="date-comment" class="small-text">17 tháng 4, 2018</p>
                                </div>
                                <p class="comment-text" class="lighten-text">
                                    Tuyệt
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div>
                        <a href="#!" class="btn-flat waves-effect green-text" id="btn-read-all-cmt">
                            <b>ĐỌC TẤT CẢ BÌNH LUẬN</b>
                        </a>
                    </div>
                </div>

            </div>
        </div>
        <h3 class="title-san-pham-khac" style="color: red">Sản phẩm khác</h3>
        <hr>
        <div class="other-product">
            <div class="row">
                <c:forEach var="monAn" items="${requestScope.listMonAn}">
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="/chi-tiet-mon-an?idMonAn=${monAn.idMonAn}">
                            <div class="food-img">
                                <img src="${monAn.hinhMonAn}" width="175px"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">${monAn.tenMonAn}</p>
                                <p class="col-6 price">${monAn.gia}đ</p>
                            </div>
                            <p class="price old-price">${monAn.khuyenMai == 0 ? '' : monAn.gia+(monAn.gia * monAn*khuyenMai)}</p>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="footer parallax-window" data-parallax="scroll"
            data-image-src="assests/images/blur-close-up-cutlery-370984.jpg">
        <div class="container-fluid">
            <div class="footer-title">
                <h1 class="font-blonde-script">Liên hệ</h1>
                <img src="assests/images/logo.png" height="100" width="100"/>
                <p>
                    <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry</i>
                </p>
                <form action="" method="post" class="email-input">
                    <div class="row">
                        <div class="input-group col-6 offset-3">
                            <input type="text" class="form-control" placeholder="Nhập email của bạn"
                                    aria-label="Recipient's username"
                                    aria-describedby="button-addon2">
                            <div class="input-group-append">
                                <input class="btn btn-info" type="submit" id="button-addon2" value="Đăng ký"/>
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
                                <input type="text" class="form-control"/>
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control"/>
                            </div>
                        </div>
                        <textarea class="form-control" rows="8"></textarea>
                        <input type="submit" value="Gửi" class="btn btn-light"/>
                        <input type="button" value="Hủy" class="btn btn-light"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</footer>

<script>
    $("#them-vao-gio-hang").click(() => {
        $.post("/them-vao-gio-hang", {
            txtIdMon: $("#txt-id-mon-an").val(),
            txtSoLuong: $("#txt-so-luong").val()
        }, content => $("#area-mon-an").append("<p>" + content + "</p>"));
    });
</script>

</body>

</html>