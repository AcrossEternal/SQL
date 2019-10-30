create FUNCTION dbo.fn_volumn
(@length decimal(4,1),
@width decimal(4,1),
@height decimal(4,1))
returns decimal(12,3)
as
    begin 
    return @length*@width*@height
    end
    
select dbo.fn_volumn(3,2.5,1.2)


select userid,username,case sex when 1 then '男' else '女' end,class from TBL_User


create function fn_sex--男女
(@sex bit)
returns char(2)
as
  begin
    declare @sexChar char(2)
    if(@sex=1)
      set @sexChar= '男'
    else
      set @sexChar= '女'
    return @sexChar
  end
select userid,username,dbo.fn_sex(sex),class from TBL_User


--	创建标量函数计算过期图书罚款（参数为@BookId)
--罚款计算方法为：
--1、每本图书借阅期限为90天
--2、超过90天未归还或续借的开始计算罚款
--3、罚款=超期天数*0.1元
--4、在90天内罚款金额为0


create function dbo.fn_fine
(@BookID char(15))
returns decimal(5,1) 
as
  begin
    declare @day int ,@fine decimal(5,1)
    select  @day=datediff(day,borrowdate,getdate()) from tbl_borrowinfo where bookid=@bookid and isreturned =0
    if(@day>90)
       set @fine=(@day-90)*0.1
    else
       set @fine=0
    return @fine   
end  

--查询借阅表
select *from TBL_BorrowInfo
--调用用户函数查看罚钱  
select dbo.fn_fine('TP391.4/34')--逾期超过90天的


--	创建多语句表值函数
--	返回包括 bookid,bookname,class三个字段的表
--	输入参数为@type,如果@type的值为showclassid,
--则返回 class字段内容为图书类别编号;如果@type的值为showclassName, class字段显示图书类别名称。  
go
create function fn_showclassName
(@type nvarchar(15) ,
 bookName nvarchar(50) not null,
 bookid char(15))
returns table
as
  begin
  declare @type nvarchar(15)
  return  (select class,classid,bookid from dbo.TBL_User as u ,dbo.TBL_BorrowInfo as br,dbo.TBL_BookInfo as bo 
  where u.UserID=br.UserID and br.BookID =bo.BookID)
    if(@type='showclassid')
     select bookid from TBL_BookInfo as bo,TBL_User as u TBL_BorrowInfo as br where  u.UserID=br.UserID and br.BookID =bo.BookID
    else(@type='shwoclassName')
     select ClassID from 
 
 
-- 	创建内嵌表值函数
--	根据classid查询所有图书信息
