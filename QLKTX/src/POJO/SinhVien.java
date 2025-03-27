/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package POJO;

import java.util.Date;

/**
 *
 * @author My-PC
 */
public class SinhVien {
  private String MaSV;
    private String Ho;
    private String Ten;
    private String Email;
    private String GioiTinh;
    private Date NgaySinh; 
    private String QueQuan;
    private String SoCanCuoc;
    private String SoDienThoai;
    private String Lop;
    private String MaPhong;
    private String TrangThai;
    private String MatKhau;

    public SinhVien() {
    }

    public SinhVien(String MaSV, String Ho, String Ten, String Email, String GioiTinh, Date NgaySinh, String QueQuan, String SoCanCuoc, String SoDienThoai, String Lop, String MaPhong, String TrangThai, String MatKhau) {
        this.MaSV = MaSV;
        this.Ho = Ho;
        this.Ten = Ten;
        this.Email = Email;
        this.GioiTinh = GioiTinh;
        this.NgaySinh = NgaySinh;
        this.QueQuan = QueQuan;
        this.SoCanCuoc = SoCanCuoc;
        this.SoDienThoai = SoDienThoai;
        this.Lop = Lop;
        this.MaPhong = MaPhong;
        this.TrangThai = TrangThai;
        this.MatKhau = MatKhau;
    }

    public String getMaSV() {
        return MaSV;
    }

    public void setMaSV(String MaSV) {
        this.MaSV = MaSV;
    }

    public String getHo() {
        return Ho;
    }

    public void setHo(String Ho) {
        this.Ho = Ho;
    }

    public String getTen() {
        return Ten;
    }

    public void setTen(String Ten) {
        this.Ten = Ten;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getGioiTinh() {
        return GioiTinh;
    }

    public void setGioiTinh(String GioiTinh) {
        this.GioiTinh = GioiTinh;
    }

    public Date getNgaySinh() {
        return NgaySinh;
    }

    public void setNgaySinh(Date NgaySinh) {
        this.NgaySinh = NgaySinh;
    }

    public String getQueQuan() {
        return QueQuan;
    }

    public void setQueQuan(String QueQuan) {
        this.QueQuan = QueQuan;
    }

    public String getSoCanCuoc() {
        return SoCanCuoc;
    }

    public void setSoCanCuoc(String SoCanCuoc) {
        this.SoCanCuoc = SoCanCuoc;
    }

    public String getSoDienThoai() {
        return SoDienThoai;
    }

    public void setSoDienThoai(String SoDienThoai) {
        this.SoDienThoai = SoDienThoai;
    }

    public String getLop() {
        return Lop;
    }

    public void setLop(String Lop) {
        this.Lop = Lop;
    }

    public String getMaPhong() {
        return MaPhong;
    }

    public void setMaPhong(String MaPhong) {
        this.MaPhong = MaPhong;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String TrangThai) {
        this.TrangThai = TrangThai;
    }

    public String getMatKhau() {
        return MatKhau;
    }

    public void setMatKhau(String MatKhau) {
        this.MatKhau = MatKhau;
    }
    
}
