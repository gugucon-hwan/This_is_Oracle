insert into memberTBL values('Figure', '����', '��⵵ ������ ������');

select * from memberTBL;

update memberTBL set memeberaddress='���� ������ ���ﵿ' where memberName='����';

delete from memberTBL where membername='����';

create table deletedMemberTBL(
    memberID char(8),
    memername nchar(5),
    memberaddress nvarchar2(20),
    deletedDate date --������ ��¥
);

create trigger trg_deleteMemberTBL --Ʈ���� �̸�
    after delete --�����Ŀ� �۵��ϰ� ����
    on memberTBL --Ʈ���Ÿ� ������ ���̺�
    for each row --�� �ึ�� �����
begin
    -- : old ���̺��� ������ ��� ���̺� ����
    insert into deletedMemberTBL
    values(:old.memberID, :old.memberName, :old.memberaddress, sysdate());
end;

select * from memberTBL;

delete from memberTBL where memberName='������';

select * from deletedMemberTBL;
