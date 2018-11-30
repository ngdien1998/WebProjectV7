package quanlynhahang.controllers.baiviet;

import java.text.ParseException;

import quanlynhahang.common.ActionPermissionID;
import quanlynhahang.common.AuthorizePermission;
import quanlynhahang.common.DbAccess;
import quanlynhahang.models.businessmodels.BaiVietService;
import quanlynhahang.models.businessmodels.LoaiBaiVietService;
import quanlynhahang.models.businessmodels.QuanTriVienService;
import quanlynhahang.models.datamodels.BaiViet;
import quanlynhahang.models.datamodels.NguoiDung;
import quanlynhahang.models.viewmodels.UserDbConnect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

@WebServlet(name = "VietBaiServlet", urlPatterns = { "/admin/viet-bai" })
public class VietBaiServlet extends HttpServlet implements ActionPermissionID {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            if (!AuthorizePermission.checkLogined(request)) {
                response.sendError(404);
                return;
            }

            if (!AuthorizePermission.checkPermissionAllowed(request, getPermissionId())) {
                response.sendError(401);
                return;
            }

            BaiViet baiViet = new BaiViet();
            baiViet.setTenBaiViet(request.getParameter("txtTenBaiViet"));
            baiViet.setMoTa(request.getParameter("txtMoTa"));
            baiViet.setNoiDung(request.getParameter("txtNoiDung"));
            if (request.getParameter("chkNguoiDungHienTai") != null) {
                HttpSession session = request.getSession();
                NguoiDung nguoiDungHienTai = (NguoiDung) session.getAttribute("nguoiDungHienTai");
                baiViet.setEmail(nguoiDungHienTai.getEmail());
            } else {
                baiViet.setEmail(request.getParameter("cmbNguoiViet"));
            }
            if (request.getParameter("chkThoiGianHienTai") != null) {
                baiViet.setNgayViet(new Date(new java.util.Date().getTime()));
            } else {
                String ngayViet = request.getParameter("txtThoiGian");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date temp = dateFormat.parse(ngayViet);
                baiViet.setNgayViet(new Date(temp.getTime()));
            }
            baiViet.setIdLoaiBaiViet(Integer.parseInt(request.getParameter("cmbLoaiBaiViet")));

            BaiVietService service = new BaiVietService(DbAccess.getValue(request));
            service.add(baiViet);
        } catch (SQLException | ClassNotFoundException | ParseException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/admin/bai-viet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (!AuthorizePermission.checkLogined(request)) {
                response.sendError(404);
                return;
            }

            if (!AuthorizePermission.checkPermissionAllowed(request, getPermissionId())) {
                response.sendError(401);
                return;
            }

            UserDbConnect admin = DbAccess.getValue(request);
            LoaiBaiVietService loaiBaiVietService = new LoaiBaiVietService(admin);
            request.setAttribute("loaiBaiViets", loaiBaiVietService.getData());
            QuanTriVienService quanTriVienService = new QuanTriVienService(admin);
            request.setAttribute("quanTriViens", quanTriVienService.getData());
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin-viet-bai.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public int getPermissionId() {
        return AuthorizePermission.THEM_BAI_VIET;
    }
}
