using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;

namespace Nhom10_QL_KARAOKE
{
    public class DBConnect
    {
        SqlConnection conn;

        public SqlConnection Conn
        {
            get { return conn; }
            set { conn = value; }
        }


        public static string strConn = "Data Source=LAPTOP-NTV080\\SQLEXPRESS;Initial Catalog=QL_KARAOKE;Integrated Security=True";
        public DBConnect()
        {
            conn = new SqlConnection(strConn);
        }

        public void open()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
        }

        public void close()
        {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }

        public int getNonQuery(string sql)
        {
            open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int kq = cmd.ExecuteNonQuery();
            close();
            return kq;
        }
        public object getScalar(string sql)
        {
            open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            object kq = cmd.ExecuteScalar();
            close();
            return kq;
        }

        public DataTable getDataTable(string sql)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(dt);
            return dt;
        }

        public SqlDataReader getDataReader(string sql)
        {
            open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            close();
            return dr;
        }
        public int updateData(DataTable dt, string sql)
        {
            SqlDataAdapter adapt = new SqlDataAdapter(sql, conn);
            SqlCommandBuilder cmd = new SqlCommandBuilder(adapt);
            int kq = adapt.Update(dt);
            return kq;
        }
    }
}
