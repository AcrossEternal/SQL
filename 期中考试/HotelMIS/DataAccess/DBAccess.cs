using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;

namespace HotelMIS.DataAccess
{
    public class DBAccess
    {

        /// <summary>
        /// 执行命令返回受影响行数(insert , update, delete),并返回受影响的行数
        /// </summary>
        /// <param name="cmd">要执行的命令</param>
        /// <returns>返回受影响行数</returns>
        public static int ExecuteSQL(SqlCommand cmd)
        {
            //1.创建连接对象
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnString"].ConnectionString);


            //2.创建命令对象(不需要)
            cmd.Connection = conn;
            try
            {
                //3.打开连接
                conn.Open();
                //4.执行命令
                int num = cmd.ExecuteNonQuery();
                return num;
            }
            catch (Exception ex)
            {
                throw new DBException(ex);//将异常抛出
            }
            finally
            {
                //5.关闭连接
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
        /// <summary>
        /// 执行命令（select），返回一项数据
        /// </summary>
        /// <param name="cmd">要执行的select</param>
        /// <returns>查询到的一项数据</returns>
        public static object GetScalar(SqlCommand cmd)
        {
            //1.创建连接对象
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnString"].ConnectionString);
            //2.创建命令对象(不需要创建，命令对象通过参数传入)
            cmd.Connection = conn;
            try
            {
                //3.打开连接
                conn.Open();
                //4.执行命令
                object obj = cmd.ExecuteScalar();
                return obj;

            }
            catch (Exception ex)
            {
                throw new DBException(ex);//将异常抛出
            }
            finally
            {
                //5.关闭连接
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
        /// <summary>
        /// 返回数据集(select)，返回数据集
        /// </summary>
        /// <param name="cmd">要执行的select语句</param>
        /// <returns>查询到的数据集</returns>
        public static DataSet QueryData(SqlCommand cmd)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnString"].ConnectionString);
            cmd.Connection = conn;
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            try
            {
                
                //数据适配器自动打开、关闭连接
                ada.Fill(ds);
                return ds;


            }
            catch (Exception ex)
            {
                throw new DBException(ex);
            }
            finally
            {
                //关闭连接
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
    }
}
