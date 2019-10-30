using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace SQLExcel1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnCount1_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = "Server=TS706337;database=library;uid=sa;pwd=123456";
                //打开连接方式
                conn.Open();
                MessageBox.Show("连接完成！");
                //关闭连接
                conn.Close();
            }
            catch (Exception)
            {
                Console.Write("no");
            }
        }

        private void btnExecuteCommand_Click(object sender, EventArgs e)
        {
             try
            {
            SqlConnection conn = new SqlConnection();
            SqlCommand com = new SqlCommand();
            conn.ConnectionString = "Server=teacher706;database=library;uid=student;pwd=123";
            ////修改一列
            //com.CommandText = "update dbo.librarian setBookName='计算机基础' where Author='甘利花'";
            ////删除一列的数据
            //com.CommandText = "delete from dbo.librarian where Publisher='地震出版社'";
            
            //添加信息     
            com.CommandText = "insert into '20170310040','韦定君',1,'123','1305779886@qq.com','2017软件技术2班',null";
            //添加书籍
            com.CommandText = "'TG385.2/49','7-200-01167-3','冲压模具设计与制造技术','陈炎嗣,郭景仪主编',1991.04,null,354800,540,'北京出版社','T','工业技术'";
            com.CommandText = "'TP312BA/254','7-03-004172-0','跟我学FoxBASE','陈燕梅编著',1994.08,null,456000,314,'科学出版社','T','工业技术'";
            com.CommandText = "'G634.7/245','7-302-11973-2','物理高考试题700选','((日)吉本市编;金德昌,张光兰译',1981.11,null,874510,644,'湖北人民出版社','G','文化、科学、教育、体育'";
            com.Connection = conn;
            //打开连接是-
            conn.Open();
            
            MessageBox.Show("打不开链接");
            //关闭连接
            conn.Close();
            }
            catch (Exception)
            {
                Console.Write("no");
            }
            
        }

        private void btnSlect_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Server=TS706337;database=library;uid=sa;pwd=123456";
            SqlCommand com = new SqlCommand();
            com.CommandText = "select BookName from dbo.TBL_BookInfo where BookID='F710/11'";
            com.Connection = conn;
            try
            {
                conn.Open();
                object obj =com.ExecuteScalar();
                MessageBox.Show (obj.ToString());
                conn.Close();
            }
            catch
            {
                Console.Write("no");
            }
        }

        private void btnGetValues_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "server=TS706337;database =library ; integrated security =true";

            SqlCommand com = new SqlCommand();
            com.CommandText = "select BookID,BookName from TBL_BookInfo";
            com.Connection = conn;
            string str= "";
            try
            {
                conn.Open();
                SqlDataReader rdr = com.ExecuteReader();
                while(rdr.Read())
                {
                    str += rdr["BookID"]+"  "+rdr["BookName"] + "\n";
                }
                MessageBox.Show(str);
            }
            catch(Exception ex)
            {
                  MessageBox.Show("no");
            }
            finally
            {
                if( conn.State==ConnectionState.Open)
                {
                  conn.Close();
                }
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnUseDataset_Click(object sender, EventArgs e)
        {
            //创建链接对象
            SqlConnection conn = new SqlConnection("server=TS706337;database =library2222 ; integrated security =true ");
            //创建命令对象
            SqlCommand com = new SqlCommand("select * from tbl_bookinfo", conn);
            //创建数据适配器对象
            SqlDataAdapter ada = new SqlDataAdapter(com);
            //创建数据集对象
            DataSet ds = new DataSet();
            try
            {
                ada.Fill(ds);
                dataGridView.DataSource = ds.Tables[0];
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnBookStoreProc1_Click(object sender, EventArgs e)
        {
            //创建链接对象
            SqlConnection conn = new SqlConnection("server=TS706337;database =library2222 ; integrated security =true ");
            //创建命令对象
            SqlCommand com = new SqlCommand();
            com.CommandText = "GetBookinfo";
            com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Clear();

            SqlDataAdapter ada = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            try
            {
                ada.Fill(ds);
                dataGridView.DataSource = ds.Tables[0];
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            
        }

        private void btnBookStoreProc2_Click(object sender, EventArgs e)
        {
            //创建链接对象
            SqlConnection conn = new SqlConnection("server=TS706337;database =library2222 ; integrated security =true ");
            //创建命令对象
            SqlCommand com = new SqlCommand();
            com.CommandText = "GetBookinfo1";
            com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Clear();
            com.Parameters.Add("@bookid", SqlDbType.Char, 15).Value = txtBookID.Text.Trim();

            SqlDataAdapter ada = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            try
            {
                ada.Fill(ds);
                dataGridView.DataSource = ds.Tables[0];
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        }
    }

