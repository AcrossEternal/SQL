--(1)计算所有女员工(F)的年龄
SELECT e_name,e_gender,YEAR(CURDATE()) - YEAR(e.hireDate)
from employee as e
where e.e_gender='f';
--(2)使用LIMIT查询从第3条记录开始到第六条记录
SELECT * from employee LIMIT 2,3
--(3)查询销售人员(SALSEMAN)的最低工资
SELECT MIN(e_salary)
FROM employee
WHERE e_job = 'SALESMAN'
--(4)查询名字以及字母N或者S结尾的记录。
SELECT * from employee 
where e_name like '%N' or e_name like '%S';
--(5)查询在BeiJing工作的员工的姓名和职务
select  e.e_name,e.e_job 
from employee e,dept d 
where e.dept_no = d.d_no and 
d.d_location='BeiJing'
--（6）使用左连接方式查询employee和dept表
SELECT *
FROM employee LEFT JOIN dept 
ON employee.dept_no = dept.d_no;
--（7）查询所有2001~2005年入职的员工的信息，查询部门编号为20和30的员工信息并使用UNION合并两个查询结果
select * 
from employee 
where YEAR (hireDate) between 2001 and 2005
union
select* from employee 
where dept_no in(20,30)
--（8）使用LIKE查询员工姓名中包含字母a的记录
SELECT *
FROM employee 
WHERE e_name LIKE 'a%' or
e_name LIKE '%a' or
e_name LIKE '%a%'