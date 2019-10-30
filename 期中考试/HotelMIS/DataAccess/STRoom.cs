using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using HotelMIS.Comm;

namespace HotelMIS.DataAccess
{
    public class STRoom
    {
        private SqlCommand cmd;//字段

         public STRoom()
         {
              cmd = new SqlCommand();
              cmd.CommandType = CommandType.StoredProcedure;
         }
        public bool IsRoomPhoto(string RoomID, string RoomName,int NumofTable ,string RoomType,int RoomStatus , string RoomPhoto)
        {
            //插入包厢有照片的
            cmd.CommandText = "IsRoomPhoto";
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@RoomID", SqlDbType.Char, 10).Value = RoomID;
            cmd.Parameters.Add("@RoomName", SqlDbType.VarChar,50).Value = RoomName;
            cmd.Parameters.Add("@NumofTable", SqlDbType.Int).Value = NumofTable;
            cmd.Parameters.Add("@RoomType", SqlDbType.VarChar ,100).Value = RoomType;
            cmd.Parameters.Add("@RoomStatus", SqlDbType.Bit).Value = RoomStatus;
            cmd.Parameters.Add("@RoomPhoto", SqlDbType.Image).Value = Photo.ReadPhoto(RoomPhoto);
            try
            {
                int num = DBAccess.ExecuteSQL(cmd);
                if (num > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch
            {
                return false;
            }
        }
        public DataSet SelectRoomIDAndRoomType(string RoomID, string RoomType)
        {
            //模糊查找
            cmd.CommandText = "SelectRoomIDAndRoomType";
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@RoomID", SqlDbType.Char, 10).Value = RoomID;
            cmd.Parameters.Add("@RoomType", SqlDbType.VarChar, 100).Value = RoomType;
            try
            {
                DataSet ds = DBAccess.QueryData(cmd);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool DeleteRoom(string RoomID)//非静态方法 
        {
            cmd.CommandText = "DeleteRoom";//删除指定房间编号的房间
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@RoomID", SqlDbType.Char, 11).Value = RoomID;
            try
            {
                int num = DBAccess.ExecuteSQL(cmd);
                if (num > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
        
        public bool IsRoom(string RoomID, string RoomName, int NumofTable, string RoomType, int RoomStatus)
        {
            //插入包厢无照片记录
            cmd.CommandText = "IsRoom";
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@RoomID", SqlDbType.Char, 10).Value = RoomID;
            cmd.Parameters.Add("@RoomName", SqlDbType.VarChar, 50).Value = RoomName;
            cmd.Parameters.Add("@NumofTable", SqlDbType.Int).Value = NumofTable;
            cmd.Parameters.Add("@RoomType", SqlDbType.VarChar, 100).Value = RoomType;
            cmd.Parameters.Add("@RoomStatus", SqlDbType.Bit).Value = RoomStatus;
            try
            {
                int num = DBAccess.ExecuteSQL(cmd);
                if (num > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch
            {
                return false;
            }
        }
        public bool UpdateRoom(string RoomID, string RoomName, int NumofTable, string RoomType, int RoomStatus)//非静态方法 
        {
            cmd.CommandText = "UpdateRoom";//修改包厢，无照片
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@RoomID", SqlDbType.Char, 11).Value = RoomID;
            cmd.Parameters.Add("@RoomName", SqlDbType.VarChar, 50).Value = RoomName;
            cmd.Parameters.Add("@NumofTable", SqlDbType.Int).Value = NumofTable;
            cmd.Parameters.Add("@RoomType", SqlDbType.VarChar, 100).Value = RoomType;
            cmd.Parameters.Add("@RoomStatus", SqlDbType.Bit).Value = RoomStatus;
            try
            {
                int num = DBAccess.ExecuteSQL(cmd);
                if (num > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
        public bool UpdateRoomPhoto(string RoomID, string RoomName, int NumofTable, string RoomType, int RoomStatus, string RoomPhoto)//非静态方法 
        {
            cmd.CommandText = "UpdateRoomPhoto";//修改包厢,有照片
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@RoomID", SqlDbType.Char, 10).Value = RoomID;
            cmd.Parameters.Add("@RoomName", SqlDbType.VarChar, 50).Value = RoomName;
            cmd.Parameters.Add("@NumofTable", SqlDbType.Int).Value = NumofTable;
            cmd.Parameters.Add("@RoomType", SqlDbType.VarChar, 100).Value = RoomType;
            cmd.Parameters.Add("@RoomStatus", SqlDbType.Bit).Value = RoomStatus;
            try
            {
                int num = DBAccess.ExecuteSQL(cmd);
                if (num > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
        public object GetPhoto(string RoomID)//从数据库中读出照片
        {
            cmd.CommandText = "GetPhoto";
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@RoomID", SqlDbType.Char, 10).Value = RoomID;
            try
            {
                object obj = DBAccess.GetScalar(cmd);
                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
