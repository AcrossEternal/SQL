--	在读者信息表中查询编号为的读者是否存在，如存在显示“该读者已存在”，否则插入该读者的信息（’ 20080420001’, ’李伟’, 1,’123’, ’lw@sina.com’,’08级软件技术1班’)。
declare @count int
select @count=COUNT(*) from tbl_user where userid='20080420001'
if @count=1
print '该读者已存在'
else
insert into tbl_user
values('20080420001','李伟', 1,'123', 'lw@sina.com','08级软件技术1班',null)
go

--	显示所有借阅信息，其中是否归还用中文显示（0显示为“未归还”，1显示为“归还”）
select BorrowID, BookID,UserID,BorrowDate,ReturnDate,
case 
when IsReturned=0 then '未归还' 
when IsReturned=1 then '归还' end
as 是否归还 
from TBL_BorrowInfo

--	计算2+4+6+...+100
declare @num int, @sum int
select @num =2,@sum=0
while(@num<=100)
begin
set @sum = @sum +@num
set @num =@num+2
end
print @sum

