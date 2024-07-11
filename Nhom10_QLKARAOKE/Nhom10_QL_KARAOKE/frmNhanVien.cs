using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Nhom10_QL_KARAOKE
{
    public partial class frmNhanVien : Form
    {
        SqlConnection conn;
        SqlDataAdapter adapt;
        DataTable dataTable;
        int selectedEmployeeId;

        public frmNhanVien()
        {
            InitializeComponent();
            conn = new SqlConnection(ConnnentionString.Conn);
            adapt = new SqlDataAdapter("SELECT * FROM NhanVien", conn);
            dataTable = new DataTable();
            adapt.Fill(dataTable);
            dgvNhanVien.DataSource = dataTable;
        }

        private void LoadEmployeeData()
        {
            dataTable.Clear();
            adapt.Fill(dataTable);
        }
        private void dgvNhanVien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvNhanVien.Rows[e.RowIndex];
                selectedEmployeeId = Convert.ToInt32(row.Cells["MaNhanVien"].Value);
                txtTenNV.Text = row.Cells["TenNhanVien"].Value.ToString();
                txtCV.Text = row.Cells["SoDienThoai"].Value.ToString();
                txtEM.Text = row.Cells["Mail"].Value.ToString();
                txtDC.Text = row.Cells["DiaChi"].Value.ToString();
                txtSDT.Text = row.Cells["ChucVu"].Value.ToString();
                if (row.Cells["GioiTinh"].Value.ToString() == "Nam")
                {
                    rabNam.Checked = true;
                    rabNu.Checked = false;
                }
                else
                {
                    rabNam.Checked = false;
                    rabNu.Checked = true;
                }
            }
        }
        private bool IsEmployeeExists(string employeeId)
        {
            string query = "SELECT COUNT(*) FROM NhanVien WHERE MaNhanVien = @MaNhanVien";

            using (SqlCommand command = new SqlCommand(query, conn))
            {
                command.Parameters.AddWithValue("@MaNhanVien", employeeId);

                conn.Open();
                int count = Convert.ToInt32(command.ExecuteScalar());
                conn.Close();

                return count > 0;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string employeeId = txtMaNV.Text.Trim().ToLower();
            string tenNhanVien = txtTenNV.Text;
            string email = txtEM.Text;
            string chucVu = txtSDT.Text;
            string diaChi = txtDC.Text;
            string sodienthoai = txtCV.Text;
            string gioiTinh = rabNam.Checked ? "Nam" : "Nữ";


            if (string.IsNullOrEmpty(employeeId))
            {
                MessageBox.Show("Vui lòng nhập mã nhân viên", "Ràng buộc dữ liệu");
                txtMaNV.Select();
                return;
            }
            if (IsEmployeeExists(employeeId))
            {
                MessageBox.Show("Mã nhân viên đã tồn tại trong cơ sở dữ liệu", "Ràng buộc dữ liệu");
                txtMaNV.Select();
                return;
            }

            string query = "INSERT INTO NhanVien (MaNhanVien, TenNhanVien, Mail, ChucVu, DiaChi,SoDienThoai) " +
                            "VALUES (@MaNhanVien, @TenNhanVien, @Mail, @ChucVu, @DiaChi,@SoDienThoai)";

            using (SqlCommand command = new SqlCommand(query, conn))
            {
                command.Parameters.AddWithValue("@MaNhanVien", employeeId);
                command.Parameters.AddWithValue("@TenNhanVien", tenNhanVien);
                command.Parameters.AddWithValue("@Mail", email);
                command.Parameters.AddWithValue("@ChucVu", chucVu);
                command.Parameters.AddWithValue("@DiaChi", diaChi);
                command.Parameters.AddWithValue("@SoDienThoai", sodienthoai);
                command.Parameters.AddWithValue("@GioiTinh", gioiTinh);

                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            }

            MessageBox.Show("Thêm Nhân Viên Thành Công !", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
            LoadEmployeeData();
            txtDC.Text = txtSDT.Text = txtEM.Text = txtCV.Text = txtTenNV.Text = txtMaNV.Text = string.Empty;
        }
        private DataGridViewRow r;

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (e == null)
            {
                MessageBox.Show("Vui lòng chọn dữ liệu", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            string employeeId = txtMaNV.Text.Trim().ToLower();
            string tenNhanVien = txtTenNV.Text;
            string email = txtEM.Text;
            string chucVu = txtSDT.Text;
            string diaChi = txtDC.Text;
            string sodienthoai = txtCV.Text;
            string gioiTinh = rabNam.Checked ? "Nam" : "Nữ";

            string query = "UPDATE NhanVien SET TenNhanVien = @TenNhanVien, Mail = @Mail, ChucVu = @ChucVu, DiaChi = @DiaChi, SoDienThoai = @SoDienThoai, GioiTinh = @GioiTinh WHERE MaNhanVien = @MaNhanVien";

            using (SqlCommand command = new SqlCommand(query, conn))
            {
                command.Parameters.AddWithValue("@MaNhanVien", employeeId);
                command.Parameters.AddWithValue("@TenNhanVien", tenNhanVien);
                command.Parameters.AddWithValue("@Mail", email);
                command.Parameters.AddWithValue("@ChucVu", chucVu);
                command.Parameters.AddWithValue("@DiaChi", diaChi);
                command.Parameters.AddWithValue("@SoDienThoai", sodienthoai);
                command.Parameters.AddWithValue("@GioiTinh", gioiTinh);

                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            }

            MessageBox.Show("Cập nhật Nhân Viên Thành Công !", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
            LoadEmployeeData();
            txtDC.Text = txtSDT.Text = txtEM.Text = txtCV.Text = txtTenNV.Text = txtMaNV.Text = string.Empty;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (selectedEmployeeId <= 0)
            {
                MessageBox.Show("Vui lòng chọn nhân viên cần xóa.", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (MessageBox.Show("Bạn có chắc chắn muốn xóa nhân viên này?", "Xác nhận xóa", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    string query = "DELETE FROM NhanVien WHERE MaNhanVien = @MaNhanVien";

                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@MaNhanVien", selectedEmployeeId);

                        conn.Open();
                        command.ExecuteNonQuery();
                        conn.Close();
                    }

                    MessageBox.Show("Xóa Nhân Viên Thành Công!", "Thành công", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    LoadEmployeeData();
                    txtDC.Text = txtSDT.Text = txtEM.Text = txtCV.Text = txtTenNV.Text = txtMaNV.Text = string.Empty;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xóa nhân viên: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnXem_Click(object sender, EventArgs e)
        {
            if (selectedEmployeeId <= 0)
            {
                MessageBox.Show("Vui lòng chọn nhân viên để xem thông tin chi tiết.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            string query = "SELECT * FROM NhanVien WHERE MaNhanVien = @MaNhanVien";

            using (SqlCommand command = new SqlCommand(query, conn))
            {
                command.Parameters.AddWithValue("@MaNhanVien", selectedEmployeeId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        txtMaNV.Text = reader["MaNhanVien"].ToString();
                        txtTenNV.Text = reader["TenNhanVien"].ToString();
                        txtEM.Text = reader["Mail"].ToString();
                        txtSDT.Text = reader["ChucVu"].ToString();
                        txtDC.Text = reader["DiaChi"].ToString();
                        txtCV.Text = reader["SoDienThoai"].ToString();

                        string gioiTinh = reader["GioiTinh"].ToString();
                        if (gioiTinh == "Nam")
                        {
                            rabNam.Checked = true;
                            rabNu.Checked = false;
                        }
                        else
                        {
                            rabNam.Checked = false;
                            rabNu.Checked = true;
                        }


                        reader.Close();
                        conn.Close();
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy thông tin cho nhân viên này.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi khi lấy thông tin nhân viên: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnQL_Click(object sender, EventArgs e)
        {
            frmTrangChu TrangChu = new frmTrangChu();
            TrangChu.Show();
            this.Hide();
         
        }
    }
}

