select * from TBL_PurchaseBill
select * from TBL_PurchaseDetail

select GETDATE()
select CONVERT(char(8),getdate(),112)


go

create proc usp_CreatePurchaseID
@purchaseDate datetime
as
    declare @date nchar(8),@maxPurchaseID nchar(12),@purchaseID nchar(12)
    
--（1）按日期转化成8位字符串
   set @date=CONVERT(nchar(8),@purchaseDate,112)
--（2）按日期查询订单最大编号
select @maxPurchaseID=MAX( purchaseid) from dbo.TBL_PurchaseBill where PurchaseID like @date+'%'


--（3）如果没有查到，生成第一笔订单编号：日期+'0001'；如果查找到，最大编号+1
   if(@maxPurchaseID is null)
   set @purchaseID =@date+'0001'
   else
   set @purchaseID =CONVERT(nchar(12), CONVERT(bigint ,@maxPurchaseID)+1)
--（4）输出   
select @purchaseid   


exec dbo.usp_CreatePurchaseID '2018-07-2'