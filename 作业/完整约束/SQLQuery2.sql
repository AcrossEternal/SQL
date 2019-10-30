select *from dbo.TBL_User
select *from dbo.TBL_BookInfo
select *from dbo.TBL_BorrowInfo
--外键
Insert dbo.TBL_BorrowInfo 
Values('F272/3','20170402032',GETDATE(),null,null)--正确

Insert dbo.TBL_BorrowInfo 
Values('F272','20170402032',GETDATE(),null,null)--错误，该语句受外键限制，没有此类书籍编号

Insert dbo.TBL_BorrowInfo 
Values('F272/3','20170402',GETDATE(),null,null)--错误，该语句受外键限制，查无此人

--CHECK约束

Insert dbo.TBL_BookInfo
Values('A563/10','7-301-05039-9','马克思主义和美学',' (德)科赫著;佟景韩译','1984-05-01 00:00:00.000',NULL,354100,665,'漓江出版社','A')
--正确

--系统先检查键
Insert dbo.TBL_BookInfo Values
('A563/11','7-301-05039-9','马克思主义和美学',' (德)科赫著;佟景韩译','1890-05-01 00:00:00.000',NULL,354100,665,'漓江出版社','A')
--错误，时间超出范围

--使用default约束 
Insert dbo.TBL_BorrowInfo (BookID,UserID,BorrowDate,ReturnDate) Values
('F425/13:3','20170310139',GETDATE(),null)

--创建规则
create rule date_rule
as
@pubdate>='1900-1-1'and @pubdate <=getdate()

go
--使用规则来约束
sp_bindrule'date_rule','tbl_bookinfo.publishdate'

go

sp_bindrule'date_rule','dbo.TBL_BorrowInfo.Borrowdate'

Insert dbo.TBL_BookInfo Values
('A563/111','7-301-05039-9','马克思主义和美学',' (德)科赫著;佟景韩译','1790-05-01 00:00:00.000',NULL,354100,665,'漓江出版社','A')
--和之前的规则发生冲突

go  --解除绑定

sp_unbindrule'tbl_bookinfo.publishdate'

go

sp_unbindrule'dbo.TBL_BorrowInfo.Borrowdate'

drop rule date_rule --删除规则

go
Create default iszero
as
0
go
sp_bindefault 'iszero','Tbl_bookInfo.isturned'
go
sp_bindefault 'iszero','Tbl_borrowinfo.isturned' --绑定规则
