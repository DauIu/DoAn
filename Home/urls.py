from django.urls import include, path
from . import views
from django.contrib.auth import views as auth_views
from .views import confirm_order, GetPhuong, GetQuan
# from .models import Post
from django.views.generic import ListView
from django.conf import settings
from django.conf.urls.static import static
app_name =  'UserMember'

urlpatterns = [
    #Đăng nhập - Đăng ký
    path('DangNhap/', views.UserLogin.as_view(), name='DangNhap'),
    path('DangKy/', views.register.as_view(), name='DangKy'),
    path('DangXuat/', views.UserLogout, name='DangXuat'),
    path('password-reset/', views.password_reset, name='custom_password_reset'),
    path('recover/', views.recover, name='Recover'),
    path('reset/<uidb64>/<token>/', views.password_reset_confirm, name='password_reset_confirm'),
    #--------------------------------------------------------------------------------    
    #search
    path('search/', views.search_products, name='search_products'),
    # User routes
    path('', views.home, name='home'),
    path('GioiThieu/', views.GioiThieu, name='GioiThieu'),
    path('LienHe/', views.LienHe, name='LienHe'),
    path('TinTuc/', views.TinTuc, name='TinTuc'),
    path('Voucher/', views.Vouchers, name='Vouchers'),

    #vỊ TRÍ
    path('get_quan_by_thanh_pho/<int:city_id>/', GetQuan.as_view(), name='get_quan_by_thanh_pho'),
    path('get_phuong_by_quan/<int:district_id>/', GetPhuong.as_view(), name='get_phuong_by_quan'),

    # Sản phẩm
    path('DSSanPham/', views.DSSanPham, name='DSSanPham'),
    path('DSSanPham/Detail/<int:product_id>/', views.chiTietSP, name='chiTietSP'),

    #----- Giỏ hàng
    path('cart/', views.listGioHang, name='GioHang'), 
    path('cart/add/', views.add_to_cart, name='add_to_cart'),
    path('cart/xoa/<int:ctdh_id>/', views.xoa_ctdh, name='xoa_ctdh'),
    path('cart/update/<int:ctdh_id>/', views.update_quantity, name='update_quantity'),
    path('apply-voucher/', views.apply_voucher, name='apply_voucher'),
    path('xac-nhan-don-hang/', confirm_order, name='confirm_order'),

    #-----Lịch sử mua hàng
    path('LSMuaHang/', views.LSMuaHang, name='LSMuaHang'),
    path('update-order/', views.update_order, name='update_order'),
    path('api/get_ct_donhang/<int:MaDH>/', views.get_ct_donhang, name='get_ct_donhang'),
    #--------------------------------------------------------------------------------    
    # Admin routes
    path('QLHome/', views.qlHome, name='qlHome'),
    path('QLSanPham/', views.QLSanPham, name='QLSanPham'),
    path('QLLoai/', views.QLLoai, name='QLLoai'),
    path('QLDonHang/', views.QLDonHang, name='QLDonHang'),
    #path('QLDanhGia/', views.QLDanhGia, name='QLDanhGia'),
    path('QLTinTuc/', views.QLTinTuc, name='QLTinTuc'),
    path('QLVoucher/', views.QLVoucher, name='QLVoucher'),

    #-------QLDonHang
    path('cap-nhat-trang-thai/', views.update_order_status, name='update_order_status'),

    #-------QLLoai
    path('QLLoai/', views.QLLoai, name='QLLoai'),
    path('QLLoai/them/', views.them_loai, name='them_loai'),
    path('QLLoai/sua/<int:loai_id>/', views.sua_loai, name='sua_loai'),
    path('QLLoai/xoa/<int:loai_id>/', views.xoa_loai, name='xoa_loai'),

    #-------QLSanPham
    path('QLSanPham/', views.QLSanPham, name='QLSanPham'),
    path('them-san-pham/', views.them_san_pham, name='them_san_pham'),
    path('sua-san-pham/<int:sanpham_id>/', views.sua_san_pham, name='sua_san_pham'),
    path('xoa-san-pham/<int:sanpham_id>/', views.xoa_san_pham, name='xoa_san_pham'),
    path('api/get-san-pham/<int:MaSP>/', views.get_san_pham, name='get_san_pham'),
    #----SanPhamHu---
    path('QLSanPhamHu/', views.QLSanPhamHu, name='QLSanPhamHu'),
    path('them-sanpham-hu/', views.them_sanpham_hu, name='them_sanpham_hu'),
    path('sua-sanpham-hu/<int:ma_sp_hu>/', views.sua_sanpham_hu, name='sua_sanpham_hu'),
    path('xoa-sanpham-hu/<int:ma_sp_hu>/', views.xoa_sanpham_hu, name='xoa_sanpham_hu'),
    path('san-pham-hu/xuat-excel/', views.xuat_excel_san_pham_hu, name='xuat_excel_san_pham_hu'),
    #-----QLTaiKHoan khachhang -------------
    path('QLTaiKhoanKhachHang/', views.QLTaiKhoanKhachHang, name='QLTaiKhoanKhachHang'),
    path('api/taikhoan/<int:user_id>/detail/', views.get_user_details, name='get_user_details'),
    path('sua-taikhoan-khachhang/<int:user_id>/', views.sua_taikhoan_khachhang, name='sua_taikhoan_khachhang'),
    path('khachhang/vh/<int:user_id>/', views.deactivate_user, name='deactivate_user'),
    path('toggle_user_status/<int:user_id>/', views.toggle_user_status, name='toggle_user_status'),
    # path('xoa-taikhoan-khachhang/<int:user_id>/', views.xoa_taikhoan_khachhang, name='xoa_taikhoan_khachhang'),
    #----QLKhachHang---------
    path('QLKhachHang/', views.QLKhachHang, name='QLKhachHang'),
    path('khachhang/<int:user_id>/', views.get_user_details, name='get_user_details'),  
    path('khachhang/sua/<int:user_id>/', views.sua_khachhang, name='sua_khachhang'), 
    path('khachhang/<int:user_id>/donhang/', views.danhsachdonhang_khachhang, name='danhsachdonhang_khachhang'),
    path('donhang/<int:order_id>/', views.xem_chitiet_donhang, name='xem_chitiet_donhang'),
    # path('khachhang/xoa/<int:user_id>/', views.xoa_khachhang, name='xoa_khachhang'),  
    #------QLVoucher--------------
    path('QLVoucher/', views.QLVoucher, name='QLVoucher'),
    path('them-voucher/', views.them_voucher, name='them_voucher'),
    path('sua-voucher/<str:MaVoucher>/', views.sua_voucher, name='sua_voucher'),
    path('xoa-voucher/<str:MaVoucher>/', views.xoa_voucher, name='xoa_voucher'),
    #------------------------------------------------hehe
    path('QLNCC/', views.QLncc, name='QLNCC'),  
    path('QLNCC/them/', views.them_ncc, name='them_ncc'), 
    path('QLNCC/sua/<int:MaNCC>/', views.sua_ncc, name='sua_ncc'),
    path('QLNCC/xoa/<int:MaNCC>/', views.xoa_ncc, name='xoa_ncc'),
    #PhieuNhap
    path('QLPhieuNhap/', views.QLPhieunhap, name='QLPhieuNhap'), 
    path('them/', views.them_phieu_nhap, name='them_phieu_nhap'),  
    path('sua/<str:MaPhieuNhap>/', views.sua_phieu_nhap, name='sua_phieu_nhap'), 
    path('update_status/', views.update_status, name='update_status'),
    path('xoa/<str:MaPhieuNhap>/', views.xoa_phieu_nhap, name='xoa_phieu_nhap'),
    path('XemChiTietPhieuNhap/<str:MaPhieuNhap>/', views.XemChiTietPhieuNhap, name='XemChiTietPhieuNhap'), 
    path('them_chi_tiet_phieu_nhap<str:MaPhieuNhap>/', views.them_chi_tiet_phieu_nhap, name='them_chi_tiet_phieu_nhap'),
    path('sua_chi_tiet_phieu_nhap/<str:MaPhieuNhap>/<int:MaCTPN>/', views.sua_chi_tiet_phieu_nhap, name='sua_chi_tiet_phieu_nhap'),
    path('xoa_chi_tiet_phieu_nhap/<str:MaPhieuNhap>/<int:MaCTPN>/', views.xoa_chi_tiet_phieu_nhap, name='xoa_chi_tiet_phieu_nhap'),
    path('get_san_pham_by_loai/<int:loai_id>/', views.get_san_pham_by_loai, name='get_san_pham_by_loai'),
    path('phieunhap/<str:MaPhieuNhap>/in/', views.in_phieu_nhap, name='in_phieu_nhap'),

    #tài khoản nhân viên
    path('QLTaiKhoanNhanVien/', views.QLTaiKhoanNhanVien, name='QLTaiKhoanNhanVien'),
    path('them-nhan-vien/', views.them_nhanvien, name='them_nhanvien'),
    path('sua-nhan-vien/<int:user_id>/', views.sua_nhanvien, name='sua_nhanvien'),
    path('xoa-nhan-vien/<int:user_id>/', views.xoa_nhanvien, name='xoa_nhanvien'),
    path('check-unique/', views.check_unique_field, name='check_unique'),
    path('cap-quyen-nhanvien/<int:user_id>/', views.cap_quyen_nhanvien, name='cap_quyen_nhanvien'),

    #kho
    path('QLKho/', views.QLKho, name='QLKho'), 
    path('them-kho/', views.them_kho, name='them_kho'), 
    path('sua-kho/', views.sua_kho, name='sua_kho'),
    path('xoa-kho/<int:kho_id>/', views.xoa_kho, name='xoa_kho'),
    path('chi-tiet-ton-kho/<int:kho_id>/', views.chi_tiet_ton_kho, name='chi_tiet_ton_kho'),  
    path('them-ton-kho/', views.them_ton_kho, name='them_ton_kho'),
    path('xuat_excel_tonkho/', views.xuat_excel_tonkho, name='xuat_excel_tonkho'),
    #-----tin tức
    path('QLTinTuc/', views.QLTinTuc, name='QLTinTuc'),
    path('tin-tuc/them/', views.them_tin_tuc, name='them_tin_tuc'),
    path('tin-tuc/sua/<int:MaTin>/', views.sua_tin_tuc, name='sua_tin_tuc'),
    path('tin-tuc/xoa/<int:MaTin>/', views.xoa_tin_tuc, name='xoa_tin_tuc'),
    path('tin-tuc/xem/<int:MaTin>/', views.xem_tin_tuc, name='xem_tin_tuc'),
    path('ckeditor/', include('ckeditor_uploader.urls')), 
    path('upload/', views.upload_image, name='upload_image'),
    #----------------------danhgia
    path('DanhGias/<int:MaDH>/', views.DanhGias, name='DanhGias'),
    path('QLDanhGia/', views.QLDanhGia, name='QLDanhGia'),

    #----thông ke
    path('ThongKe/', views.thong_ke, name='ThongKe'),
    path('api/thong-ke-bieu-do/', views.thong_ke_bieu_do, name='thong_ke_bieu_do'), 
    path('api/thong-ke-voucher-bieu-do/', views.thong_ke_voucher_bieu_do, name='thong_ke_voucher_bieu_do'),
    path('api/thong-ke-san-pham-bieu-do/', views.thong_ke_san_pham_bieu_do, name='thong_ke_san_pham_bieu_do'),

]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)