select *from dbo.TBL_User
select *from dbo.TBL_BookInfo
select *from dbo.TBL_BorrowInfo
--���
Insert dbo.TBL_BorrowInfo 
Values('F272/3','20170402032',GETDATE(),null,null)--��ȷ

Insert dbo.TBL_BorrowInfo 
Values('F272','20170402032',GETDATE(),null,null)--���󣬸������������ƣ�û�д����鼮���

Insert dbo.TBL_BorrowInfo 
Values('F272/3','20170402',GETDATE(),null,null)--���󣬸������������ƣ����޴���

--CHECKԼ��

Insert dbo.TBL_BookInfo
Values('A563/10','7-301-05039-9','���˼�������ѧ',' (��)�ƺ���;١������','1984-05-01 00:00:00.000',NULL,354100,665,'�콭������','A')
--��ȷ

--ϵͳ�ȼ���
Insert dbo.TBL_BookInfo Values
('A563/11','7-301-05039-9','���˼�������ѧ',' (��)�ƺ���;١������','1890-05-01 00:00:00.000',NULL,354100,665,'�콭������','A')
--����ʱ�䳬����Χ

--ʹ��defaultԼ�� 
Insert dbo.TBL_BorrowInfo (BookID,UserID,BorrowDate,ReturnDate) Values
('F425/13:3','20170310139',GETDATE(),null)

--��������
create rule date_rule
as
@pubdate>='1900-1-1'and @pubdate <=getdate()

go
--ʹ�ù�����Լ��
sp_bindrule'date_rule','tbl_bookinfo.publishdate'

go

sp_bindrule'date_rule','dbo.TBL_BorrowInfo.Borrowdate'

Insert dbo.TBL_BookInfo Values
('A563/111','7-301-05039-9','���˼�������ѧ',' (��)�ƺ���;١������','1790-05-01 00:00:00.000',NULL,354100,665,'�콭������','A')
--��֮ǰ�Ĺ�������ͻ

go  --�����

sp_unbindrule'tbl_bookinfo.publishdate'

go

sp_unbindrule'dbo.TBL_BorrowInfo.Borrowdate'

drop rule date_rule --ɾ������

go
Create default iszero
as
0
go
sp_bindefault 'iszero','Tbl_bookInfo.isturned'
go
sp_bindefault 'iszero','Tbl_borrowinfo.isturned' --�󶨹���
