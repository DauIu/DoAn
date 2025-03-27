package DAO;

import POJO.DKNoiTru;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DangKiDAO {
    private SQLServerProvider provider = new SQLServerProvider();

    public List<DKNoiTru> getAllDangKyNoiTru() {
        List<DKNoiTru> danhSachDK = new ArrayList<>();
        String query = "SELECT MaSV, MaPhong, TrangThai, Ngaygui, GhiChu FROM DangKyNoiTru";

        try {
            provider.open();  // Mở kết nối
            ResultSet rs = provider.executeQuery(query);

            while (rs.next()) {
                DKNoiTru dk = new DKNoiTru();
                dk.setMaSV(rs.getString("MaSV"));
                dk.setMaPhong(rs.getString("MaPhong"));
                dk.setTrangThai(rs.getString("TrangThai"));
                dk.setNgaygui(rs.getDate("Ngaygui"));
                dk.setGhiChu(rs.getString("GhiChu"));
                danhSachDK.add(dk);
            }

            provider.close();  // Đóng kết nối
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return danhSachDK;
    }

    public void addDangKyNoiTru(DKNoiTru dkNoiTru) {
        Connection conn = null;
        try {
            conn = provider.getConnection();  // Lấy kết nối từ provider
            String query = "INSERT INTO DangKyNoiTru (MaSV, MaPhong, TrangThai, Ngaygui, GhiChu) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dkNoiTru.getMaSV());
            pstmt.setString(2, dkNoiTru.getMaPhong());
            pstmt.setString(3, dkNoiTru.getTrangThai());
            pstmt.setDate(4, new java.sql.Date(dkNoiTru.getNgaygui().getTime()));
            pstmt.setString(5, dkNoiTru.getGhiChu());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close(); // Đóng kết nối
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteDangKyNoiTru(String maSV) {
        Connection conn = null;
        try {
            conn = provider.getConnection();  // Lấy kết nối từ provider
            String query = "DELETE FROM DangKyNoiTru WHERE MaSV=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, maSV);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close(); // Đóng kết nối
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void updateDangKyNoiTru(String maSV, DKNoiTru dkNoiTru) {
        Connection conn = null;
        try {
            conn = provider.getConnection();  // Lấy kết nối từ provider
            String query = "UPDATE DangKyNoiTru SET MaPhong=?, TrangThai=?, Ngaygui=?, GhiChu=? WHERE MaSV=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dkNoiTru.getMaPhong());
            pstmt.setString(2, dkNoiTru.getTrangThai());
            pstmt.setDate(3, new java.sql.Date(dkNoiTru.getNgaygui().getTime()));
            pstmt.setString(4, dkNoiTru.getGhiChu());
            pstmt.setString(5, maSV);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close(); // Đóng kết nối
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public boolean capNhatTrangThai(String maSV, String trangThaiMoi) {
        String sql = "UPDATE DangKyNoiTru SET TrangThai = ? WHERE MaSV = ?";
        try (Connection conn = provider.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, trangThaiMoi);
            pstmt.setString(2, maSV);

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            System.out.println("Lỗi khi cập nhật trạng thái: " + ex.getMessage());
            return false;
        }
    }
}
