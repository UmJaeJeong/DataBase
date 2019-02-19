use mydb;
drop table emp;

create table emp(
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

insert into emp values(1001, '김사랑', '사원', 1013, '2007-03-01', 300, NULL, 20),
(1002, '한예슬', '대리', 1005, '2008-10-01', 250,  80, 30),
(1003, '오지호', '과장', 1005,'2005-02-10', 500,  100, 30),							
(1004, '이병헌', '부장', 1008, '2003-09-02', 600, NULL, 20),
(1005, '신동협', '과장', 1005, '2010-02-09', 450,  200, 30),
(1006, '장동건', '부장', 1008, '2003-10-09', 480, NULL, 30),
(1007, '이문세', '부장', 1008, '2004-01-08', 520, NULL, 10),
(1008, '감우성', '차장', 1003, '2004-03-08', 500,  0, 30),
(1009, '안성기', '사장', NULL, '1996-10-04', 1000, NULL, 20),
(1010, '이병헌', '과장', 1003, '2005-04-07', 500, NULL, 10),
(1011, '조향기', '사원', 1007, '2007-03-01', 280, NULL, 30),
(1012, '강혜정', '사원', 1006, '2007-08-09', 300, NULL, 20),
(1013, '박중훈', '부장', 1003, '2002-10-09', 560, NULL, 20),
(1014, '조인성', '사원', 1006, '2007-11-09', 250, NULL, 10);


create table salgrade(
	GRADE int primary key auto_increment,
    LOSAL int not null,
    HISAL int not null
);

insert into salgrade values(null, 700, 1200),
(null, 1200, 1400),
(null, 1700, 2000),
(null, 2000, 3000),
(null, 3000, 9999);

#join을 사용하여 출력
select e.ENAME, e.SAL, e.HIREDATE
	from dept as d
    join emp as e;
    
select DEPTNO, DNAME
	from dept;

#distinct : 중복제거
select distinct JOB
	from emp;
    
    
select EMPNO, ENAME, SAL
	from emp
    where SAL <=300;
    
select EMPNO, ENAME, SAL
	from emp
    where ENAME = '오지호';


select EMPNO, ENAME, SAL
	from emp
    where SAL not in(250,300,500);
    

select EMPNO, ENAME, SAL
	from emp
    where SAL!=250 and SAL!=300 and 500;
    
select *
	from emp
    where ENAME like '김%' or ENAME like '%기%';

select if(JOB='사장',"사장이 되겠지요","누구지요") as ''
from emp
where MGR is null;

#19번
select EMPNO, ENAME, SAL
	from emp
    where DEPTNO in (select DEPTNO
							from dept);



                        
                        