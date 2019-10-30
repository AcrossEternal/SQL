
--创建存储过程
create procedure selectAllUser
as
select *from TBL_User

--执行存储过程
EXEC dbo.selectAllUser

--修改存储过程
alter procedure selectAllUser
as
select *from TBL_User

--	创建一个名为GetAllBookClass的存储过程，从TBL_BookClass表中查询所有图书类别编号及类别名称。
create procedure GetAllBookClass
as
select * from TBL_BookClass
--	执行该存储过程。
EXEC dbo.GetAllBookClass
--	查看该存储过程的内容。
sp_helptext GetAllBookClass
--	修改存储过程，从TBL_BookClass表中只查询图书类别名称。
alter procedure GetAllBookClass
as
select ClassName from TBL_BookClass
--	删除该存储过程
drop procedure dbo.GetAllBookClass
