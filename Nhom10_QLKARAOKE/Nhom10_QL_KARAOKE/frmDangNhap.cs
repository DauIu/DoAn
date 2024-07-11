using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Nhom10_QL_KARAOKE
{
    public partial class frmDangNhap : Form
    {
        SqlConnection conn;
        public frmDangNhap()
        {
            InitializeComponent();
            conn = new SqlConnection(ConnnentionString.Conn);

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Bạn có chắc muốn thoát ứng dụng?", "Xác nhận đóng", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (dialogResult == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTK.Text) || string.IsNullOrEmpty(txtMK.Text))
            {
                MessageBox.Show("Vui lòng nhập tên tài khoản và mật khẩu.", "Chú ý", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTK.Focus();
                return;
            }

            string username = txtTK.Text;
            string password = txtMK.Text;
            string query = "SELECT COUNT(*) FROM NhanVien WHERE TaiKhoan = @Username AND MatKhau = @Password";

            try
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        MessageBox.Show("Đăng nhập thành công");
                        frmTrangChu trangchu = new frmTrangChu();
                        trangchu.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Tên tài khoản hoặc mật khẩu không đúng.", "Lỗi đăng nhập", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi đăng nhập", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                conn.Close();
            }
        }

        private void chkMK_CheckedChanged(object sender, EventArgs e)
        {
            if (chkMK.Checked)
            {
                txtMK.PasswordChar = '\0';
            }
            else
                txtMK.PasswordChar = '*';
        }

        private void labQuenMatKhau_Click(object sender, EventArgs e)
        {
            frmDoiMatKhau quenmatkhau = new frmDoiMatKhau();
            quenmatkhau.Show();
            this.Hide();
        }



    }
}
