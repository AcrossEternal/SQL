using System;
using System.Collections.Generic;
using System.Text;

namespace HotelMIS.DataAccess
{
    public class DBException:Exception
    {
        public DBException(Exception innerException)
            : base("���ܷ������ݿ�", innerException)
        {
        }
    }
}
