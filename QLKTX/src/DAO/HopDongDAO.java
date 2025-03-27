/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import POJO.HopDong;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author My-PC
 */
public class HopDongDAO {
    private SQLServerProvider provider = new SQLServerProvider();

public List<HopDong> getAllHopDong() {
    List<HopDong> danhSachHopDong = new ArrayList<>();
    String query = "SELECT MaHopDong, MaSV, NguoiTao, NgayTao, NgayBatDau, NgayKetThuc, TrangThai, DaThanhToan FROM HopDong";

    try {
        provider.open(); 
        ResultSet rs = provider.executeQuery(query);

        while (rs.next()) {
            HopDong hopDong = new HopDong();
            hopDong.setMaHopDong(rs.getString("MaHopDong"));
            hopDong.setMaSV(rs.getString("MaSV"));
            hopDong.setNguoiTao(rs.getString("NguoiTao"));
            hopDong.setNgayTao(rs.getDate("NgayTao"));
            hopDong.setNgayBatDau(rs.getDate("NgayBatDau"));
            hopDong.setNgayKetThuc(rs.getDate("NgayKetThuc"));
            hopDong.setTrangThai(rs.getString("TrangThai"));
            hopDong.setDaThanhToan(rs.getBoolean("DaThanhToan"));
            danhSachHopDong.add(hopDong);
        }

        provider.close();  // Đóng kết nối
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return danhSachHopDong;
}
public boolean taoHopDong(String maSV, String tenDN) {
        boolean success = false;
        String sql = "{call TaoHopDong(?, ?)}";

        try (CallableStatement cstmt = provider.getConnection().prepareCall(sql)) {
            cstmt.setString(1, maSV);
            cstmt.setString(2, tenDN);
            int rowsAffected = cstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Tạo hợp đồng mới thành công!");
                success = true;
            } else {
                System.out.println("Không có hợp đồng nào được tạo!");
            }
        } catch (SQLException ex) {
            System.out.println("Lỗi khi tạo hợp đồng: " + ex.getMessage());
        }
        return success;
    }
 public boolean capNhatTrangThaiHopDong(String maHD, String trangThaiMoi) {
        boolean success = false;
        String sql = "UPDATE HopDong SET TrangThai = ? WHERE MaHopDong = ?";

        try (PreparedStatement pstmt = provider.getConnection().prepareStatement(sql)) {
            pstmt.setString(1, trangThaiMoi);
            pstmt.setString(2, maHD);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cập nhật trạng thái hợp đồng thành công!");
                success = true;
            } else {
                System.out.println("Không có hợp đồng nào được cập nhật trạng thái!");
            }
        } catch (SQLException ex) {
            System.out.println("Lỗi khi cập nhật trạng thái hợp đồng: " + ex.getMessage());
        }
        return success;
    }
    public boolean xoaHopDong(String maHD) {
        boolean xoaThanhCong = false;
        String sql = "{call XoaHopDong(?)}"; 

        try (CallableStatement cstmt = provider.getConnection().prepareCall(sql)) {
            cstmt.setString(1, maHD);
            int rowsAffected = cstmt.executeUpdate();
            if (rowsAffected > 0) {
                xoaThanhCong = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return xoaThanhCong;
    }
    
 
}
