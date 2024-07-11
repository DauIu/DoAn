using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    public partial class frmPhong : Form
    {
        SqlConnection conn;
        public frmPhong()
        {
            InitializeComponent();
            conn = new SqlConnection(ConnnentionString.Conn);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand command = new SqlCommand("INSERT INTO Phong (ma_phong, loai_phong, suc_chua, trang_thai) VALUES (@ma_phong, @loai_phong, @suc_chua, @trang_thai)", conn);
                command.Parameters.AddWithValue("@ma_phong", txtMaPhong.Text);
                command.Parameters.AddWithValue("@loai_phong", cmbLoaiphong.Text);
                command.Parameters.AddWithValue("@suc_chua", int.Parse(txtSucChua.Text));
                command.Parameters.AddWithValue("@trang_thai", cmbTrangThai.Text);
                command.ExecuteNonQuery();
                MessageBox.Show("Thêm phòng thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        private void btnXemDanhSach_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM Phong", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                dgvDanhSachPhong.DataSource = dataTable;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            // Lấy mã phòng cần xóa từ DataGridView hoặc từ các điều khiển khác trên giao diện
            string maPhong = txtMaPhong.Text;

            try
            {
                conn.Open();

                // Xóa các hàng liên quan trong bảng "DatPhong"
                SqlCommand deleteDatPhongCommand = new SqlCommand("DELETE FROM DatPhong WHERE ma_phong = @maPhong", conn);
                deleteDatPhongCommand.Parameters.AddWithValue("@maPhong", maPhong);
                deleteDatPhongCommand.ExecuteNonQuery();

                // Xóa phòng trong bảng "Phong"
                SqlCommand deletePhongCommand = new SqlCommand("DELETE FROM Phong WHERE ma_phong = @maPhong", conn);
                deletePhongCommand.Parameters.AddWithValue("@maPhong", maPhong);
                deletePhongCommand.ExecuteNonQuery();

                MessageBox.Show("Xóa phòng thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        private void frmPhong_Load(object sender, EventArgs e)
        {
            cmbTrangThai.Items.Add("Trống"); // Tùy chọn Trống
            cmbTrangThai.Items.Add("Đã đặt"); // Tùy chọn Đã đặt



            using (conn = new SqlConnection(ConnnentionString.Conn))
            {
                // Mở kết nối
                conn.Open();

                // Thực hiện truy vấn để lấy dữ liệu từ bảng Phong
                string query = "SELECT MALP FROM Phong";
                SqlCommand command = new SqlCommand(query, conn);

                // Sử dụng SqlDataReader để lấy dữ liệu từ truy vấn
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    // Tạo một HashSet để lưu trữ các mục duy nhất
                    HashSet<string> uniqueLoaiPhongSet = new HashSet<string>();

                    // Đọc dữ liệu từ SqlDataReader và thêm vào danh sách duy nhất
                    while (reader.Read())
                    {
                        string loaiPhong = reader.GetString(0);
                        uniqueLoaiPhongSet.Add(loaiPhong);
                    }

                    // Xóa các mục hiện có trong ComboBox trước khi thêm dữ liệu mới
                    cmbLoaiphong.Items.Clear();

                    // Thêm danh sách các mục duy nhất vào ComboBox
                    cmbLoaiphong.Items.AddRange(uniqueLoaiPhongSet.ToArray());
                    dgvDanhSachPhong.CellClick += dgvDanhSachPhong_CellClick;
                    // Hoặc
                    // dataGridView.CellContentClick += DataGridView_CellContentClick;
                }
            }
            
        }

        private void dgvDanhSachPhong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0) // Chỉ xử lý khi người dùng chọn một hàng (row) hợp lệ
            {
                // Lấy hàng (row) được chọn
                DataGridViewRow row = dgvDanhSachPhong.Rows[e.RowIndex];

                // Lấy giá trị từ cột (column) tương ứng trong hàng
                string maPhong = row.Cells["ma_phong"].Value.ToString();
                string loaiPhong = row.Cells["loai_phong"].Value.ToString();
                int sucChua = Convert.ToInt32(row.Cells["suc_chua"].Value);
                string trangThai = row.Cells["trang_thai"].Value.ToString();

                // Hiển thị thông tin lên các ô văn bản tương ứng
                txtMaPhong.Text = maPhong;
                cmbLoaiphong.Text = loaiPhong;
                txtSucChua.Text = sucChua.ToString();
                cmbTrangThai.Text = trangThai;
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                // Mở kết nối
                conn.Open();

                // Chuẩn bị câu lệnh SQL để cập nhật thông tin phòng
                string query = "UPDATE Phong SET loai_phong = @loai_phong, suc_chua = @suc_chua, trang_thai = @trang_thai WHERE ma_phong = @ma_phong";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@ma_phong", txtMaPhong.Text);
                command.Parameters.AddWithValue("@loai_phong", cmbLoaiphong.Text);
                command.Parameters.AddWithValue("@suc_chua", int.Parse(txtSucChua.Text));
                command.Parameters.AddWithValue("@trang_thai", cmbTrangThai.Text);

                // Thực thi câu lệnh SQL
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    MessageBox.Show("Thông tin phòng đã được cập nhật thành công!");
                }
                else
                {
                    MessageBox.Show("Không tìm thấy phòng có mã " + txtMaPhong.Text);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message);
            }
            finally
            {
                // Đóng kết nối
                    conn.Close();
            }
        }
    }
}
