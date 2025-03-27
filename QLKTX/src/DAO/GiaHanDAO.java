package DAO;

import POJO.SinhVien;
import POJO.ViPham;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author My-PC
 */
public class GiaHanDAO {
    private SQLServerProvider provider = new SQLServerProvider();

    public SinhVien layThongTinSinhVien(String maSV) {
        SinhVien sv = null;
        String query = "SELECT MaSV, Ho, Ten, SoCanCuoc, TrangThai, MatKhau FROM SinhVien WHERE MaSV = ?";

        try {
            provider.open();  // Mở kết nối
            Connection conn = provider.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, maSV);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                sv = new SinhVien();
                sv.setMaSV(rs.getString("MaSV"));
                sv.setHo(rs.getString("Ho"));
                sv.setTen(rs.getString("Ten"));
                sv.setSoCanCuoc(rs.getString("SoCanCuoc"));
                sv.setTrangThai(rs.getString("TrangThai"));
                sv.setMatKhau(rs.getString("MatKhau"));
            }

            provider.close();  // Đóng kết nối
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sv;
    }

    public List<ViPham> layThongTinViPham(String maSV) {
        List<ViPham> danhSachViPham = new ArrayList<>();
        String query = "SELECT v.MaViPham, v.NoiDung, sv.ThoiGianViPham, sv.HinhPhat, sv.NguoiTao " +
                       "FROM SinhVienViPham sv " +
                       "JOIN ViPham v ON sv.MaViPham = v.MaViPham " +
                       "WHERE sv.MaSV = ?";

        try {
            provider.open();  // Mở kết nối
            Connection conn = provider.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, maSV);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ViPham vp = new ViPham();
                vp.setMaViPham(rs.getString("MaViPham"));
                vp.setNoiDungViPham(rs.getString("NoiDung"));
                vp.setThoiGianViPham(rs.getTimestamp("ThoiGianViPham"));
                vp.setHinhPhat(rs.getString("HinhPhat"));
                vp.setNguoiTao(rs.getString("NguoiTao"));
                danhSachViPham.add(vp);
            }

            provider.close();  // Đóng kết nối
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return danhSachViPham;
    }
    public int demSoLanViPham(String maSV) {
    int soLanViPham = 0;
    String query = "SELECT COUNT(*) AS SoLanViPham FROM SinhVienViPham WHERE MaSV = ?";
    try {
        provider.open();  // Mở kết nối
        Connection conn = provider.getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, maSV);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            soLanViPham = rs.getInt("SoLanViPham");
        }

        provider.close();  // Đóng kết nối
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return soLanViPham;
}
}
