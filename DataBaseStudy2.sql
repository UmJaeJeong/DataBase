/*
create table	고객(
		고객아이디 varchar(20),
        고객이름 varchar(10),
        나이 	 int,
        등급	 varchar(10),
		직업	 varchar(10),
        적립금 	 int,
        primary key(고객아이디)
	);
    
    
    CREATE TABLE 제품(
		제품번호 CHAR(3) NOT NULL,
		제품명 VARCHAR(20),
		재고량 INT,
		단가 INT,
		제조업체 VARCHAR(20),
    primary key(제품번호)
    );
    
    create table	주문(
		주문번호 char(3),
        주문고객 varchar(20),
		주문제품 char(3),
        수량	 int,
        배송지	 varchar(30),
        주문일자 datetime,
        primary key(주문번호),
        foreign key(주문고객) references 고객(고객아이디),
        foreign key(주문제품) references 제품(제품번호)
    );
    
    insert
    into	고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    values	('strawberry', '최유경', 30, 'vip', '공무원', 100);
    
    insert into 고객 values	('apple', '정소화', 20, 'gold', '학생', 1000);
    insert into	고객 values	('banana', '김선우', 25, 'vip', '간호사', 2500);
	insert into 고객 values ('carrot', '고명석', 28, 'gold', '교사', 4500);
    insert into 고객 values ('orange', '김용욱', 22,'silver', '학생', 0);
    insert into 고객 values ('melon', '성원용', 35, 'gold', '회사원', 5000);
    insert into 고객 values ('pear', '채광주', 31, 'silver', '회사원', 500);
    insert into 고객 values ('peach', '오형준', NULL, 'silver', '의사', 300);

    insert
    into	제품(제품번호, 제품명, 재고량, 단가, 제조업체)
    values	('p01', '그냥만두', 5000, 4500, '대한식품');
    
	insert into 제품 values ('p02', '매운쫄면', 2500, 5500, '민국푸드');
    insert into 제품 values ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
    insert into 제품 values ('p04', '맛난초콜렛', 1250, 2500, '한빛제과');
    insert into 제품 values ('p05', '얼큰라면', 2200, 1200, '대한식품');
    insert into 제품 values ('p06', '통통우동', 1000, 1550, '민국푸드');
    insert into 제품 values ('p07', '달콤비스켓', 1650, 1500, '한빛제과');
    
    insert
    into	주문(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    values	('o01', 'apple', 'p03', 10, '서울시 마포구', '13/01/01');
    insert into 주문 values ('o02', 'melon', 'p01', 5, '인천시 계양구', '13/01/10');
    insert into 주문 values ('o03', 'banana', 'p06', 45, '경기도 부천시', '13/01/11');
    insert into 주문 values ('o04', 'carrot', 'p02', 8, '부산시 금정구', '13/02/01');
    insert into 주문 values ('o05', 'melon', 'p06', 36, '경기도 용인시', '13/02/20');
    insert into 주문 values ('o06', 'banana', 'p01', 19, '충청북도 보은군', '13/03/02');
    insert into 주문 values ('o07', 'apple', 'p03', 22, '서울시 영등포구', '13/03/15');
    insert into 주문 values ('o08', 'pear', 'p02', 50, '강원도 춘천시', '13/04/10');
    insert into 주문 values ('o09', 'banana', 'p04', 15, '전라남도 목포시', '13/04/11');
    insert into 주문 values ('o10', 'carrot', 'p03', 20, '경기도 안양시', '13/05/22');
    */
    
    /*
    update	고객
    set		고객이름 = '최종원'
    where 	고객이름 = '정소화';
    
    update	고객
    set		등급 = 'vip'
    where	고객아이디 = 'apple';
    
    */
    
    
    select	고객아이디, 고객이름, 등급
    from	고객;
    
    select	고객아이디, 고객이름, 나이, 등급, 직업, 적립금
    from	고객;
    
    select	*
    from	고객;
    
    select	제조업체
    from	제품;
    
    select count(distinct 제조업체) as 제조업체수
    from			제품;
    
    select	제품명, 단가 as 가격
    from	제품;
    
    select	제품명, 단가 + 500 as 조정단가
    from	제품;
    
    select	제품명, 재고량, 단가
    from	제품
    where	제조업체 = '한빛제과';
    
    select	주문제품, 수량, 주문일자
    from	주문
    where	주문고객 = 'apple' and 수량 >=15;
    
    select	주문제품, 수량, 주문일자, 주문고객
    from	주문
    where	주문고객 = 'apple' or 수량 >=15;
    
    select	제품명, 단가, 제조업체
    from	제품
    where	단가 >=2000 and 단가 <=3000;
    
    select	제품명, 단가, 제조업체
    from	제품
    where	단가 between 2000 and 3000;
    
    select	고객이름, 나이, 등급, 적립금
    from	고객
    where	고객이름 like '김%';
    
    select	고객아이디, 고객이름, 등급
    from	고객
    where	고객아이디 like '_____';
    
    select	*
    from	고객
    where	고객아이디 like '%e%';
    
    select	고객이름
    from	고객
    where	나이 is null;
    
    select	고객이름
    from	고객
    where	나이 is not null;
    
    select		고객이름, 등급, 나이
    from		고객
    order by	나이 desc;
    
    select		주문고객, 주문제품, 수량, 주문일자
    from		주문
    where		수량 >=10
    order by	주문제품 asc, 수량 desc;
    
    select	*, avg(단가)
    from	제품;
    
    select	sum(재고량) as '재고량 합계'
    from	제품
    where	제조업체 = '한빛제과';
    
    select		주문제품, sum(수량) as 총주문수량
    from		주문
    group by	주문제품;
    
    select		제조업체, count(*) as 제품수, max(단가) as 최고가, round(avg(단가)) as 평균가
    from		제품
    group by	제조업체;
    
    select		제조업체, count(*) as 제품수, min(단가) as 최저가
    from		제품
	group by	제조업체;
    
	select		제조업체, count(*) as 제품수, max(단가) as 최고가
    from		제품
    group by	제조업체 having count(*) >=3;
    
    select		등급, count(*) as 고객수, avg(적립금) as 평균적립금
    from		고객
    group by	등급 having avg(적립금) >=1000;
    
    select		주문제품, 주문고객, sum(수량) as 총주문수량
    from		주문
    group by	주문제품, 주문고객;
    
    select	제품.제품명
    from	제품, 주문
    where	주문.주문고객 = 'banana' and 제품.제품번호 = 주문.주문제품;
    
    select 	제품.제품명
    from	제품 a
			inner join 주문 b
			on a.고객아이디 = b.주문고객;
            
            
     create view	우수고객(고객아이디, 고객이름, 나이, 등급)
     as select	고객아이디, 고객이름, 나이, 등급
		from	고객
		where	등급 ='vip' #and 나이 >20
     with check option;
     # ☞ 뷰에 삽입이나 수정시 제약조건 지정
    
    # 뷰 삭제 = drop view 우수고객; 
    
    insert into 우수고객(고객아이디, 고객이름, 나이, 등급)
    values('Kim2', '킴샘2', 19, 'gold');
    
    insert into 우수고객(고객아이디, 고객이름, 나이, 등급)
    values('Lee2', '이샘2', 21, 'vip');
    
    create view	업체별제품수(제조업체, 제품수)
    as select	제조업체, count(*)
    from		제품
    group by	제조업체;
    
    select * from 우수고객 where 나이>=20;
 
	create view	제품1
    as select	제품번호, 재고량, 제조업체
    from	제품
    with check option;
    
    select * from 제품1;
    
    insert into	제품1 values('p08', 1000, '신선식품');
 
	create view	제품2
    as select 	제품명, 재고량, 제조업체
    from	제품
    with check option;
    
    insert into	제품2 values('시원냉면', 1000, '신선식품'); # 삽입연산실패 - 제품번호 속성을 기본키로 지정하였기 때문에 제품번호 속성은 널값을 가질 수 없다
 
	select * from 제품2;
 
    select * from 업체별제품수;
    select * from 우수고객;
    select * from 고객;
    select * from 제품;
    select * from 주문;
    
    
    select 고객이름, 주문제품, 수량	
    from 고객 c	
    inner join     주문 o	
    on c.고객아이디 = o.주문고객	
    where c.고객아이디 = 'banana';p
    
    
    
    
  select 고객이름, 주문제품, 수량, 주문번호, 주문일자	from 고객 c	inner join 주문 o	
  on c.고객아이디 = o.주문고객	inner join 제품  p	on p.제품번호 = o.주문제품
  where c.고객아이디 = 'banana'	and o.주문제품  ='p06'	and o.주문번호 not in ('o06')	
  and o.주문제품 like '%4'
    
    
    
    String 