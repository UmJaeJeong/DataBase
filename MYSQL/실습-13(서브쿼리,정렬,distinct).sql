
-- 서브쿼리는 쿼리문안에 또 쿼리가 있는 것을 의미한다.
-- 아래는 키가 177 초과되는 데이터를 출력한다.
-- 김경호의 키가 177을 알고 있을때 할 수 있는 쿼리문이다.
-- 그러나 몰랐을때는 어떻게 해야할까?
-- 이때 서브쿼리를 이용을 적절히 이용하면 된다.
select name, height
from usertbl
where height > 177;

-- 아래는 서버쿼리를 작성해서 위와 같이 동일한 결과를 출력한 것이다.
-- 실행순서는 먼저 서브쿼리가 실행되고 결과값이 나온것을 가지고 상위쿼리를 진행한다.
-- 서브쿼리의 값은 177인걸 알 수가 있다.
SELECT 
    name, height
FROM
    usertbl
WHERE
    height > (SELECT 
            height
        FROM
            usertbl
        WHERE
            name = '김경호');

-- 아래 쿼리문을 실행해 보면 에러가 발생한다. 이유가 뭘까?
-- 반드시 비교대상이 숫자 1개의 값이 나와야 되는데 서브쿼리를 따로 실행해보면 2개가 나오는것을 확인할수가 있다.
-- 그럼 비교가 되겠는가? 문법이 맞지 않는 것이다.
select name, height
from usertbl
where height > (select height from usertbl
            where addr = '경남');
                
-- 하여 위에 코드를 실행하고자 한다면 아래와 같이 쿼리를 작성한다.
-- any키워드를 이용하여 실행을 해보면 된다.
-- 서브쿼리의 값이 무엇이었나? 173, 170이었다. 서브쿼리 앞에 any의
-- 의미는 or와 비슷한 개념이라고 생각하자. 170 이거나 173이다. 즉 다시말해,
-- 170이상인 데이터를 다 출력하겠다는 의미가 되는것이다.
-- 기억할 것은 서브쿼리가 반환하는 값은 키라는 것이다.
select name, height, addr
from usertbl
where height > any (select height
               from usertbl
               where addr = '경남');

-- any와 동일한 기능을 하는 키워드중 하나가 some이다.
-- any나 some이나 똑같은 것이다.
select name, height, addr
from usertbl
where height > some (select height
               from usertbl
               where addr = '경남');

-- all은 서브쿼리의 결과 값 둘다 만족하는 데이터만 출력한다.
-- 즉, 다시말해 170, 173다 만족하는 값은 173인 것이다.
select name, height, addr
from usertbl
where height > all (select height
               from usertbl
               where addr = '경남');
#부등호를 바꾸면 170,173과 똑같은 결과값만 리턴하게 되어있다.
select name, height addr
	from usertbl
    where height = any (select height
							from usertbl
                            where addr ='경남');
                            
#또한 위와 똑같은 결과를 얻고자 한다면, 앞에서 배운 in을 사용하면
#쉽게 해결된다.
select name, height addr	
	from usertbl
    where height in (select height
						from usertbl
                        where addr='경남');
