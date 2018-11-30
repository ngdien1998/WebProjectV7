package quanlynhahang.controllers.thucdon;

import quanlynhahang.common.ActionPermissionID;
import quanlynhahang.common.AuthorizePermission;
import quanlynhahang.common.DbAccess;
import quanlynhahang.models.businessmodels.ThucDonService;
import quanlynhahang.models.datamodels.ThucDon;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XoaThucDonServlet", urlPatterns = {"/admin/xoa-thuc-don"})
public class XoaThucDonServlet extends HttpServlet implements ActionPermissionID {
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
            String idThucDon = request.getParameter("txtIdThucDon");
            if (idThucDon == null || idThucDon.trim().equals("")) {
                response.setStatus(400);
                return;
            }

            ThucDonService thucDonService = new ThucDonService(DbAccess.getValue(request));

            thucDonService.delete(Integer.parseInt(idThucDon));

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
            String idThucDon = request.getParameter("idThucDon");
            if (idThucDon == null || idThucDon.trim().equals("")) {
                response.setStatus(400);
                return;
            }
            ThucDonService thucDonService = new ThucDonService(DbAccess.getValue(request));
            ThucDon thucDon = thucDonService.get(Integer.parseInt(idThucDon));
            if (thucDon == null) {
                response.setStatus(404);
                return;
            }

            request.setAttribute("thucDon", thucDon);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin-xoa-thuc-don.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public int getPermissionId() {
        return AuthorizePermission.XOA_THUC_DON;
    }
}
