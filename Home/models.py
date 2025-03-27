from pyexpat import model
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils import timezone
from django.core.exceptions import ValidationError
from ckeditor.fields import RichTextField
from django.db.models import Sum
from django.utils.timezone import now
from django.contrib.auth import get_user_model
from decimal import Decimal
# Models for product management

class DonViTinh(models.Model):
    MaDVT = models.AutoField(primary_key=True)
    dvt = models.CharField(max_length=255, unique=True)
    IsDelete = models.DateTimeField(null=True, blank=True)
    def __str__(self):
        return self.dvt

class Loai(models.Model):
    MaLoai = models.AutoField(primary_key=True)
    TenLoai = models.CharField(max_length=255)
    IsDelete = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.TenLoai

class SanPham(models.Model):
    MaSP = models.AutoField(primary_key=True)
    TenSP = models.CharField(max_length=255)
    TrongLuong = models.CharField(max_length=255)
    NguonGoc = models.CharField(max_length=255)
    DVT = models.ForeignKey(DonViTinh, on_delete=models.CASCADE, related_name='sanpham')
    SoLuongHienTai = models.IntegerField(default=0)
    GiaBan = models.DecimalField(max_digits=10, decimal_places=3)
    BaoQuan = models.TextField()
    HinhAnh = models.ImageField(upload_to='products/')
    TinhTrang = models.BooleanField(default=False)
    MoTa = models.TextField()
    MucDoHu = models.BooleanField(default=False)
    IsDelete = models.DateTimeField(null=True, blank=True)
    MaLoai = models.ForeignKey('Loai', on_delete=models.CASCADE)

    def __str__(self):
        return self.TenSP

    def cap_nhat_so_luong(self):
        sl_hien_tai = TonKho.objects.filter(SanPham=self).aggregate(
            tong_ton=Sum('SoLuongTon')
        )['tong_ton'] or 0

        print(f"Cập nhật {self.TenSP}: SoLuongHienTai = {sl_hien_tai}")
        self.SoLuongHienTai = sl_hien_tai
        self.save()
    
    def hien_thi_hsd(self):
        tonkho_list = TonKho.objects.filter(SanPham=self)
        hsd_info = []
        for tonkho in tonkho_list:
            if tonkho.SoLuongTon > 0:  # Chỉ hiển thị nếu có tồn kho
                hsd_info.append(f"{tonkho.SoLuongTon} {self.DVT} {tonkho.HSD}")
        return ", ".join(hsd_info)

class SanPhamHu(models.Model):
    MaSP_Hu = models.AutoField(primary_key=True)
    SoLuong = models.IntegerField()
    NgayHu = models.DateField(null=True, blank=True)
    LyDo = models.TextField()
    HinhAnh = models.ImageField(upload_to='static/damage/', null=True, blank=True)
    MaSP = models.ForeignKey('SanPham', on_delete=models.CASCADE)
    IsDelete = models.BooleanField(default=False)
    def __str__(self):
        try:
            return self.MaSP.TenSP
        except:
            return "Sản phẩm không tồn tại"
#-----------------------------------------------------------------------------------------hehe--
class NhaCungCap(models.Model):
    MaNCC = models.AutoField(primary_key=True)
    TenNCC = models.CharField(max_length=255)
    DiaChi = models.CharField(max_length=255)
    SoDienThoai = models.CharField(max_length=20)
    Email = models.EmailField(null=True, blank=True)
    Website = models.URLField(null=True, blank=True)
    IsDelete = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.TenNCC

class PhieuNhap(models.Model):
    MaPhieuNhap = models.CharField(max_length=20, primary_key=True)
    NgayNhap = models.DateField(auto_now_add=True)
    NhaCungCap = models.ForeignKey(NhaCungCap, on_delete=models.CASCADE)
    TongSoLuong = models.IntegerField(default=0)
    TongTienNhap = models.DecimalField(max_digits=12, decimal_places=3, default=0)
    TrangThai = models.CharField(max_length=20, choices=[('pending', 'Chờ xử lý'),('completed', 'Hoàn thành'),('cancelled', 'Đã hủy'),], default='pending')
    GhiChu = models.TextField(null=True, blank=True)
    IsDelete = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"Phiếu Nhập {self.MaPhieuNhap} - {self.NhaCungCap.TenNCC}"
    
    def cap_nhat_tong_so_luong_va_tong_tien(self):
        tong_so_luong = sum(ct.SoLuongNhap for ct in self.ct_phieunhap.all())
        tong_tien_nhap = sum(ct.ThanhTien for ct in self.ct_phieunhap.all())
        self.TongSoLuong = tong_so_luong
        self.TongTienNhap = tong_tien_nhap
        self.save()

    def save(self, *args, **kwargs):
        if not self.MaPhieuNhap:
            last_phieu = PhieuNhap.objects.all().order_by('MaPhieuNhap').last()
            if last_phieu:
                last_id = int(last_phieu.MaPhieuNhap[2:])
                new_id = f"PN{last_id + 1:03d}"
            else:
                new_id = "PN001"
            self.MaPhieuNhap = new_id
        super().save(*args, **kwargs)

class CT_PhieuNhap(models.Model):
    MaCTPN = models.AutoField(primary_key=True)
    PhieuNhap = models.ForeignKey(PhieuNhap, on_delete=models.CASCADE, related_name='ct_phieunhap')
    SanPham = models.ForeignKey(SanPham, on_delete=models.CASCADE, related_name='ct_phieunhap')
    SoLuongNhap = models.IntegerField()
    GiaNhap = models.DecimalField(max_digits=10, decimal_places=3)
    NgaySanXuat = models.DateField(null=True, blank=True)
    NgayHetHan = models.DateField(null=True, blank=True)    
    ThanhTien = models.DecimalField(max_digits=12, decimal_places=3)

    def __str__(self):
        return f"Chi tiết PN {self.PhieuNhap.MaPhieuNhap} - SP {self.SanPham.TenSP}"

    def save(self, *args, **kwargs):
        self.ThanhTien = self.SoLuongNhap * self.GiaNhap
        super().save(*args, **kwargs)

class Kho(models.Model):
    MaKho = models.AutoField(primary_key=True)
    TenKho = models.CharField(max_length=100)
    DiaChi = models.CharField(max_length=255) 

    def __str__(self):
        return self.TenKho

class TonKho(models.Model):
    SanPham = models.ForeignKey(SanPham, on_delete=models.CASCADE)
    Kho = models.ForeignKey(Kho, on_delete=models.CASCADE, related_name='tonkho_set')
    SoLuongTon = models.IntegerField()
    NgayHetHan = models.DateField(null=True, blank=True)
    NgayNhapKho = models.DateField(auto_now_add=True) 
    IsDelete = models.BooleanField(default=False)
#-------------------------------------------------------------------------------Thong tin tài khoản--
class ThanhPho(models.Model):
    MaTP = models.AutoField(primary_key=True)
    TenTP = models.CharField(max_length=255, unique=True)
    def __str__(self):
        return self.TenTP

class Quan(models.Model):
    MaQuan = models.AutoField(primary_key=True)
    TenQuan = models.CharField(max_length=255)
    thanh_pho = models.ForeignKey(ThanhPho, on_delete=models.CASCADE, related_name='quan')

    def __str__(self):
        return f"{self.TenQuan}, {self.thanh_pho.TenTP}"

class Phuong(models.Model):
    MaPhuong = models.AutoField(primary_key=True)
    TenPhuong = models.CharField(max_length=255)
    quan = models.ForeignKey(Quan, on_delete=models.CASCADE, related_name='phuong')

    def __str__(self):
        return f"{self.TenPhuong}, {self.quan.TenQuan}, {self.quan.thanh_pho.TenTP}"

# Custom user manager
class CustomUserManager(BaseUserManager):
    def create_user(self, email, username, phone, full_name, street, ward, district, city, password=None):
        if not email:
            raise ValueError("Email is required!")
        user = self.model(
            email=self.normalize_email(email),
            username=username,
            phone=phone,
            full_name=full_name,
            street=street,
            ward=ward,
            district=district,
            city=city,
            is_user=True
        )
        user.set_password(password)
        user.save(using=self._db)

        # Tạo đơn hàng mặc định cho người dùng
        DonHang.objects.create(user=user, TrangThai='don_moi')
        return user

    def create_staff(self, email, username, phone, full_name, street, ward, district, city, password=None):
        if not email:
            raise ValueError("Email is required!")
        user = self.model(
            email=self.normalize_email(email),
            username=username,
            phone=phone,
            full_name=full_name,
            street=street,
            ward=ward,
            district=district,
            city=city,
            is_staff=True
        )
        user.is_user = False
        user.set_password(password)
        user.save(using=self._db)

        return user

    def create_manager(self, email, username, phone, full_name, street, ward, district, city, password=None):
        user = self.create_user(
            email=email,
            username=username,
            phone=phone,
            full_name=full_name,
            street=street,
            ward=ward,
            district=district,
            city=city,
            is_manage = True
        )
        user.set_password(password)
        user.is_staff = True
        user.is_user = False
        user.save(using=self._db)
        return user

    def create_superuser(self, email, username, phone, full_name, street, ward, district, city, password=None):
        user = self.create_user(
            email=email,
            username=username,
            phone=phone,
            full_name=full_name,
            street=street,
            ward=ward,
            district=district,
            city=city,
            password=password
        )
        user.is_admin = True
        user.is_manager = True
        user.is_staff = True
        user.is_user = False
        user.save(using=self._db)
        return user

class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=100, unique=True)
    phone = models.CharField(max_length=15)
    full_name = models.CharField(max_length=255)
    ngaydangnhap = models.DateField(null=True, blank=True)

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_manager = models.BooleanField(default=False)    
    is_staff = models.BooleanField(default=False)
    is_user = models.BooleanField(default=True)

    # ---- Địa chỉ
    street = models.CharField(max_length=255)
    city = models.ForeignKey(ThanhPho, on_delete=models.SET_NULL, null=True, related_name="users")
    district = models.ForeignKey(Quan, on_delete=models.SET_NULL, null=True, related_name="users")
    ward = models.ForeignKey(Phuong, on_delete=models.SET_NULL, null=True, related_name="users")
    # --------
    objects = CustomUserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email', 'phone', 'full_name', 'street', 'ward', 'district', 'city']

    def __str__(self):
        return self.username


# Order and order item models
class DonHang(models.Model):
    MaDH = models.AutoField(primary_key=True)
    TongTien = models.DecimalField(max_digits=10, decimal_places=3, default=0)
    SoLuong = models.IntegerField(default=0)
    user_name = models.CharField(max_length=255, blank=True, default="")
    user_address = models.CharField(max_length=255, blank=True, default="")
    user_phone = models.CharField(max_length=15, blank=True, default="")
    user = models.ForeignKey('CustomUser', on_delete=models.CASCADE)
    voucher = models.ForeignKey('Voucher', null=True, blank=True, on_delete=models.SET_NULL)
    MucGiamGia = models.DecimalField(max_digits=10, decimal_places=3, default=0, blank=True, null=True)  
    
    TRANG_THAI_CHOICES = [
        ('don_moi', 'Đơn mới'),
        ('cho_xac_nhan', 'Chờ xác nhận'),
        ('dang_xu_ly', 'Đang xử lý'),
        ('dang_giao', 'Đang giao'),
        ('da_hoan_thanh', 'Đã hoàn thành'),
    ]
    TrangThai = models.CharField(
        max_length=20,
        choices=TRANG_THAI_CHOICES,
        default='don_moi',
    )

    NgayDat = models.DateField(null=True, blank=True)
    NgayDuKien = models.DateField(null=True, blank=True)
    NgayNhan = models.DateField(null=True, blank=True)

    def __str__(self):
        return f"Giỏ hàng {self.MaDH}"

    def apply_voucher(self, voucher_code):
        try:
            voucher = Voucher.objects.get(MaVoucher=voucher_code)
            today = timezone.now().date()

            if not (voucher.NgayBatDau <= today <= voucher.NgayKetThuc):
                raise ValidationError("Voucher không còn hiệu lực.")
            if voucher.SoLuong <= 0:
                raise ValidationError("Voucher đã hết lượt sử dụng.")
            if self.TongTien < voucher.HanMucApDung:
                raise ValidationError("Tổng tiền chưa đạt mức áp dụng voucher.")
            
            self.voucher = voucher
            self.MucGiamGia = Decimal(self.TongTien) * (Decimal(voucher.PhanTramGiam) / Decimal(100))
            self.TongTien -= self.MucGiamGia 
            self.save()

            self.update_cart()
             # Giảm số lượng voucher sau khi sử dụng
            voucher.SoLuong -= 1
            voucher.save()
            return f"Áp dụng voucher thành công! Bạn được giảm {self.MucGiamGia:.3f}."

        except Voucher.DoesNotExist:
            return "Mã voucher không tồn tại."
        except ValidationError as e:
            return str(e)

    def update_cart(self):
        tong_tien = sum(item.ThanhTien for item in self.ct_donhang.all())
        so_luong = sum(item.SoLuong for item in self.ct_donhang.all())
        
        if self.voucher:
            self.MucGiamGia = tong_tien * (Decimal(self.voucher.PhanTramGiam) / Decimal(100))
            tong_tien -= self.MucGiamGia
        else:
            self.MucGiamGia = Decimal(0)

        self.TongTien = tong_tien
        self.SoLuong = so_luong
        self.save()

class CT_DonHang(models.Model):
    MaCTDH = models.AutoField(primary_key=True)
    SoLuong = models.IntegerField(default=0)
    ThanhTien = models.DecimalField(max_digits=10, decimal_places=3, default=0)
    MaSP = models.ForeignKey('SanPham', on_delete=models.CASCADE)
    gio_hang = models.ForeignKey(DonHang, on_delete=models.CASCADE, related_name='ct_donhang')

    def __str__(self):
        return f"Item in cart {self.MaCTDH}"

    def save(self, *args, **kwargs):
        self.ThanhTien = self.SoLuong * self.MaSP.GiaBan
        super().save(*args, **kwargs)
        self.gio_hang.update_cart()

class Voucher(models.Model):
    MaVoucher = models.CharField(max_length=20, primary_key=True)
    TenVoucher = models.CharField(max_length=255)
    MoTa = models.TextField()
    NgayBatDau = models.DateField()
    NgayKetThuc = models.DateField()
    PhanTramGiam = models.PositiveIntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])
    HanMucApDung = models.PositiveIntegerField(default=0)
    SoLuong = models.IntegerField(default=1)

    def __str__(self):
        return f"{self.TenVoucher} ({self.PhanTramGiam}%)"

# Other models
class DanhGia(models.Model):
    MaDG = models.AutoField(primary_key=True)
    MaDH = models.ForeignKey(DonHang, on_delete=models.CASCADE, related_name='don_danh_gia')
    Rating = models.IntegerField()
    NoiDung = models.TextField()
    NgayViet = models.DateField()
    HinhAnh = models.ImageField(upload_to='reviews/', null=True, blank=True)

    def __str__(self):
        return f"{self.MaDG} - {self.Rating} Stars"

class TinTuc(models.Model):
    MaTin = models.AutoField(primary_key=True)
    TieuDe = models.CharField(max_length=255)
    NoiDung = RichTextField()  # hoặc TextField, tùy theo phương pháp bạn chọn
    AnhDaiDien = models.ImageField(upload_to='news/thumbnails/', null=True, blank=True)
    Video = models.URLField(null=True, blank=True)
    NgayDang = models.DateField(auto_now_add=True)
    TacGia = models.ForeignKey(
        get_user_model(), 
        on_delete=models.CASCADE,  # Nếu admin bị xóa, bài viết cũng sẽ bị xóa
        null=True, 
        blank=True
    )
    
    def save(self, *args, **kwargs):
        # Nếu TacGia chưa được chỉ định, mặc định gán admin duy nhất
        if not self.TacGia:
            User = get_user_model()
            admin_user = User.objects.filter(is_superuser=True).first()
            if admin_user:
                self.TacGia = admin_user  # Gán tài khoản admin làm tác giả
        super().save(*args, **kwargs)
    
    def __str__(self):
        return self.TieuDe



