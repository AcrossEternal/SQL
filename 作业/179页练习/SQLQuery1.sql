--����18����5���̺�����
select FLOOR (18/5),18%5
--������ֵpi����/4ת��Ϊ�Ƕ�ֵ

select DEGREES(PI()/4)
--����9��4�η�
select POWER(9,4)
--��������ֵ3.14159С�������2λ

select ROUND(3.14159,2)
--�ֱ�����ַ�����hello world���͡�University���ĳ���
select LEN('Hello world'),LEN('University')
--���ַ���"Nice to meet you !"�л�ȡ���ַ�����meet��

select SUBSTRING('Nice to meet you!',9,4)
--��ȥ�ַ�����h e l l o���еĿո�


select REPLACE('h e l l o ',' ','')
--���ַ�����Sqlserver��˳�����

select REVERSE('SQLserver')
--���ַ�����SQlServerSQLServer���У��ӵ�4����ĸ��ʼ������ĸQ��һ�γ��ֵ�λ��


select CHARINDEX('Q','SQLServerSQLServer',4)
--���㵱ǰ������һ��ĵڼ���


select DATENAME(DAYOFYEAR,'2018-1-5')
--���㵱ǰ������һ���еĵڼ���������
select DATENAME(WEEKDAY,'2018-1-5')
--���� 1929-02-14 �뵱ǰ����֮���������

select DATEDIFF(YEAR,'1929-2-14',GETDATE())