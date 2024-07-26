--�Խ���(�Խñ� ��ȣ, ����, ����, �ۼ���, �ۼ��Ͻ�, ��ȸ��)
create table tbl_board (
    board_no number,
    title    varchar2(100) not null,
    content  varchar2(500) not null,
    writer   varchar2(100) not null,
    write_date  date default sysdate,
    view_cnt  number default 0
);

create sequence board_seq;
alter table tbl_board add constraint board_pk primary key(board_no);



drop table tbl_board;
drop sequence board_seq;

--user01 ���� ��ս��ϴ�/ html,jsp�����ϰ� �����ϴ�.
insert into tbl_board (board_no, 
                       writer,
                       title,
                       content)
values(board_seq.nextval, 
       'user01',
       '���� ��ս��ϴ�.',
       'html,jsp�����ϰ� �����ϴ�.');
            

insert into tbl_board (board_no, 
                       writer,
                       title,
                       content)
values(board_seq.nextval, 
       'chacha',
       'java�� ���',
       'java�� �����ϴ�.');  

insert into tbl_board (board_no, 
                       writer,
                       title,
                       content)
values(board_seq.nextval, 
       'test',
       '�۾��� �׽�Ʈ',
       '�߽����ϴ�');  

insert into tbl_board (board_no, 
                       writer,
                       title,
                       content)
values(board_seq.nextval, 
       'user02',
       'javascript ����',
       '���� �����ϴ�.');  
       
select * from tbl_board;
0
/////////////////////   7/19 00000000000000000000000000000000000000000000000000000000000000000000000
select * from tbl_member where responsibility = 'User';


select * from tbl_board order by board_no;


insert into tbl_board (board_no, writer, title, content)
select board_seq.nextval, writer, title, content
from tbl_board;


--����¡. ��µǴ� �����Ͱ� ������ �� �������� 5���� ���� �������� ������ �����ֱ�.
-- 1) �������� 5�Ǿ� �������� ����
-- 2) ��ü�Ǽ�/5�� -> ��ü �������� ���


select b.*
from    (select rownum rn, a.* 
        from    (select * 
                from tbl_board 
                order by board_no ) a ) b
where b.rn > (:page - 1) *5
and b.rn <= (:page *5) 
;



select b.*
from    (select rownum rn, a.*
        from (select *
            from tbl_board b
            where
            <choose>
                <when test=""></when>
                <when test=""></when>
                <when test=""></when>
                <otherwise></otherwise>
            </choose>
            order by board_no)a)b
where

select *
from tbl_board b
where title like '%java%';

select *
from tbl_board b
where writer like '%cha%'
and title like '%java%'
select b.* from (select rownum rn, a.* from 
            (select * from tbl_board order by board_no ) a ) b 
            where title like '%'|| 'java' || '%' order by board_no ) a ) b 
    where b.rn > (1 -1) * 5 and b.rn <=(1 *5));
    
--����� ���̺�(���̵�, ��й�ȣ, ȸ���̸�, ����

CREATE TABLE tbl_member (
  member_id varchar2(30) primary key,
  member_pw varchar2(10) not null,
  member_nm varchar2(50) not null,
  responsibility varchar2(10) default 'User' -- 'Admin'
);

insert into tbl_member (member_id, 
                        member_pw,
                        member_nm)
values ('user01',
        '1111',
        'ȫ�浿');
insert into tbl_member (member_id, 
                        member_pw,
                        member_nm)
values ('user02',
        '2222',
        '�ǹμ�');
insert into tbl_member (member_id, 
                        member_pw,
                        member_nm)
values ('chacha',
        '1111',
        '������');
        
alter table tbl_board add image varchar2(100);  

-------------------------------------------------7/26 sql(���) ----------------------------------------------------------      
-- ��� (��۹�ȣ, �۳���, �ۼ���, �ۼ��Ͻ�, �����۹�ȣ)
create table tbl_reply (
 reply_no number,
 reply_content varchar2(300) not null,
 replyer varchar2(10) not null,
 reply_date date default sysdate,
 board_no number not null
);

create sequence reply_seq;

alter table tbl_reply add constraint reply_pk primary key(reply_no);

--user01    148�� ��۵�� "��� �ߺý��ϴ�." ���

insert into tbl_reply (reply_no,
                       reply_content,
                       replyer,
                       board_no)
values        (reply_seq.nextval, 
               '��� �ߺý��ϴ�',
               'user01',
               148);
               
insert into tbl_reply (reply_no,
                       reply_content,
                       replyer,
                       board_no)
values        (reply_seq.nextval, 
               '���� ��� �ߺý��ϴ�',
               'user02',
               148);
               
insert into tbl_reply (reply_no,
                       reply_content,
                       replyer,
                       board_no)
values        (reply_seq.nextval, 
               '��� �ߺý��ϴ�',
               'user01',
               147);
               
insert into tbl_reply (reply_no,
                       reply_content,
                       replyer,
                       board_no)
values        (reply_seq.nextval, 
               '���� ��� �ߺý��ϴ�',
               'user02',
               147);
               
--��� ��� ����
select * 
from tbl_reply
where board_no = 147
order by reply_no;

-- ��� �ø���

select reply_seq.nextval
from tbl_reply
where board_no = 651;

--��� ����
delete from tbl_reply
where reply_no = 4;

select /*+ INDEX_DESC (r reply_pk) */ rownum rn, r.*
from tbl_reply r;

select b.*
from    (select /*+ INDEX_DESC (r reply_pk) */ rownum rn, r.*
        from tbl_reply r ) b
where   b.rn > (:page - 1) * 5
and     b.rn <= (:page *5);