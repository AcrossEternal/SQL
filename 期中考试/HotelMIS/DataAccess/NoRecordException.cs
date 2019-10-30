using System;
using System.Collections.Generic;
using System.Text;

namespace HotelMIS.DataAccess
{
    public class NoRecordException:Exception
    {
        public NoRecordException(string message)
            : base(message)
        {
        }
        public NoRecordException()
            : base("没有这条记录")
        {
        }
    }
}
