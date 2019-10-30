using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NewBookSQL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
        private void label4_Click(object sender, EventArgs e)
        {

        }
        private void btnBookNew_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("server=TS706337;database =library2222 ; integrated security =true");
            SqlCommand com = new SqlCommand();
            com.CommandText = "GetBookinfo2";
            com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;

            
            com.Parameters.Add("@bookid", SqlDbType.Char, 15).Value=txtBookID.Text.Trim();
            com.Parameters.Add("@ISBN", SqlDbType.Char, 20).Value = txtISBN.Text.Trim();
            com.Parameters.Add("@BookName", SqlDbType.NVarChar, 50).Value = txtBookName.Text.Trim();
            com.Parameters.Add("@Author", SqlDbType.NVarChar, 20).Value = txtAuthor.Text.Trim();
            com.Parameters.Add("@PublishDate", SqlDbType.DateTime ).Value = txtPublishDate.Text.Trim();
            com.Parameters.Add("@BookVersion", SqlDbType.NVarChar,40).Value = txtBookVersion.Text.Trim();
            com.Parameters.Add("@WordCount", SqlDbType.Int).Value = txtWordCount.Text.Trim();
            com.Parameters.Add("@PageCount", SqlDbType.SmallInt).Value = txtPageCount.Text.Trim();
            com.Parameters.Add("@Publisher", SqlDbType.NVarChar,40).Value = txtPublisher.Text.Trim();
            com.Parameters.Add("@ClassIDr", SqlDbType.Char,1).Value = txtClassID.Text.Trim();
         
            try
            {
                conn.Open();
                int num1 = com.ExecuteNonQuery();
                MessageBox.Show(num1.ToString());
            }
            catch (Exception ex)
            {
                MessageBox.Show("打不开连接");
            }
            finally
            {
                if (conn.State == (ConnectionState.Open))
                {
                    conn.Close();
                }
            }
            }

        
    }
}
