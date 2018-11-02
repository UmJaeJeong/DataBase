show databases; #한줄단위 주석
use mysql;		#데이터베이스 사용 지정 (use)
show tables;	#테이블 목록
select user, host /* 실행 단축키 Ctrl + Shift + Enter */
from user;
# Create Schema bigdata #
CREATE SCHEMA `bigdata` ; # 스키마 생성
use bigdata; # 사용자 테이블지정

/*Cresate Table 테이블 생성 및 제약조건 */
/* Create Table 고객(
	고객아이디 varchar(20),
    고객이름 varchar(10),
    나이 int,
    등급 varchar(10),
    직업 varchar(20),
    적립금 int,
    primary key(고객아이디) # 기본으로 NOT NULL
    
    );

use bigdata;
SHOW TABLES; */


/* CREATE TABLE 제품(
	제품번호 CHAR(3) NOT NULL,
    제품명 VARCHAR(20),
    재고량 INT,
    단가 INT,
    제조업체 VARCHAR(20),
    primary key(제품번호)
    );
    
SHOW TABLES; */


/* CREATE TABLE 주문(
	주문번호 char(3),
    주문고객 varchar(20),
    주문제품 char(3),
    수량 int,
    배송지 varchar(30),
    주문일자 DATETIME,
    PRIMARY KEY(주문번호),
    FOREIGN KEY(주문고객) REFERENCES 고객(고객아이디),
    FOREIGN KEY(주문제품) REFERENCES 제품(제품번호)
    );
    
   # drop table 주문 cascade;
    
    SHOW TABLES; */
    
   /* SELECT * FROM 고객;
    ALTER TABLE 고객 ADD 가입날짜 DATETIME;
    show create table 고객;

	SELECT * FROM 고객;
    ALTER TABLE 고객 DROP 등급 CASCADE;
    show create table 고객; */
    
    
    
   /* alter table 제품 change 제고량 재고량 int; #이름 속성 변경
    show create table 제품;
    
    SELECT * FROM 제품; */
    
    
   /* 
    show create table 주문;
    
    alter table 주문 drop foreign key 주문_ibfk_1;
    
    alter table 주문 drop foreign key 주문_ibfk_3;
     
	alter table 주문 add foreign key(주문고객) references 고객(고객아이디)
    on delete cascade on update cascade;	#관련 투플을 같이 삭제함. */
	

    
   /* select * from 고객;
    alter table 고객 add 등급 varchar(10) default null after 나이; */
    
    
    
    /*
    INSERT
    INTO	고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES	('strawberry', '최유경', 30, 'vip', '공무원', 100);
    
    SELECT * FROM 고객;
    
    
    
    INSERT
    INTO	고객(고객아이디, 고객이름, 나이, 등급, 적립금)
    VALUES 	('tomato','정은심', 36, 'gold', 4000);
    
    SELECT * FROM 고객;
    */
    
    
    /*alter table 고객 drop 가입날짜;

	show create table 고객; */
    
    /*
    INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);
    INSERT INTO 고객 VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);
    INSERT INTO 고객 VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);
    INSERT INTO 고객 VALUES ('orange', '김용욱', 22,'silver', '학생', 0);
    INSERT INTO 고객 VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);
    INSERT INTO 고객 VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);
    INSERT INTO 고객 VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);
    
    SELECT * FROM 고객;
    */
    
    /*
    INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
    INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
    INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
    INSERT INTO 제품 VALUES ('p04', '맛난초콜렛', 1250, 2500, '한빛제과');
    INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
    INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
    INSERT INTO 제품 VALUES ('p07', '달콤비스켓', 1650, 1500, '한빛제과');
    
    SELECT * FROM 제품;
    */
    
    /*
    INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '13/01/01');
    INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '13/01/10');
    INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '13/01/11');
    INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '13/02/01');
    INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '13/02/20');
    INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '13/03/02');
    INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '13/03/15');
    INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '13/04/10');
    INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '13/04/11');
    INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '13/05/22');
    
    show create table 주문;
    SELECT * FROM 주문;
    
    */

/*
20:09:13	INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '13/01/01')	
Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails
(`bigdata`.`주문`, CONSTRAINT `주문_ibfk_2` FOREIGN KEY (`주문고객`) REFERENCES `제품` (`제품번호`))	0.125 sec
*/
    /*
    SELECT 고객아이디, 고객이름, 등급
    FROM 고객;
    
    SELECT 고객아이디, 고객이름, 나이, 등급, 직업, 적립금
    FROM 고객;
    */
    
    

    /*
    alter table 주문 drop foreign key 주문_ibfk_1;
    
    
    alter table 주문 add foreign key(주문고객) references 고객(고객아이디)
    on delete cascade on update cascade;
    
    select * from 고객;
    select * from 주문;
    show create table 주문;
    
    update 고객
    set 고객아이디 = '당근' # carrot -> 당근으로 변경.
    where 고객아이디 = 'carrot';
    
    update 고객
    set 고객아이디 = 'carrot'
    where 고객아이디 = '당근';
    */
    
    /*
    # Delete 실행 
    delete from 고객
    where 고객아이디 = 'carrot';
    
    delete from 고객
    where 고객아이디 = 'apple';
    */
    
    /*
    alter table 주문 drop foreign key 주문_ibfk_3;	#삭제
    
    alter table 주문 add foreign key(주문고객) references 고객(고객아이디)
    on delete set null on update set null;		#관련 투플의 외래키 값을 NULL로 변경함
    
    update 고객
    set 고객아이디 = 'banana'
    where 고객아이디 = '바나나';
    
    alter table 주문 add foreign key(주문고객) reference 고객(고객아이디)
    on delete set default on update set default;
    
    
	select * from 고객;
    select * from 주문;
    show create table 주문;
    */
    
    
  /*  
    select 제품명, 단가 as 가격 #AS 별칭으로 변경 (출력 시 명칭을 바꿈)
    from 제품;
    
    select * from 제품;
    
    select distinct 제조업체 from 제품; #중복제거 distinct 사용
    */
    
    /*
    SELECT 제품명, 단가 + 500 AS 조정단가
    FROM 제품;
    
    select	제품명, 재고량, 단가
    from	제품
    where	제조업체 = '한빛제과';
    
    select 	주문제품, 수량, 주문일자
    from 	주문
    where	주문고객 = 'banana' and 수량 >= 10;
    
    select 	주문제품, 수량, 주문일자, 주문고객
    from 	주문
    where	주문고객 = 'melon' or 수량 >= 15;
    
    select 	제품명, 단가, 제조업체
    from 	제품
    where	단가 >= 2000 and 단가<= 3000;
    
    # AND-모든 조건을만족해야 검색한다. OR-여러 조건 중 한 가지만 만족해도 검색한다. NOT-조건을 만족하지 않는 것만 검색한다.
    
    */
    
    
    /*
    # Like를 이용한 검색 %, _
    
    select  고객이름, 나이, 등급, 적립금
    from	고객
    where	고객이름 like '김%';
    
    select	고객이름, 나이, 등급, 적립금
    from	고객
	where	고객이름 like '%욱';
    
    select	고객이름, 나이, 등급, 적립금
    from 	고객
    where	고객이름 like '%용%';
    
    
    #Quiz
    select	고객아이디, 고객이름, 등급
    from 	고객
    where 	고객아이디 like 'm%' or 고객아이디 like '%n';
    
    select	고객아이디, 고객이름, 등급
    from 	고객
    where	고객아이디 like 'o%' or 고객아이디 like '%a';
    
    #아이디 n,a 포함 나이가 20살 이상의 고객
    select 	고객아이디, 고객이름, 나이, 등급
    from 	고객
    where	고객아이디 like '%na%' and 나이>=20;
    */
    
    /*
    select	고객이름
    from	고객
    where	나이 is null;
    
    select 	고객이름
    from	고객
    where	등급 is null;
    
    select	고객이름
    from	고객
    where	나이 is null or 등급 is null;
    
    select 	고객이름
    from 	고객
    where 	나이 is not null;
    
    select	고객이름
    from 	고객
	where	나이 is not null and 등급 is null;
    
    select 	고객이름, 직업
    from	고객
	where	직업 is not null;
    
    select	고객이름
    from	고객
    where	직업 is null;
    */
    
    
    /* #정렬검색
    
    select		고객이름, 등급, 나이
    from		고객
    order by	나이 desc;
    
    select		고객이름
    from		고객
	order by	이름 asc;
    
    select		주문고객, 주문제품, 수량, 주문일자
    from		주문
    where		수량 >= 10
    order by	주문제품 asc, 수량 desc;
    
    
    select		주문고객, 주문제품, 수량
    from		주문
    where		수량 >=20 and <=50
    order by	수량 desc ;
    */
    
    /*
    # 집계 함수를 이용한 검색
    select	round (avg(단가)) as 평균
    from 	제품;
    
    select 	sum(재고량) as '재고량 합계', round(avg(재고량))
    from	제품
    where 	제조업체 = '한빛제과';
    
    
    select 	count(고객아이디) as 고객수  # count > null값 포함x
    from 	고객;
    
    select  count(나이) as 고객수
    from	고객;
    
    select	count(*) as 고객수
    from	고객;
    
    select	count(distinct 제조업체) as '제조업체 수'
    from 	제품;
    
    select		주문제품, sum(수량) as 총주문수량
    from		주문
    group by	주문제품;
    
    select		제조업체, count(*) as 제품수, max(단가) as 최고가, round(avg(단가))
    from		제품
	group by	제조업체;

    select		제조업체, count(*) as 제품수, max(단가) as 최고가
    from		제품
    group by	제조업체 having count(*)>=3;
    
    #ex) 고객 테이블에서 적립금 평균이 1000원 이상인 등급에 대해 등급별 고객 수와 적립금 평균 검색
    select		count(*) as 고객수, round(avg(적립금)) as 평균
    from		고객
    group by	등급 having avg(적립금)>=1000;
    
    #ex) 주문 테이블에서 각 주문고객이 주문한 제품의 총주문수량을 주문제품별로 검색
    select		주문제품, 주문고객, sum(수량) as 총주문수량
    from		주문
    group by	주문제품;
    */
    
    
    /*
    #여러 테이블에 대한 조인검색
    
    #판매 데이터베이스에서 banana 고객이 주문한 제품 이름 검색
	select	제품.제품명
    from	제품, 주문
    where	주문.주문고객 = 'banana' and 제품.제품번호 = 주문.주문제품;
    
    #판매 데이터베이스에서 나이가 20세 이상의 고객이 주문한 제품의 주문제품과 주문일자 검색
    select	주문.주문제품, 주문.주문일자
	from	고객, 주문
    where	고객.나이 >=30 and 고객.고객아이디 = 주문.주문고객;
    
    select	주문제품, 주문일자
    from	고객 as c, 주문 as o
    where	c.나이 >=30 and o.주문고객 = c.고객아이디;
    
    #판매 데이터베이스에서 채광주 고객이 주문한 제품의 제품명 검색, 별칭
    select	제품.제품명
    from	고객, 제품, 주문
    where	고객.고객이름 = '채광주' and 고객.고객아이디 = 주문.주문고객
			and 제품.제품번호 = 주문.주문제품;
    
    select	x.제품명
    from	고객 as z, 제품 as x, 주문 as s
    where	z.고객이름 = '채광주' and z.고객아이디 = s.주문고객
			and x.제품번호 = s.주문제품;
    
    #ex) 고객 테이블과 주문 테이블을 이용하여, 고객이 주문한 주문내역을 고객아이디, 주문제품, 수량으로 표시
    select		고객아이디, 주문제품, 수량
    from		고객 a
				inner join 주문 b		#교집합
				on a.고객아이디 = b.주문고객;
    
    
    select		고객아이디, 주문제품, 수량
    from		고객 a
				left join 주문 b		#주문테이블 null값 채움
				on a.고객아이디 = b.주문고객;
    
    #위 검색 결과에서 모든 null값 제거, 고객별 수량 합계 표시
    select		고객아이디, sum(수량) as 총수량
    from		고객 a
				left join 주문 b
                on a.고객아이디 = b.주문고객
    where		b.주문고객 is not null
    group by	고객아이디;
    
    
    select	고객아이디, 주문제품, 수량
    from	고객 a
			right join 주문 b
            on a.고객아이디 = b.주문고객;
    
    #위 검색결과에서 고객아이디에 'o' 가 포함되고 총수량이 30이상인 고객이름
    
    select		고객아이디, 주문제품, 수량
    from		고객 a
				right join 주문 b
				on a.고객아이디 = b.주문고객
	where		고객아이디 like '%o%' and 수량 >=30
    group by	고객아이디;
    
	select		고객아이디, sum(수량) as 총수량
    from		고객
    group by	고객아이디
    order by	sum(수량) desc;
    
    set @rownum=0; #변수할당
    select @rownum := @rownum+1 as 'no', 고객아이디, 주문제품, 수량
    from 고객 a
		left join 주문 b
        on a.고객아이디 = b.주문고객;
    
    select	고객아이디 from 고객
    union all
    select 주문고객 from 주문;
    */
    
    
    
    /*
    #부속 질의문을 이용한 검색
    
    select	제품명, 단가
    from	제품
    where	제조업체 =( #한빛제과
			 select 제조업체
			 from	제품
			 where	제품명='달콤비스켓'
    );
    
    #판매 데이터베이스에서 적립금이 가장 많은 고객의 고객이름과 적립금을 검색해보자
    # 단일행(=) #
    select	고객이름, 적립금
    from	고객
    where	적립금 = ( #5000
					   select max(적립금) from 고객
	);
    
    select	고객이름, 적립금
    from	고객
    where	적립금 = (
					   select min(적립금) from 고객
	);
    
    # 판매 데이터베이스에서 banana 고객이 주문한 제품의 제품명과 제조업체 검색
    # in #
    select	제품번호, 제품명, 제조업체
    from	제품
    where	제품번호 in (
			select	주문제품
            from	주문
            where	주문고객 ='banana'
	);
    
    # 판매 데이터베이스에서 banana 고객이 주문하지 않은 제품의 제품명과 제조업체 검색
    # not in #
    select	제품번호, 제품명, 제조업체
    from	제품
	where	제품번호 not in (
			select	주문제품
			from	주문
            where	주문고객 ='banana'
);
    
    # 판매 데이터베이스에서 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체 검색
    # all #
    select	제품명, 단가, 제조업체
    from	제품
    where	단가 > all (
			select	단가
            from	제품
            where	제조업체 = '대한식품'
	);
    
    
    #판매 데이터베이스에서 2013년 3월 2일에 제품을 주문한 고객의 고객이름 검색
    # exists #
    select	고객이름
    from	고객 A
    where exists ( #김선우
					select 	*
					from 	주문 B
					where	B.주문일자 = '2013-03-02'
							and B.주문고객 = A.고객아이디
	);
    
    # 판매 데이터베이스에서 2013년 3월 2일에 제품을 주문하지 않은 고객의 고객이름 검색
    select	고객이름
    from	고객 A
    where not exists (
						select	*
                        from	주문 B 
                        where	B.주문일자 = '2013-03-02'
								and	B.주문고객 = A.고객아이디
	);
    
    */
    
    
    
    
    # update 문
    
    update	제품
    set		제품명 = '통큰파이'
    where	제품번호 = 'p03';
    
    update	제품
    set		단가 = 단가 * 1.1;

    update	주문
    set		수량 = 5
    where	주문고객 in (select 고객아이디
						 from	고객
                         where	고객이름 = '채광주');
    
    # delete 문
    
    delete	
    from	주문
    where	주문일자 = '2013-04-10';
    
    # 주문 테이블에서 주문일자가 2013년 3월 1~30일의 주문내역을 (검색)삭제 후
    # 다음 주문 테이블의 모든 내용 검색 삭제 여부 확인
    select	*
    from	주문
    #where	date(주문일자) ='2013-05-22';
    where	date(주문일자) between '2013-03-01' and '2013-03-30';
    
    delete
    from	주문
    where	date(주문일자) between '2013-03-01' and '2013-03-30';
    
    drop table	주문 cascade;
    drop table	제품 cascade;
    drop table	고객 cascade;
    
    
    
    select * from 주문;
    select * from 고객;
    select * from 제품;