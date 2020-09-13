insert into memberTBL values('Figure', '연아', '경기도 군포시 당정동');

select * from memberTBL;

update memberTBL set memeberaddress='서울 강남구 역삼동' where memberName='연아';

delete from memberTBL where membername='연아';

create table deletedMemberTBL(
    memberID char(8),
    memername nchar(5),
    memberaddress nvarchar2(20),
    deletedDate date --삭제한 날짜
);

create trigger trg_deleteMemberTBL --트리거 이름
    after delete --삭제후에 작동하게 지정
    on memberTBL --트리거를 부착할 테이블
    for each row --각 행마다 적용됨
begin
    -- : old 테이블의 내용을 백업 테이블에 삽입
    insert into deletedMemberTBL
    values(:old.memberID, :old.memberName, :old.memberaddress, sysdate());
end;

select * from memberTBL;

delete from memberTBL where memberName='당탕이';

select * from deletedMemberTBL;
