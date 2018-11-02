use example;

create table 회원(
	회원아이디 varchar(10) not null,
    비밀번호 int not null,
    이름 varchar(10) not null,
    나이 int,
    직업 char(7) not null default '-없음-',
    등급 char(10) not null default 'sliver',
    적립금 int not null default 0,
    primary key (회원아이디),
    check (나이>0),
	check (적립급>=0),
    check (등급 in('sliver','gold','vip','vvip'))
);

create table 제조업체(
	제조업체명 varchar(10) not null,
    전화번호 varchar(15),
    위치 varchar(7),
    담당자 char(8),
    primary key(제조업체명)
);

create table 게시글(
	글번호 int not null,
    작성자 varchar(10) not null,
    글제목 varchar(10) not null,
    글내용 varchar(50) not null default '내용을 입력하지 않았습니다.',
    작성일자 char(8) not null  default '-/-/-',
    primary key (글번호),
	foreign key (작성자) references 회원(회원아이디) on delete cascade on update cascade
);

create table 상품(
	상품번호 varchar(10) not null,
    상품명 char(10) not null,
    재고량 int not null default 0,
    단가 int not null default 0,
    제조사 varchar(10) not null,
    공급일자 varchar(10),
    공급량 int not null default 0,
    primary key (상품번호),
    foreign key(제조사) references 제조업체(제조업체명) on delete cascade on update cascade,
    check (재고량>=0),
    check (단가>=0),
    check (공급량 >=0)
);

create table 주문(
	주문번호 varchar(10) not null,
    주문고객 varchar(10) not null,
    주문상품 varchar(10) not null,
    주문수량 int not null default 0,
    배송지 varchar(8) not null,
    주문일자 varchar(7) not null,
    primary key (주문번호),
    foreign key(주문고객) references 회원(회원아이디) on delete no action on update no action,
	foreign key(주문상품) references 상품(상품번호) on delete cascade on update cascade,
    check (주문수량>=0)
);



drop table 게시글;