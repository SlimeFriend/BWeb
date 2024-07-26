--게시판(게시글 번호, 제목, 내용, 작성자, 작성일시, 조회수)
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

--user01 웹은 재밌습니다/ html,jsp공부하고 좋습니다.
insert into tbl_board (board_no, 
                       writer,
                       title,
                       content)
values(board_seq.nextval, 
       'user01',
       '웹은 재밌습니다.',
       'html,jsp공부하고 좋습니다.');
            

insert into tbl_board (board_no, 
                       writer,
                       title,
                       content)
values(board_seq.nextval, 
       'chacha',
       'java도 잼따',
       'java도 좋습니다.');  

insert into tbl_board (board_no, 
                       writer,
                       title,
                       content)
values(board_seq.nextval, 
       'test',
       '글쓰기 테스트',
       '잘써집니다');  

insert into tbl_board (board_no, 
                       writer,
                       title,
                       content)
values(board_seq.nextval, 
       'user02',
       'javascript 좋음',
       '진자 좋습니다.');  
       
select * from tbl_board;
0
/////////////////////   7/19 00000000000000000000000000000000000000000000000000000000000000000000000
select * from tbl_member where responsibility = 'User';


select * from tbl_board order by board_no;


insert into tbl_board (board_no, writer, title, content)
select board_seq.nextval, writer, title, content
from tbl_board;


--페이징. 출력되는 데이터가 많으면 한 페이지에 5개씩 여러 페이지에 나눠서 보여주기.
-- 1) 페이지당 5건씩 가져오는 쿼리
-- 2) 전체건수/5건 -> 전체 페이지를 계산


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
    
--사용자 테이블(아이디, 비밀번호, 회원이름, 권한

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
        '홍길동');
insert into tbl_member (member_id, 
                        member_pw,
                        member_nm)
values ('user02',
        '2222',
        '권민석');
insert into tbl_member (member_id, 
                        member_pw,
                        member_nm)
values ('chacha',
        '1111',
        '김차차');
        
alter table tbl_board add image varchar2(100);  

-------------------------------------------------7/26 sql(댓글) ----------------------------------------------------------      
-- 댓글 (댓글번호, 글내용, 작성자, 작성일시, 원본글번호)
create table tbl_reply (
 reply_no number,
 reply_content varchar2(300) not null,
 replyer varchar2(10) not null,
 reply_date date default sysdate,
 board_no number not null
);

create sequence reply_seq;

alter table tbl_reply add constraint reply_pk primary key(reply_no);

--user01    148번 댓글등록 "댓글 잘봤습니다." 등록

insert into tbl_reply (reply_no,
                       reply_content,
                       replyer,
                       board_no)
values        (reply_seq.nextval, 
               '댓글 잘봤습니다',
               'user01',
               148);
               
insert into tbl_reply (reply_no,
                       reply_content,
                       replyer,
                       board_no)
values        (reply_seq.nextval, 
               '저도 댓글 잘봤습니다',
               'user02',
               148);
               
insert into tbl_reply (reply_no,
                       reply_content,
                       replyer,
                       board_no)
values        (reply_seq.nextval, 
               '댓글 잘봤습니다',
               'user01',
               147);
               
insert into tbl_reply (reply_no,
                       reply_content,
                       replyer,
                       board_no)
values        (reply_seq.nextval, 
               '저도 댓글 잘봤습니다',
               'user02',
               147);
               
--댓글 목록 보기
select * 
from tbl_reply
where board_no = 147
order by reply_no;

-- 댓글 늘리기

select reply_seq.nextval
from tbl_reply
where board_no = 651;

--댓글 삭제
delete from tbl_reply
where reply_no = 4;

select /*+ INDEX_DESC (r reply_pk) */ rownum rn, r.*
from tbl_reply r;

select b.*
from    (select /*+ INDEX_DESC (r reply_pk) */ rownum rn, r.*
        from tbl_reply r ) b
where   b.rn > (:page - 1) * 5
and     b.rn <= (:page *5);