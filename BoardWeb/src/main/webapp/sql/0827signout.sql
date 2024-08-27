-- chacha 회원탈퇴(삭제)를 위한 제거 순서(foreign key 제약조건으로 인함)
-- chacha => tbl_reply < tbl_board < tbl_member 
-- sign_out_proc(p_member_id, p_ret_code, p_ret_msg);



select count(1)
from avg_employees;

--회원테이블
select *
from tbl_member;

--게시글 테이블

alter table tbl_board 
    add constraint fk_member_id foreign key(writer) references tbl_member(member_id);


select *
from tbl_board
where writer = 'chacha'
;

--댓글 테이블
select *
from tbl_reply
where replyer = 'chacha'
;

insert into tbl_reply(reply_no, reply_content, replyer, board_no)
values (reply_seq.nextval, 'test', 'user01', 645);
                

alter table tbl_reply
    add constraint fk_board_no foreign key(board_no) references tbl_board(board_no);