package quanlynhahang.controllers.datban;

import quanlynhahang.common.DbAccess;
import quanlynhahang.models.businessmodels.DatBanService;
import quanlynhahang.models.datamodels.DatBan;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XoaDatBanServlet", urlPatterns = {"/admin/xoa-dat-ban"})
public class XoaDatBanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String email = request.getParameter("txtEmail");
            if (email == null || email.equals("")) {
                response.setStatus(400);
                return;
            }

            DatBanService service = new DatBanService(DbAccess.getValue(request));
            service.delete(email);

            response.sendRedirect("/admin/dat-ban");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("email");
            if (id == null || id.trim().equals("")) {
                response.setStatus(400);
                return;
            }
            DatBanService service = new DatBanService(DbAccess.getValue(request));
            DatBan datBan = service.get((id));
            if (datBan == null) {
                response.setStatus(404);
                return;
            }

            request.setAttribute("datBan", datBan);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin-xoa-dat-ban.jsp");
        dispatcher.forward(request, response);
    }
}
