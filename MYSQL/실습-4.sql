SELECT 
    *
FROM
    membertbl
WHERE
    memberNAme = '당탕이';

SELECT 
    *
FROM
    producttbl
WHERE
    productName = '냉장고';

#아래는 위의 쿼리문을 자주 쓰니깐 스토어드프로시져로
#만들었다. 물론 지금은 어렵다. 하지만 잠깐 살펴보면
#delimiter //는  원래 문장이 ;으로 끝이 나야하는것을
#잠시 실행동안 //로 바꾼다는 것이다.
#ㅣㅣ그리고 begin과 end사이의 내용을 실행하고 다시
#demliniter ; 로 하여 문장의 끝을 ;로 돌린다는 것이다.
#지금은 몰라도 좋으니, 그냥 대충 한번 보도록 하자.
delimiter //
create procedure myProc()
begin
	select *
		from membertbl
	where memberName ='당탕이';

	SELECT 
		*
		FROM
			producttbl
WHERE
    productName = '냉장고';
end//
delimiter ;
#위에 만든 내용을 호출해보겠다.
call myProc();
