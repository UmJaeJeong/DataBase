#데이터베이스 = 스키마 생성 
create database mydb;

#스키마(데이터베이스) 사용 (볼드체 됨)
use mydb;

#테이블 생성
create table DEPT(
	DEPTNO int primary key not null, #primary key(주 키)설정 null 사용할수 없음
    DNAME varchar(14) not null,
    LOC varchar(30) null
);

#테이블에 행 추가 
insert into DEPT values(10,'경리부','서울');
insert into DEPT values(20,'인사부','인천');
insert into DEPT values(30,'영업부','용인');
insert into DEPT values(40,'전산부','수원');


#테이블 생성
create table EMP(
	dpetNo int primary key not null,
    deptName char(10) not null,
    job char(5) not null,
    sal int not null
);


#테이블에 데이터 값 추가(행추가)
insert into EMP values(10,'인사팀','사원',250), 
(20,'재무팀','대리',300), 
(30, '법무팀', '과장', 350), 
(40, '영업팀', '사원', 250),
(50, '설계팀', '부장', 500);
insert into EMP values(60,'인사팀','사원',250);

#update문 수정
update EMP
set sal = 180
where job = '사원';

#모든 EMP의 데이터 출력 gird와 유사하게 나옴
select * from EMP;

#행 삭제
delete from EMP
where deptName = '인사팀';

select * from EMP;


#테이블 생성
create table videotbl(
videoid int primary key not null auto_increment,  #주키 설정 및 자동 증가 1부터 시작
title varchar(40) not null,
genre varchar(8) not null,
star varchar(10) null
);

#행 추가
insert into videotbl values(null, '태극기휘날리며', '전쟁', '장동건'),
(null, '대부', '액션', null),
(null, '반지의제왕', '액션', '일라이저우드'),
(null, '친구', '액션', '유오성'),
(null, '해리포터', '환타지', '다니엘'),
(null, '형', '코미디', '조정석');


select * from videotbl;

#where문으로 not null인 star열의 데이터 찾음
select * from videotbl
where star is not null;

#update문으로 title이 형인데이터를 동생으로 수정
update videotbl
set title = '동생'
where title ='형';

select * from videotbl
where genre ='액션';

select * from videotbl
where star ='유오성';

#모든 행을 삭제하는 방법 2가지   1) delete from videotbl;
#2)
truncate videotbl;

#테이블 삭제
drop table videotbl;
