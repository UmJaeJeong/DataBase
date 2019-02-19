#membertbl테이블에 하나의 데이터 삽입하는 코드
insert into membertbl values('Figure','연아','경기도 군포시');

update membertbl
set memberAdress = '대구 달성군'
where memberName = '연아';

#membertbl테이블에서 '연아'인것만 삭제하라라는 쿼리문
delete from membertbl
where memberName = '연아';

desc membertbl;

select *
from membertbl;

#아래 쿼리문 deletedMemberTBL테이블을 직접 코드로 만드는 것이다.
#아직은 몰라도 좋다. 뒷자에서 배운다.
create table deleteMemberTBL(
	memberID char(8),
    memberName char(5),
    memebrAddress char(20),
    deleteDate date
);

#아래 코드는 간단하게 trigger를 작성한 것이다. 어차피 뒤에서 배우겠지만
#간단히 설명하면, trg_deletedMemberTBL트리거를 만들어라
#어떻게? memberTNL에서 delete라는 명령어가 실행되면, 삭제된 행(데이터)에
#대해서 deletedmembertbl에 데이터를 삽입해라는 내용이다.
#curdate() 지금(now)의 시각과 날짜를 부르는 함수이다.
#old는 삭제된 이전 즉, 오래된(삭제된)이라는 뜻이다.
delimiter //
create trigger trg_deletedMemberTBL #트리거 이름
after delete #삭제후
on membertbl
for each row	#각 행에 적용함
begin
#old는 삭제된 데이터를 의미함
insert into deleteMemberTBL
values(old.memberID, old.memberName, old.memberAdress, curdate()
);
end //
delimiter ;

select *
from membertbl;


#아래의 delete명령어르 사용하면, 자동으로 위에서 만든 trigger이
#실행된다
delete from membertbl
where memberName='신동욱';

#trigger가 실행되었다면, 당연히 deltedmembertbl에 데이터가 삽입되었을 것이다.
select *
from deletedmembertbl;

delete from deletedmembertbl;
truncate deltedmembertbl;
