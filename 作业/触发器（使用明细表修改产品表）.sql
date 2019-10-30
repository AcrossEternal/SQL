--3.  在TBL_PurchaseBill中增加一个Update触发器purchaseBill_update

--功能：当TBL_PurchaseBill表中某一笔订单的onprocess的状态由0更新为2时，

--将使用该订单对应的明细信息更新产品信息表中的库存、价格字段。
create trigger purchaseBill_update
on dbo.TBL_PurchaseBill --订单表
for update  --更新触发器
as
  if update(OnProcess)
  begin
    declare @oldOnProcess smallint,@newOnProcess smallint,@purchaseID nchar(12)
    select @purchaseID=purchaseID,@oldOnProcess=onprocess from deleted
    select @newOnProcess=OnProcess from inserted
    if(@oldOnProcess=0 and @newOnProcess=2)
       --使用明细表修改产品表
   
    update b
    set
       b.quantity=a.quantity+b.quantity,
       b.PurchasePrice=(a.PurchasePrice*a.Quantity+b.PurchasePrice*b.Quantity)/(a.quantity+b.quantity),
       b.SalePrice=(a.PurchasePrice*a.Quantity+b.PurchasePrice*b.Quantity)/(a.quantity+b.quantity)*1.2
    from
       (select *from dbo.TBL_PurchaseDetail where PurchaseID=@purchaseID) as a inner join dbo.TBL_Product as b
       on a.ProductID=b.ProductID
    

    end

select *from 

