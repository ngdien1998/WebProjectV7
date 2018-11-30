package quanlynhahang.models.businessmodels;

import quanlynhahang.models.datamodels.MonAn;
import quanlynhahang.models.viewmodels.UserDbConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserTatCaMonAnService extends ConnectDatabase{
    public UserTatCaMonAnService(UserDbConnect user) {
        super(user);
    }

    public ArrayList<MonAn> getData() throws SQLException, ClassNotFoundException {
        ArrayList<MonAn> monAns = new ArrayList<>();
        openConnection();

        String sql = "SELECT  * FROM LayTatCaMonAnA";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        ResultSet res = statement.executeQuery();
        while (res.next()) {
            MonAn monAn = new MonAn();
            monAn.setIdMonAn(res.getInt(1));
            monAn.setTenMonAn(res.getString(2));
            monAn.setDonViTinh(res.getString(3));
            monAn.setMoTa(res.getString(4));
            monAn.setGia(res.getInt(5));
            monAn.setHinhMonAn(res.getString(6));
            monAn.setKhuyenMai(res.getInt(7));
            monAn.setNgayThem(res.getDate(8));
            monAn.setIdLoaiMon(res.getInt(9));

            monAns.add(monAn);
        }
        closeConnection();
        return monAns;
    }

    public ArrayList<MonAn> LayBaMonAnMoiNhat() throws SQLException, ClassNotFoundException {
        ArrayList<MonAn> monAns = new ArrayList<>();
        openConnection();

        String sql = "SELECT  * FROM LAY_BA_MONAN_MOINHATG";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        ResultSet res = statement.executeQuery();
        while (res.next()) {
            MonAn monAn = new MonAn();
            monAn.setIdMonAn(res.getInt(1));
            monAn.setTenMonAn(res.getString(2));
            monAn.setDonViTinh(res.getString(3));
            monAn.setMoTa(res.getString(4));
            monAn.setGia(res.getInt(5));
            monAn.setHinhMonAn(res.getString(6));
            monAn.setKhuyenMai(res.getInt(7));
            monAn.setNgayThem(res.getDate(8));
            monAn.setIdLoaiMon(res.getInt(9));

            monAns.add(monAn);
        }
        closeConnection();
        return monAns;
    }
}
