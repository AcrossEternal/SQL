select * from TBL_PurchaseBill
select * from TBL_PurchaseDetail

select GETDATE()
select CONVERT(char(8),getdate(),112)


go

create proc usp_CreatePurchaseID
@purchaseDate datetime
as
    declare @date nchar(8),@maxPurchaseID nchar(12),@purchaseID nchar(12)
    
--��1��������ת����8λ�ַ���
   set @date=CONVERT(nchar(8),@purchaseDate,112)
--��2�������ڲ�ѯ���������
select @maxPurchaseID=MAX( purchaseid) from dbo.TBL_PurchaseBill where PurchaseID like @date+'%'


--��3�����û�в鵽�����ɵ�һ�ʶ�����ţ�����+'0001'��������ҵ��������+1
   if(@maxPurchaseID is null)
   set @purchaseID =@date+'0001'
   else
   set @purchaseID =CONVERT(nchar(12), CONVERT(bigint ,@maxPurchaseID)+1)
--��4�����   
select @purchaseid   


exec dbo.usp_CreatePurchaseID '2018-07-2'