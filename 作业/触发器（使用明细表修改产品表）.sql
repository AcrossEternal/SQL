--3.  ��TBL_PurchaseBill������һ��Update������purchaseBill_update

--���ܣ���TBL_PurchaseBill����ĳһ�ʶ�����onprocess��״̬��0����Ϊ2ʱ��

--��ʹ�øö�����Ӧ����ϸ��Ϣ���²�Ʒ��Ϣ���еĿ�桢�۸��ֶΡ�
create trigger purchaseBill_update
on dbo.TBL_PurchaseBill --������
for update  --���´�����
as
  if update(OnProcess)
  begin
    declare @oldOnProcess smallint,@newOnProcess smallint,@purchaseID nchar(12)
    select @purchaseID=purchaseID,@oldOnProcess=onprocess from deleted
    select @newOnProcess=OnProcess from inserted
    if(@oldOnProcess=0 and @newOnProcess=2)
       --ʹ����ϸ���޸Ĳ�Ʒ��
   
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

