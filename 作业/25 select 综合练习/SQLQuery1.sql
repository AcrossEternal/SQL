--select �ۺ�ѵ��
--��ѯĳ���û�����ʱ�䳬��3����δ�黹����ͼ����Ϣ�Ͷ�����Ϣ
select bo.*,u.*
from dbo.TBL_BorrowInfo as b,dbo.TBL_BookInfo as bo,dbo.TBL_User as u
where DATEDIFF(DAY,BorrowDate,GETDATE())>90 and IsReturned=0 and bo.BookID=b.BookID and b.UserID=u.UserID


--��ѯ��������ͼ��ĳ�����


select Publisher 
from dbo.TBL_BookInfo
where BookID in(select top 1 BookID 
from dbo.TBL_BorrowInfo
group by BookID
order by COUNT(BookID)desc)                                                          

--��ѯδ�黹ͼ�鳬��3�����û���Ϣ
select top 3 u.*,b.IsReturned
from dbo.TBL_BorrowInfo as b,dbo.TBL_User as u
where  b.IsReturned=0 and b.UserID=u.UserID


--��ѯĳ������(����)������Ϊ��ҵ������δ�����ĵ�ͼ����Ϣ
select bo.*
from dbo.TBL_BookInfo as bo , dbo.TBL_BorrowInfo as b
where Author like '��%' and ClassID like '��ҵ����' and b.BookID=bo.BookID
