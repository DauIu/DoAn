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
public class ViPham {
    private String maSV;
    private String maViPham;
    private String noiDungViPham;
    private Date thoiGianViPham;
    private String hinhPhat;
    private String nguoiTao;
    private String ghiChu;
    private boolean daGiaiQuyet; 

    public ViPham() {
    }

    public ViPham(String maSV, String maViPham, String noiDungViPham, Date thoiGianViPham, String hinhPhat, String nguoiTao, String ghiChu, boolean daGiaiQuyet) {
        this.maSV = maSV;
        this.maViPham = maViPham;
        this.noiDungViPham = noiDungViPham;
        this.thoiGianViPham = thoiGianViPham;
        this.hinhPhat = hinhPhat;
        this.nguoiTao = nguoiTao;
        this.ghiChu = ghiChu;
        this.daGiaiQuyet = daGiaiQuyet;
    }

    public String getMaSV() {
        return maSV;
    }

    public void setMaSV(String maSV) {
        this.maSV = maSV;
    }

    public String getMaViPham() {
        return maViPham;
    }

    public void setMaViPham(String maViPham) {
        this.maViPham = maViPham;
    }

    public String getNoiDungViPham() {
        return noiDungViPham;
    }

    public void setNoiDungViPham(String noiDungViPham) {
        this.noiDungViPham = noiDungViPham;
    }

    public Date getThoiGianViPham() {
        return thoiGianViPham;
    }

    public void setThoiGianViPham(Date thoiGianViPham) {
        this.thoiGianViPham = thoiGianViPham;
    }

    public String getHinhPhat() {
        return hinhPhat;
    }

    public void setHinhPhat(String hinhPhat) {
        this.hinhPhat = hinhPhat;
    }

    public String getNguoiTao() {
        return nguoiTao;
    }

    public void setNguoiTao(String nguoiTao) {
        this.nguoiTao = nguoiTao;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public boolean isDaGiaiQuyet() {
        return daGiaiQuyet;
    }

    public void setDaGiaiQuyet(boolean daGiaiQuyet) {
        this.daGiaiQuyet = daGiaiQuyet;
    }
    
}
