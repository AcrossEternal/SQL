using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace HotelMIS.Comm
{
    public class Photo
    {
        /// <summary>
        /// 对指定的文件进行读取操作
        /// </summary>
        /// <param name="PhotoFileName">文件名</param>
        /// <returns>文件的内容</returns>
        public static byte[] ReadPhoto(string PhotoFileName)
        {
            //创建文件流对象f，指向磁盘的文件
            FileStream f = new FileStream(PhotoFileName, FileMode.Open, FileAccess.Read);
            //创建二进制读取器对象
            BinaryReader reader = new BinaryReader(f);
            //通过读取器读取文件内容
            byte[] buffer = reader.ReadBytes((int)f.Length);

            return buffer;
        }
    }
}
