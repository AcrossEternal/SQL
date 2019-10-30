--计算18除以5的商和余数
select FLOOR (18/5),18%5
--将弧度值pi（）/4转换为角度值

select DEGREES(PI()/4)
--计算9的4次方
select POWER(9,4)
--保留浮点值3.14159小数点后面2位

select ROUND(3.14159,2)
--分别计算字符串“hello world”和“University”的长度
select LEN('Hello world'),LEN('University')
--从字符串"Nice to meet you !"中获取子字符串“meet”

select SUBSTRING('Nice to meet you!',9,4)
--除去字符串“h e l l o”中的空格


select REPLACE('h e l l o ',' ','')
--将字符串“Sqlserver”顺序输出

select REVERSE('SQLserver')
--在字符串“SQlServerSQLServer”中，从第4个字母开始查找字母Q第一次出现的位置


select CHARINDEX('Q','SQLServerSQLServer',4)
--计算当前日期是一年的第几天


select DATENAME(DAYOFYEAR,'2018-1-5')
--计算当前日期是一周中的第几个工作日
select DATENAME(WEEKDAY,'2018-1-5')
--计算 1929-02-14 与当前日期之间相差的年份

select DATEDIFF(YEAR,'1929-2-14',GETDATE())