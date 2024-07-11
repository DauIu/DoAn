using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Nhom10_QL_KARAOKE
{
    public partial class frmTrangChu : Form
    {
        SqlConnection conn;
        SqlDataAdapter adapt;
        DataSet ds = new DataSet();
        public frmTrangChu()
        {
            InitializeComponent();
            conn = new SqlConnection(ConnnentionString.Conn);
        }

       

        private void btnNhanVien_Click(object sender, EventArgs e)
        {
           frmNhanVien nhanvien = new frmNhanVien();
            nhanvien.Show();
                this.Hide();
        }

        private void labQL_Click(object sender, EventArgs e)
        {
           frmDangNhap dangNhap = new frmDangNhap();
            dangNhap.Show();
             this.Hide();   

        }

        private void btnKhachHang_Click(object sender, EventArgs e)
        {
            frmKhachHang khachHang = new frmKhachHang();
            khachHang.Show();   
            this.Hide();
        }

        private void btnPhong_Click(object sender, EventArgs e)
        {
            frmPhong phong = new frmPhong();    
            phong.Show();
            this.Hide();
        }

        private void btnDatPhong_Click(object sender, EventArgs e)
        {
            frmDatPhong datPhong = new frmDatPhong();   
            datPhong.Show();
            this.Hide();
        }
    }
}
