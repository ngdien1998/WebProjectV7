package quanlynhahang.models.businessmodels;

import quanlynhahang.models.datamodels.ThucDon;
import quanlynhahang.models.viewmodels.UserDbConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserThucDonService extends ConnectDatabase{
    public UserThucDonService(UserDbConnect user) {
        super(user);
    }

    public ArrayList<ThucDon> getBonThucDonHot() throws SQLException, ClassNotFoundException {
        ArrayList<ThucDon> thucDons = new ArrayList<>();
        openConnection();

        String sql = "SELECT * FROM LayBonThucDonHot";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        ResultSet res = statement.executeQuery();

        while(res.next()){
            ThucDon thucDon = new ThucDon();
            thucDon.setIdThucDon(res.getInt(1));
            thucDon.setTenThucDon(res.getString(2));
            thucDon.setMoTa(res.getString(3));
            thucDon.setGia(res.getInt(4));
            thucDon.setPhanTramKhuyenMai(res.getInt(5));
            thucDon.setThu(res.getInt(6));
            thucDon.setHinhThucDon(res.getString(7));
            thucDon.setMucDanhGia(res.getInt(8));

            thucDons.add(thucDon);
        }

        closeConnection();
        return thucDons;
    }
}
