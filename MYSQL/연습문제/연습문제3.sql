#19번
select EMPNO, ENAME, SAL
	from emp
    where DEPTNO in (select DEPTNO
							from dept);
                            

#서브쿼리를 이용하여 급여가 500이 넘는 사원과 같은 부서에 근무하는 직원을 조회하는 쿼리문을 완성해보라.
#28번
select *
	from emp
    where DEPTNO = some(select distinct DEPTNO
							from emp
                            where SAL >500);
                            
                            
#29번
#서브쿼리를 사용하여 테이블 emp_copy에 emp테이블의 모든 레코드를 추가하는 쿼리문을  작성하시오.
create table emp_copy(
EMPNO 		int primary key,
    ENAME 		varchar(20) not null,
    JOB			varchar(8) not null,
    MGR			varchar(10) null,
    HIREDATE	date not null,
    SAL			int not null,
	COMM		int null,
    DEPTNO		int not null,
    foreign key(DEPTNO) references dept(deptno)
);

Insert Into emp_copy select * from emp;
select  *
	from emp_copy;
drop table emp_copy;
    
    
#30번
#서브쿼리를 이용하여 emp_copy 테이블에 저장된 사원 정보 중 과장들의 최소 급여보다 많은 급여를 받는 사원들의 이름과 급여와 직급을 출력하되,
#과장의 출력하지 않는 SQL 문을 완성하시오.

select *
	from emp
    where JOB != '과장'
			and SAL > any (select SAL
								from emp
								where JOB='과장');
                                

#31번
#emp_copy테이블에 저장된 사원 정보중 인천에 위치한 부서에 
#소속된 사원들의 급여를 100 인상하는 SQL 문을 작성하시오(서브쿼리 작성시 dept테이블 이용)
update emp_copy
set SAL = SAL+100
where DEPTNO = any(select DEPTNO
							from dept
							where LOC ='인천');
                            
select *
	from emp_copy;
    
#32번
#emp_copy테이블에서 경리부에 소속된 사원들만 삭제하는 SQL 문을 작성하시오.
delete
	from emp_copy
    where DEPTNO = any(select DEPTNO
							from dept
							where DNAME ='경리부');

select *
	from emp_copy;
    
    
#33번
#서브쿼리를 이용해서 ‘이문세’와 동일한 직급을 가진 사원을 출력하는 SQL 문을 완성하시오.
select *
	from emp
    where JOB = any(select JOB
						from emp
						where ENAME='이문세');
                        
	

#34번
#서브쿼리를 ‘이문세’의 급여와 동일하거나 더 많이 받는 사원명과 급여를 출력하는 SQL문을 작성하시오.
select ENAME, SAL
	from emp
	where SAL >= any(select SAL
						from emp
                        where ENAME = '이문세');
                        
                        
                        
#35번
#서브쿼리를 이용하여 ‘인천’에서 근무하는 사원의 이름, 부서 번호를 출력하는 SQL 문을 작성하시오.
select ENAME,EMPNO
	from emp
    where DEPTNO = any(select DEPTNO
							from dept
                            where LOC ='인천');

                        

	
                            
