package quanlynhahang.controllers.thucdon;

import quanlynhahang.common.ActionPermissionID;
import quanlynhahang.common.AuthorizePermission;
import quanlynhahang.common.DbAccess;
import quanlynhahang.models.businessmodels.ThucDonService;
import quanlynhahang.models.datamodels.ThucDon;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ThemThucDonServlet", urlPatterns = {"/admin/them-thuc-don"})
public class ThemThucDonServlet extends HttpServlet implements ActionPermissionID {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (!AuthorizePermission.checkLogined(request)) {
                response.sendError(404);
                return;
            }

            if (!AuthorizePermission.checkPermissionAllowed(request, getPermissionId())) {
                response.sendError(401);
                return;
            }
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=UTF-8");
            ThucDon thucDon = new ThucDon();
            thucDon.setTenThucDon(request.getParameter("txtTenThucDon"));
            String moTa = request.getParameter("txtMoTa");

            thucDon.setMoTa(moTa);
            thucDon.setGia(Integer.parseInt(request.getParameter("txtGia")));
            thucDon.setPhanTramKhuyenMai(Integer.parseInt(request.getParameter("txtPhanTramKhuyenMai")));
            thucDon.setThu(Integer.parseInt(request.getParameter("cmbThu")));

            ThucDonService thucDonService = new ThucDonService(DbAccess.getValue(request));
            thucDonService.add(thucDon);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/admin/thuc-don");
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
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin-them-thuc-don.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public int getPermissionId() {
        return AuthorizePermission.THEM_THUC_DON;
    }
}
