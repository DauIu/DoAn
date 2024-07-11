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
    public partial class frmDatPhong : Form
    {
        SqlConnection conn;
        public frmDatPhong()
        {
            InitializeComponent();
            conn = new SqlConnection(ConnnentionString.Conn);
        }

        private void btnDatPhong_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                if (string.IsNullOrEmpty(txtTenKhachHang.Text))
                {
                    MessageBox.Show("Vui lòng nhập tên khách hàng.");
                    return; // Dừng xử lý tiếp theo
                }

                // Kiểm tra trường 'txtSoDienThoai'
                if (string.IsNullOrEmpty(txtSoDienThoai.Text))
                {
                    MessageBox.Show("Vui lòng nhập số điện thoại.");
                    return; // Dừng xử lý tiếp theo
                }
                SqlCommand command = new SqlCommand("INSERT INTO DatPhong (ma_dat_phong,ma_phong, ten_khach_hang, so_dien_thoai, thoi_gian_dat, trang_thai) VALUES (@ma_dat_phong,@ma_phong, @ten_khach_hang, @so_dien_thoai, @thoi_gian_dat, @trang_thai)", conn);
                command.Parameters.AddWithValue("@ma_dat_phong", txtMaDatPhong.Text);
                command.Parameters.AddWithValue("@ma_phong", txtMaPhong.Text);
                command.Parameters.AddWithValue("@ten_khach_hang", txtTenKhachHang.Text);
                command.Parameters.AddWithValue("@so_dien_thoai", txtSoDienThoai.Text);
                command.Parameters.AddWithValue("@thoi_gian_dat", DateTime.Now);
                command.Parameters.AddWithValue("@trang_thai", "Đã đặt");
                command.ExecuteNonQuery();
                int maPhong = int.Parse(txtMaPhong.Text);

                SqlCommand updateCommand = new SqlCommand("UPDATE Phong SET trang_thai = @trang_thai WHERE ma_phong = @ma_phong", conn);
                updateCommand.Parameters.AddWithValue("@trang_thai", "Đã đặt");
                updateCommand.Parameters.AddWithValue("@ma_phong", maPhong);
                updateCommand.ExecuteNonQuery();



                MessageBox.Show("Đặt phòng thành công!");
                LoadDataToDataGridView();
                Loadlist();


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

        private void livPhong_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Xử lý sự kiện SelectedIndexChanged của ListView

            if (livPhong.SelectedItems.Count > 0)
            {
                // Lấy ListViewItem được chọn
                ListViewItem selectedItem = livPhong.SelectedItems[0];

                // Lấy mã phòng từ cột được chọn (ví dụ: cột đầu tiên)
                string maPhong = selectedItem.SubItems[0].Text;

                // Gán mã phòng vào TextBox
                txtMaPhong.Text = maPhong;
            }
        }

        private void frmDatPhong_Load(object sender, EventArgs e)
        {
            Loadlist();
            LoadDataToDataGridView();
        }

        private void Loadlist()
        {
            conn.Open();
            string query = "SELECT ma_phong, trang_thai FROM Phong";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();

            // Xóa các mục hiện tại trong ListView
            livPhong.Items.Clear();

            // Hiển thị danh sách mã phòng có trạng thái trống lên ListView
            while (reader.Read())
            {
                int maPhong = reader.GetInt32(0);
                string trangThai = reader.GetString(1);

                if (trangThai == "Trống")
                {
                    ListViewItem item = new ListViewItem(maPhong.ToString());
                    livPhong.Items.Add(item);
                }
            }
            // Thực hiện truy vấn để lấy mã đặt phòng cuối cùng



            for (int i = 0; i < livPhong.Items.Count; i++)
            {
                livPhong.Items[i].ImageIndex = 3;
            }

            // Đóng kết nối và giải phóng tài nguyên
            reader.Close();
            command.Dispose();
            string query1 = "SELECT TOP 1 ma_dat_phong FROM DatPhong ORDER BY ma_dat_phong DESC";
            SqlCommand command1 = new SqlCommand(query1, conn);
            int lastMaDatPhong = Convert.ToInt32(command1.ExecuteScalar());

            // Tăng mã đặt phòng cuối cùng lên 1
            int newMaDatPhong = lastMaDatPhong + 1;

            // Gán giá trị vào TextBox
            txtMaDatPhong.Text = newMaDatPhong.ToString();
            conn.Close();
        }
        private void LoadDataToDataGridView()
        {
            using (conn = new SqlConnection(ConnnentionString.Conn))
            {
                try
                {
                    conn.Open();

                    string query = "SELECT Phong.ma_phong, Phong.loai_phong, Phong.suc_chua, DatPhong.ten_khach_hang, DatPhong.so_dien_thoai, DatPhong.thoi_gian_dat, DatPhong.trang_thai " +
                                   "FROM Phong " +
                                   "INNER JOIN DatPhong ON Phong.ma_phong = DatPhong.ma_phong";

                    SqlCommand command = new SqlCommand(query, conn);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dgvPhongDaDat.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}
