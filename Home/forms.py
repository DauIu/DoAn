from django import forms
from .models import CustomUser
import re
from .models import DanhGia
from .models import Loai
from .models import SanPham
from django import forms
from .models import SanPhamHu
from django.contrib.auth import get_user_model
from .models import Voucher
from .models import NhaCungCap ,ThanhPho
from .models import PhieuNhap, CT_PhieuNhap
from .models import Kho, TonKho
from ckeditor.widgets import CKEditorWidget 
from .models import TinTuc, Quan, Phuong
from django import forms

User = get_user_model()

#-------đăng nhập đăng ký------
from django import forms
from .models import CustomUser
import re

class RegistrationForm(forms.Form):
    username = forms.CharField(label='Tên đăng nhập', max_length=100)
    email = forms.EmailField(label='Email')
    phone = forms.CharField(label='Số điện thoại', max_length=15)
    full_name = forms.CharField(label='Họ và tên', max_length=255)
    street = forms.CharField(label='Địa chỉ (Đường)', max_length=255)
    city = forms.ModelChoiceField(
        queryset=ThanhPho.objects.all(),
        empty_label="Chọn Thành phố",
        to_field_name='MaTP',  # Sử dụng MaTP làm giá trị
        label='Thành phố'
    )
    district = forms.ModelChoiceField(
        queryset=Quan.objects.none(),
        empty_label="Chọn Quận/Huyện",
        to_field_name='MaQuan',  # Sử dụng MaQuan làm giá trị
        label='Quận/Huyện'
    )
    ward = forms.ModelChoiceField(
        queryset=Phuong.objects.none(),
        empty_label="Chọn Phường/Xã",
        to_field_name='MaPhuong',  # Sử dụng MaPhuong làm giá trị
        label='Phường/Xã'
    )
    password1 = forms.CharField(label='Mật khẩu', widget=forms.PasswordInput())
    password2 = forms.CharField(label='Nhập lại mật khẩu', widget=forms.PasswordInput())

    def __init__(self, *args, **kwargs):
        city_id = kwargs.pop('city_id', None)
        district_id = kwargs.pop('district_id', None)
        super().__init__(*args, **kwargs)
        if city_id:
            self.fields['district'].queryset = Quan.objects.filter(thanh_pho_id=city_id)
        if district_id:
            self.fields['ward'].queryset = Phuong.objects.filter(quan_id=district_id)

    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Mật khẩu không khớp.")
        return password2

    def clean_username(self):
        username = self.cleaned_data['username']
        if not re.match(r'^\w+$', username):
            raise forms.ValidationError("Tên tài khoản chỉ chứa chữ cái, số và dấu gạch dưới.")
        if CustomUser.objects.filter(username=username).exists():
            raise forms.ValidationError("Tên tài khoản đã tồn tại.")
        return username

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if not re.match(r'^\d{10}$', phone):
            raise forms.ValidationError("Số điện thoại phải có đúng 10 chữ số.")
        return phone

    def save(self):
        user = CustomUser.objects.create_user(
            username=self.cleaned_data['username'],
            email=self.cleaned_data['email'],
            password=self.cleaned_data['password1'],
            phone=self.cleaned_data['phone'],
            full_name=self.cleaned_data['full_name'],
            street=self.cleaned_data['street'],
            city=self.cleaned_data['city'],
            district=self.cleaned_data['district'],
            ward=self.cleaned_data['ward'],
        )
        return user

class LoginForm(forms.Form):
    username = forms.CharField(label='Tài khoản')
    password = forms.CharField(label='Mật khẩu', widget=forms.PasswordInput())

#-------mã hoá mật khẩu-------
class PasswordResetForm(forms.Form):
    email = forms.EmailField(
        widget=forms.EmailInput(attrs={
            'class': 'form-control',
            'id': 'Email',
            'placeholder': 'Email'
        }),
        label='Email'
    )
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'id': 'Password',
            'placeholder': 'Nhập mật khẩu mới'
        }),
        label='Mật khẩu'
    )

##-------Quên mật khẩu#-------
class CustomPasswordResetForm(forms.Form):
    email = forms.EmailField(label="Email", max_length=254, required=True)

#------Giỏ hàng-------
class OrderForm(forms.Form):
    phone = forms.CharField(label='Số điện thoại', max_length=15)
    full_name = forms.CharField(label='Họ và tên', max_length=255)
    street = forms.CharField(label='Địa chỉ (Đường)', max_length=255)
    city = forms.ModelChoiceField(
        queryset=ThanhPho.objects.all(),
        empty_label="Chọn Thành phố",
        to_field_name='MaTP',  # Sử dụng MaTP làm giá trị
        label='Thành phố'
    )
    district = forms.ModelChoiceField(
        queryset=Quan.objects.none(),
        empty_label="Chọn Quận/Huyện",
        to_field_name='MaQuan',  # Sử dụng MaQuan làm giá trị
        label='Quận/Huyện'
    )
    ward = forms.ModelChoiceField(
        queryset=Phuong.objects.none(),
        empty_label="Chọn Phường/Xã",
        to_field_name='MaPhuong',  # Sử dụng MaPhuong làm giá trị
        label='Phường/Xã'
    )

    def __init__(self, *args, **kwargs):
        city_id = kwargs.pop('city_id', None)
        district_id = kwargs.pop('district_id', None)
        super().__init__(*args, **kwargs)
        if city_id:
            self.fields['district'].queryset = Quan.objects.filter(thanh_pho_id=city_id)
        if district_id:
            self.fields['ward'].queryset = Phuong.objects.filter(quan_id=district_id)

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if not re.match(r'^\d{10}$', phone):
            raise forms.ValidationError("Số điện thoại phải có đúng 10 chữ số.")
        return phone

    def save(self):
        # Implement saving logic here based on your specific use case
        order_data = {
            'phone': self.cleaned_data['phone'],
            'full_name': self.cleaned_data['full_name'],
            'street': self.cleaned_data['street'],
            'city': self.cleaned_data['city'],
            'district': self.cleaned_data['district'],
            'ward': self.cleaned_data['ward'],
        }
        # Save to the database or process as needed
        return order_data

#------Quản lý bên ADMIN------
class LoaiForm(forms.ModelForm):
    class Meta:
        model = Loai
        fields = ['TenLoai', 'IsDelete']
        widgets = {
            'TenLoai': forms.TextInput(attrs={'class': 'form-control'}),
            'IsDelete': forms.DateInput(attrs={'class': 'form-control'}),
        }

class SanPhamForm(forms.ModelForm):
    class Meta:
        model = SanPham
        fields = [
            'TenSP', 'TrongLuong', 'NguonGoc', 'DVT', 'SoLuongHienTai',
            'GiaBan','BaoQuan', 'HinhAnh', 'MucDoHu', 'MoTa', 'MaLoai'
        ]
        labels = {
            'TenSP': 'Tên sản phẩm',
            'TrongLuong': 'Trọng lượng', 
            'NguonGoc': 'Nguồn Gốc',
            'DVT': 'Đơn vị tính',
            'SoLuongHienTai': 'Số lượng sản phẩm',
            'GiaBan': 'Giá bán',
            'BaoQuan': 'Hướng dẫn bảo quản',
            'HinhAnh': 'Hình ảnh',
            'MucDoHu': 'Dễ hư',
            'MoTa': 'Mô tả',
            'MaLoai': 'Tên loại'
        }
        widgets = {
            'NgayNhap': forms.DateInput(attrs={'type': 'date'}),
        }

class SanPhamHuForm(forms.ModelForm):
    class Meta:
        model = SanPhamHu
        fields = ['SoLuong', 'NgayHu', 'LyDo', 'HinhAnh', 'MaSP']
        widgets = {
            'NgayHu': forms.DateInput(attrs={'type': 'date'}),
        }

class UserForm(forms.ModelForm):
    class Meta:
        model = CustomUser  # Chỉnh sửa cho đúng model CustomUser mà bạn đã tạo
        fields = ['username', 'email', 'phone', 'full_name', 'street', 'city', 'district', 'ward']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Tên đăng nhập'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Email'}),
            'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Số điện thoại'}),
            'full_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Họ tên đầy đủ'}),
            
        }

class VoucherForm(forms.ModelForm):
    class Meta:
        model = Voucher
        fields = ['MaVoucher', 'TenVoucher', 'MoTa', 'NgayBatDau', 'NgayKetThuc', 'PhanTramGiam', 'HanMucApDung', 'SoLuong']
        widgets = {
            'NgayBatDau': forms.DateInput(attrs={'type': 'date'}),
            'NgayKetThuc': forms.DateInput(attrs={'type': 'date'}),
        }
        
    def clean(self):
        cleaned_data = super().clean()
        ngay_bat_dau = cleaned_data.get('NgayBatDau')
        ngay_ket_thuc = cleaned_data.get('NgayKetThuc')

        if ngay_bat_dau and ngay_ket_thuc:
            if ngay_bat_dau > ngay_ket_thuc:
                raise forms.ValidationError("Ngày bắt đầu phải nhỏ hơn hoặc bằng ngày kết thúc.")
        
        return cleaned_data
    

class NhaCungCapForm(forms.ModelForm):
    class Meta:
        model = NhaCungCap
        fields = ['TenNCC', 'DiaChi', 'SoDienThoai', 'Email', 'Website'] 

class PhieuNhapForm(forms.ModelForm):
    class Meta:
        model = PhieuNhap
        fields = ['NhaCungCap', 'TongSoLuong', 'TongTienNhap', 'GhiChu', 'TrangThai'] 


class CT_PhieuNhapForm(forms.ModelForm):
    class Meta:
        model = CT_PhieuNhap
        fields = ['SanPham', 'SoLuongNhap', 'GiaNhap', 'NgaySanXuat', 'NgayHetHan']    

class KhoForm(forms.ModelForm):
    class Meta:
        model = Kho
        fields = ['TenKho', 'DiaChi']
        labels = {
            'TenKho': 'Tên Kho',
            'DiaChi': 'Địa Chỉ',
        }

class TonKhoForm(forms.ModelForm):
    class Meta:
        model = TonKho
        fields = ['SanPham', 'Kho', 'SoLuongTon', 'NgayHetHan']
        labels = {
            'SanPham': 'Sản Phẩm',
            'Kho': 'Kho',
            'SoLuongTon': 'Số Lượng Tồn',
            'NgayHetHan': 'Ngày Hết Hạn',
        }

class TinTucForm(forms.ModelForm):
    NoiDung = forms.CharField(widget=CKEditorWidget())  

    class Meta:
        model = TinTuc
        fields = ['TieuDe', 'NoiDung', 'AnhDaiDien','TacGia']
        widgets = {
            'TieuDe': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Tiêu đề tin tức...'}),
        }

class KhachHangForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ['username', 'email', 'phone', 'full_name', 'street', 'city', 'district', 'ward', 'is_active']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Tên đăng nhập'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Email'}),
            'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Số điện thoại'}),
            'full_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Họ và tên'}),
            'is_active': forms.CheckboxInput(attrs={'class': 'form-check-input'}),
        }

    def clean_username(self):
        username = self.cleaned_data.get('username')
        if User.objects.filter(username=username).exists() and self.instance.username != username:
            raise forms.ValidationError("Tên đăng nhập đã tồn tại!")
        return username

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists() and self.instance.email != email:
            raise forms.ValidationError("Email này đã được sử dụng!")
        return 
    

class DanhGiaForm(forms.ModelForm):
        class Meta:
            model = DanhGia
            fields = ['Rating', 'NoiDung', 'NgayViet', 'HinhAnh']
            labels = {
                'Rating': 'Mức độ hài lòng',
                'NoiDung': 'Nội dung', 
                'NgayViet': 'Ngày viết',
                'HinhAnh': 'Hình ảnh'
            }
            widgets = {
                'NoiDung': forms.Textarea(attrs={'class': 'form-control', 'id': 'noidung', 'placeholder': 'Nhập nội dung...', 'rows': 3}),
                'NgayViet': forms.DateInput(attrs={'class': 'form-control', 'id': 'ngayviet', 'type': 'date'}),
                'HinhAnh': forms.ClearableFileInput(attrs={'class': 'form-control', 'id': 'hinhanh'}),
            }