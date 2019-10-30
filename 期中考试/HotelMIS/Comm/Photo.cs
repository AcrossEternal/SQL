using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace HotelMIS.Comm
{
    public class Photo
    {
        /// <summary>
        /// ��ָ�����ļ����ж�ȡ����
        /// </summary>
        /// <param name="PhotoFileName">�ļ���</param>
        /// <returns>�ļ�������</returns>
        public static byte[] ReadPhoto(string PhotoFileName)
        {
            //�����ļ�������f��ָ����̵��ļ�
            FileStream f = new FileStream(PhotoFileName, FileMode.Open, FileAccess.Read);
            //���������ƶ�ȡ������
            BinaryReader reader = new BinaryReader(f);
            //ͨ����ȡ����ȡ�ļ�����
            byte[] buffer = reader.ReadBytes((int)f.Length);

            return buffer;
        }
    }
}
