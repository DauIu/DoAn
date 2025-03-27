
import DAO.HopDongDAO;
import POJO.DangNhap;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author My-PC
 */
public class TaoHopDongProcedure {
    public static void main(String[] args) {
        String maSV = "MaSV"; // Mã sinh viên
        String tenDN = "Admin1"; // Tên người tạo hợp đồng

        HopDongDAO hopDongDAO = new HopDongDAO();
        hopDongDAO.taoHopDong(maSV, tenDN);
    }
}
