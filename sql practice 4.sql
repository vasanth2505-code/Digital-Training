 use practice1and2;
select ENAME,HIREDATE from emp 
where DEPTNO =(select DEPTNO from emp where ENAME="SMITH") and ENAME!="SMITH";
use practice1and2;
select EMPNO,ENAME from emp 
where SAL>(select avg(sal) from emp) order by SAL ASC;
use practice1and2;
select EMPNO,ENAME from emp
where DEPTNO = ANY(select DEPTNO from EMP where ENAME like"%U%");
use practice1and2;
select ENAME,SAL from emp
where DEPTNO = (select DEPTNO from emp where ENAME = "BLAKE") and ENAME!="BLAKE"; 
use practice1and2;
select DEPTNO,EMPLOYEE,JOB_TITLE from emp
where DEPTNO = (select distinct DEPTNO from emp where JOB_TITLE="SALESMAN");
use practice1and2;
select EMP,EMPLOYEE,SAL from emp
where SAL>(select avg(SAL) from emp) 
and DEPTNO = ANY(select DEPTNO from emp where EMPLOYEE like"%A%");