--(1)��������ŮԱ��(F)������
SELECT e_name,e_gender,YEAR(CURDATE()) - YEAR(e.hireDate)
from employee as e
where e.e_gender='f';
--(2)ʹ��LIMIT��ѯ�ӵ�3����¼��ʼ����������¼
SELECT * from employee LIMIT 2,3
--(3)��ѯ������Ա(SALSEMAN)����͹���
SELECT MIN(e_salary)
FROM employee
WHERE e_job = 'SALESMAN'
--(4)��ѯ�����Լ���ĸN����S��β�ļ�¼��
SELECT * from employee 
where e_name like '%N' or e_name like '%S';
--(5)��ѯ��BeiJing������Ա����������ְ��
select  e.e_name,e.e_job 
from employee e,dept d 
where e.dept_no = d.d_no and 
d.d_location='BeiJing'
--��6��ʹ�������ӷ�ʽ��ѯemployee��dept��
SELECT *
FROM employee LEFT JOIN dept 
ON employee.dept_no = dept.d_no;
--��7����ѯ����2001~2005����ְ��Ա������Ϣ����ѯ���ű��Ϊ20��30��Ա����Ϣ��ʹ��UNION�ϲ�������ѯ���
select * 
from employee 
where YEAR (hireDate) between 2001 and 2005
union
select* from employee 
where dept_no in(20,30)
--��8��ʹ��LIKE��ѯԱ�������а�����ĸa�ļ�¼
SELECT *
FROM employee 
WHERE e_name LIKE 'a%' or
e_name LIKE '%a' or
e_name LIKE '%a%'