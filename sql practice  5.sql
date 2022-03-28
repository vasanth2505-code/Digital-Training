use practice1and2;
select ENAME,HIREDATE from emp 
where DEPTNO =(select DEPTNO from emp where ENAME="SMITH") and ENAME!="SMITH";