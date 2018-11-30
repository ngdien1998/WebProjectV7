package quanlynhahang.controllers.loaibaiviet;

import quanlynhahang.common.DbAccess;
import quanlynhahang.models.businessmodels.LoaiBaiVietService;
import quanlynhahang.models.datamodels.LoaiBaiViet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ThemLoaiBaiVietServlet", urlPatterns = { "/admin/them-loai-bai-viet" })
public class ThemLoaiBaiVietServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            LoaiBaiViet loaiBaiViet = new LoaiBaiViet();
            loaiBaiViet.setTenLoaiBaiViet(request.getParameter("txtTenLoai"));
            loaiBaiViet.setMoTa(request.getParameter("txtMoTa"));

            LoaiBaiVietService service = new LoaiBaiVietService(DbAccess.getValue(request));
            service.add(loaiBaiViet);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/admin/loai-bai-viet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin-them-loai-bai-viet.jsp");
        dispatcher.forward(request, response);
    }
}
