using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enumeration
{
    enum WeekDays
    {
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday
    }
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine("What day of the week is it?");
                string strday = Console.ReadLine();
                WeekDays day = (WeekDays)Enum.Parse(typeof(WeekDays), strday);
                switch (day)
                {
                    case WeekDays.Monday: Console.WriteLine(day + "是工作日的第一天"); break;
                    case WeekDays.Tuesday: Console.WriteLine(day + "是工作日的第二天"); break;
                    case WeekDays.Wednesday: Console.WriteLine(day + "是工作日的第三天"); break;
                    case WeekDays.Thursday: Console.WriteLine(day + "是工作日的第四天"); break;
                    case WeekDays.Friday: Console.WriteLine(day + "是工作日的第五天"); break;
                }
            }
            catch(Exception day)
            {
                Console.WriteLine("程序内有问题，建议查看:"+day);
            }
        }
    }
}
