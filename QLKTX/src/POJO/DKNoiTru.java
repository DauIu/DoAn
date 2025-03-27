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
public class DKNoiTru {
    private String MaSV;
    private String MaPhong;
    private String TrangThai;
    private Date Ngaygui;
    private String GhiChu;

    public DKNoiTru() {
    }

    public DKNoiTru(String MaSV, String MaPhong, String TrangThai, Date Ngaygui, String GhiChu) {
        this.MaSV = MaSV;
        this.MaPhong = MaPhong;
        this.TrangThai = TrangThai;
        this.Ngaygui = Ngaygui;
        this.GhiChu = GhiChu;
    }

    public String getMaSV() {
        return MaSV;
    }

    public void setMaSV(String MaSV) {
        this.MaSV = MaSV;
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

    public Date getNgaygui() {
        return Ngaygui;
    }

    public void setNgaygui(Date Ngaygui) {
        this.Ngaygui = Ngaygui;
    }

    public String getGhiChu() {
        return GhiChu;
    }

    public void setGhiChu(String GhiChu) {
        this.GhiChu = GhiChu;
    }
    
}
