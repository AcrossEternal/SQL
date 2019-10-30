using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using HotelMIS.DataAccess;
using HotelMIS.HotelBussinessLogic;
using System.IO;

namespace HotelMIS.HotelBussinessLogic
{
    public class RoomBussinessLogic
    {
        private STRoom st;

        public RoomBussinessLogic()
        {
            st = new STRoom();
        }

        public bool UpdateRoom(string RoomID, string RoomName, int NumofTable, string RoomType, int RoomStatus)
        {//修改无照片
            return st.UpdateRoom(RoomID, RoomName, NumofTable, RoomType, RoomStatus);
        }
        public bool IsRoomPhoto(string RoomID, string RoomName,int NumofTable ,string RoomType,int RoomStatus,string RoomPhoto)
        {//插入有照片
            return st.IsRoomPhoto(RoomID, RoomName, NumofTable,RoomType, RoomStatus,RoomPhoto);
        }
         public DataSet SelectRoomIDAndRoomType(string RoomID, string RoomType)
        {//模糊查找
            return st.SelectRoomIDAndRoomType(RoomID, RoomType);
        }
        public bool DeleteRoom(string RoomID)
         {//删除包厢
            return st.DeleteRoom(RoomID);
         }
        public bool IsRoom(string RoomID, string RoomName, int NumofTable, string RoomType, int RoomStatus)
        {//插入无照片
            return st.IsRoom(RoomID, RoomName, NumofTable, RoomType, RoomStatus);
        }
        public bool UpdateRoomPhoto(string RoomID, string RoomName, int NumofTable, string RoomType, int RoomStatus, string RoomPhoto)
        {//修改有照片
            return st.UpdateRoomPhoto(RoomID, RoomName, NumofTable, RoomType, RoomStatus, RoomPhoto);
        }
         public object GetPhoto(string RoomID)
        {//以RoomID来读图片
            return st.GetPhoto(RoomID);
        }
    }

}
