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
        /// ִ���������Ӱ������(insert , update, delete),��������Ӱ�������
        /// </summary>
        /// <param name="cmd">Ҫִ�е�����</param>
        /// <returns>������Ӱ������</returns>
        public static int ExecuteSQL(SqlCommand cmd)
        {
            //1.�������Ӷ���
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnString"].ConnectionString);


            //2.�����������(����Ҫ)
            cmd.Connection = conn;
            try
            {
                //3.������
                conn.Open();
                //4.ִ������
                int num = cmd.ExecuteNonQuery();
                return num;
            }
            catch (Exception ex)
            {
                throw new DBException(ex);//���쳣�׳�
            }
            finally
            {
                //5.�ر�����
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
        /// <summary>
        /// ִ�����select��������һ������
        /// </summary>
        /// <param name="cmd">Ҫִ�е�select</param>
        /// <returns>��ѯ����һ������</returns>
        public static object GetScalar(SqlCommand cmd)
        {
            //1.�������Ӷ���
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnString"].ConnectionString);
            //2.�����������(����Ҫ�������������ͨ����������)
            cmd.Connection = conn;
            try
            {
                //3.������
                conn.Open();
                //4.ִ������
                object obj = cmd.ExecuteScalar();
                return obj;

            }
            catch (Exception ex)
            {
                throw new DBException(ex);//���쳣�׳�
            }
            finally
            {
                //5.�ر�����
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
        /// <summary>
        /// �������ݼ�(select)���������ݼ�
        /// </summary>
        /// <param name="cmd">Ҫִ�е�select���</param>
        /// <returns>��ѯ�������ݼ�</returns>
        public static DataSet QueryData(SqlCommand cmd)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnString"].ConnectionString);
            cmd.Connection = conn;
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            try
            {
                
                //�����������Զ��򿪡��ر�����
                ada.Fill(ds);
                return ds;


            }
            catch (Exception ex)
            {
                throw new DBException(ex);
            }
            finally
            {
                //�ر�����
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
    }
}
