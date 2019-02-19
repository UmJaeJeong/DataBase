use shopdb;
#indexTBL을 만든다. 쿼리문을 직접입력하여 만들어 본다.
create table indexTBL(
first_name varchar(14),
last_name varchar(16),
hire_date date
);
#employees데이터베이스에 있는 employees테이블의 데이터를 가져와라
select *
from employees.employees;
#employees데이터베이스에 있는 employees테이블의 first_name, last_name,
#hire_date 데이터 중 500개만 가져와서 indexTBML테이블에 삽입하라
insert into indexTBL
select first_name, last_name, hire_date
from employees.employees
limit 500;

select *
from indexTBL;
#indexTBL테이블에서 전체데이터를 다 뒤져서 first_name이 Mary인 것만
#가져와라 상당히 비효율적인 코드이다. 예를 들어 100만건 이상이다?
#엄청 오래걸릴 것이다. 이래서 index(색인)을 사용한다.
select *
from indexTBL
where first_name='Mary';
#아래코드가 책뒤에 색인을 만들어주는 형태이다.
#색인을 만들고 위의 쿼리문을 실행해주면 속도 자체가 틀리다.
#실무에서 상당히 많이 사용된다.
create index idx_indexTBL_firstname ON indexTBL(first_name);
show index from indexTBL;

#인덱스 삭제하는 방법 
drop index idx_indexTBL_firstname on indexTBL;

#primary key는 주index이다.  pk를 쓰는 이유는 데이터가 유니크하다는것을 알려줌
#주인덱스 같은 경우는 색인 보다는 영어사전
#주인덱스는 보조인덱스보다 빠르다.

#!!!! 위험!!!!!!
#주요한 서버 DB를 회사에서 사용하고 있느중(업무시간)
#일경우, 

#튜닝
#데이터베이스 성능 향상
#쿼리에 응답하는 시간 단축시키는것


