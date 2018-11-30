<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="_shared/admin/top-of-page.jsp" flush="true" />
<title>Sửa bài viết</title>
<jsp:include page="_shared/admin/page-header.jsp" flush="true" />
<script src="<%= request.getContextPath() + "/" %>../../assests/js/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() + "/" %>../../assests/js/ckfinder/ckfinder.js" type="text/javascript"></script>

<div class="card">
    <div class="card-body">
        <h3 class="card-title">Sửa bài viết: "${requestScope.baiViet.tenBaiViet}"</h3>
        <p class="card-description">Vui lòng nhập đầy đủ thông tin yêu cầu</p>
        <form action="/admin/sua-bai-viet" method="post">
            <input type="hidden" value="${requestScope.baiViet.idBaiViet}" name="txtIdBaiViet" />
            <div class="form-group">
                <label for="ten-bai-viet">Tên bài viết (bắt buộc)</label>
                <input type="text" placeholder="Tên bài viết" name="txtTenBaiViet" class="form-control"
                        id="ten-bai-viet" value="${requestScope.baiViet.tenBaiViet}" />
                <small class="text-danger" id="validate-ten-bai-viet"></small>
            </div>
            <div class="form-group">
                <label for="mo-ta">Mô tả bài viết</label>
                <input type="text" placeholder="Mô tả bài viết" name="txtMoTa" class="form-control" id="mo-ta" value="${requestScope.baiViet.moTa}"/>
            </div>
            <div class="form-group">
                <label for="noi-dung">Nội dung bài viết (bắt buộc)</label>
                <textarea class="editorPost" id="noi-dung" name="txtNoiDung">${requestScope.baiViet.noiDung}</textarea>
                <script type="text/javascript">
                    let editor = CKEDITOR.replace("noi-dung");
                    CKFinder.setupCKEditor(editor, "assests/js/ckfinder/");
                </script>
                <small class="text-danger" id="validate-noi-dung"></small>
            </div>
            <div class="form-row">
                <div class="form-group col-2">
                    <label for="nguoi-hien-tai">Người viết bài này là</label>
                    <div class="form-check form-check-flat">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" id="nguoi-hien-tai" name="chkNguoiDungHienTai">
                            Tôi viết
                        </label>
                    </div>
                </div>
                <div class="form-group col-10">
                    <label for="nguoi-viet">Chọn người viết bài (bắt buộc)</label>
                    <select class="form-control border-primary" id="nguoi-viet" name="cmbNguoiViet">
                        <option value="-1">Chọn người viết</option>
                        <c:forEach var="nguoiViet" items="${requestScope.nguoiViets}">
                            <option value="${nguoiViet.email}" <c:if test="${nguoiViet.email == requestScope.tacGia.email}">selected</c:if>>${nguoiViet.hoDem} ${nguoiViet.ten}</option>
                        </c:forEach>
                    </select>
                    <small class="text-danger" id="validate-nguoi-viet"></small>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-2">
                    <label for="thoi-gian-hien-tai">Bài này được viết tại</label>
                    <div class="form-check form-check-flat">
                        <label class="form-check-label">
                            <input disabled type="checkbox" class="form-check-input" name="chkThoiGianHienTai" id="thoi-gian-hien-tai">
                            Thời gian hiện tại
                        </label>
                    </div>
                </div>
                <div class="form-group col-10">
                    <label for="thoi-gian">Chọn thời gian viết bài (bắt buộc)</label>
                    <input type="date" name="txtThoiGian" id="thoi-gian" class="form-control" value="${requestScope.baiViet.ngayViet}" />
                    <small class="text-danger" id="validate-ngay-viet"></small>
                </div>
            </div>

            <div class="form-group">
                <label for="loai-bai-viet">Chọn loại bài viết</label>
                <select class="form-control border-primary" id="loai-bai-viet" name="cmbLoaiBaiViet">
                    <option value="-1">Chọn loại bài viết</option>
                    <c:forEach var="loaiBaiViet" items="${requestScope.loaiBaiViets}">
                        <option value="${loaiBaiViet.idLoaiBaiViet}" <c:if test="${loaiBaiViet.idLoaiBaiViet == requestScope.loaiBai.idLoaiBaiViet}">selected</c:if>>${loaiBaiViet.tenLoaiBaiViet}</option>
                    </c:forEach>
                </select>
                <small class="text-danger" id="validate-loai-bai-viet"></small>
            </div>
            <div class="form-row justify-content-center">
                <input type="submit" value="Sửa bài viết" class="btn btn-primary btn-rounded" id="btn-submit" />
                <a href="/admin/bai-viet" class="btn btn-success btn-rounded" style="margin-left: 16px;">Về trang chủ</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="_shared/admin/page-footer.jsp" flush="true" />
<script type="text/javascript">
    $("#nguoi-hien-tai").change(() => {
        let isChecked = $("#nguoi-hien-tai").is(":checked");
        if (isChecked) {
            $("#nguoi-viet").attr("disabled", "disabled");
        } else {
            $("#nguoi-viet").removeAttr("disabled");
        }
    });

    $("#thoi-gian-hien-tai").change(() => {
        let isChecked = $("#thoi-gian-hien-tai").is(":checked");
        if (isChecked) {
            $("#thoi-gian").attr("disabled", "disabled");
        } else {
            $("#thoi-gian").removeAttr("disabled");
        }
    });

    function validateForTenBaiViet() {
        let value = $("#ten-bai-viet").val();
        if (value === "") {
            $("#validate-ten-bai-viet").html("Bạn chưa nhập tên bài viết");
            return false;
        }
        $("#validate-ten-bai-viet").html("");
        return true;
    }

    $("#ten-bai-viet").blur(() => validateForTenBaiViet());

    function validateForNoiDung() {
        let value = CKEDITOR.instances["noi-dung"].getData();
        if (value === "") {
            $("#validate-noi-dung").html("Bạn chưa nhập nội dung bài viết");
            return false;
        }
        $("#validate-noi-dung").html("");
        return true;
    }

    $("#noi-dung").blur(() => validateForNoiDung());

    function validateForNguoiViet() {
        let value = $("#nguoi-viet").val();
        if (!$("#nguoi-hien-tai").is(":checked")) {
            if (value === -1 || value === "-1") {
                $("#validate-nguoi-viet").html("Bạn chưa chọn người viết bài");
                return false;
            }
        }
        $("#validate-ngay-viet").html("");
        return true;
    }

    $("#nguoi-viet").change(() => validateForNguoiViet());

    $("#thoi-gian").blur(() => validateForNgayViet());

    function validateForLoaiBaiViet() {
        let value = $("#loai-bai-viet").val();
        if (value === -1 || value === "-1") {
            $("#validate-loai-bai-viet").html("Bạn chưa chọn loại bài viết");
            return false;
        }
        $("#validate-loai-bai-viet").html("");
        return true;
    }

    $("#loai-bai-viet").change(() => validateForLoaiBaiViet());

    $("#btn-submit").click(() => {
        let res = validateForTenBaiViet() & validateForNoiDung() & validateForNguoiViet() & validateForLoaiBaiViet();
        if (res === 0) {
            return false;
        }
        return true;
    });
</script>
<jsp:include page="_shared/admin/end-of-file.jsp" flush="true" />