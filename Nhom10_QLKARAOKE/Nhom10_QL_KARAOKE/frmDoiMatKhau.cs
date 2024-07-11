using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Common;

namespace Nhom10_QL_KARAOKE
{
    public partial class frmDoiMatKhau : Form
    {
        SqlConnection conn;
        SqlDataAdapter adapt;
        DataSet ds = new DataSet();
        

       
        public frmDoiMatKhau()
        {
            InitializeComponent();
            conn = new SqlConnection(ConnnentionString.Conn);

        }
        
    

        private void btnQL_Click_1(object sender, EventArgs e)
        {
            frmDangNhap dangnhap = new frmDangNhap();
            dangnhap.Show();
            this.Hide();
        }

        private void frmDoiMatKhau_Load(object sender, EventArgs e)
        {

        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtMKHT.Text))
            {
                MessageBox.Show("Vui lòng nhập mật khẩu hiện tại !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMKHT.Select();
                return;

            }
            if(string.IsNullOrEmpty(txtMKMoi.Text)|| string.IsNullOrEmpty(txtXNMK.Text)) 
            {
                MessageBox.Show("Vui lòng nhập mật khẩu mới !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMKMoi.Select();
                return;
            }
            if (!txtMKMoi.Text.Equals(txtXNMK.Text))
            {
                MessageBox.Show("Mật khẩu không khớp !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMKMoi.Select();
                return;
            }

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("UPDATE NHANVIEN SET MATKHAU=@MKMoi WHERE MANV=@MANV AND MATKHAU=@MKHT", conn);
                cmd.Parameters.AddWithValue("@MANV", txtMANV.Text);
                cmd.Parameters.AddWithValue("@MKHT", txtMKHT.Text);
                cmd.Parameters.AddWithValue("@MKMoi", txtMKMoi.Text);

                cmd.ExecuteNonQuery();

                MessageBox.Show("Đổi mật khẩu thành công !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Dispose();

                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
