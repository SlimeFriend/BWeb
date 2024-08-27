CREATE OR REPLACE PROCEDURE sign_out_proc (
    p_member_id IN VARCHAR2,
    p_ret_code OUT VARCHAR2,
    p_ret_msg  OUT VARCHAR2
) AS
    v_count NUMBER := 0;
BEGIN
    -- 작성댓글 삭제.
    delete from tbl_reply
    where replyer = p_member_id;
    
    -- 작성글 삭제.
    --delete from tbl_board
    --where writer = p_member_id;
    
    -- tbl_board 글 삭제. 댓글 여부 확인 후 존재 시 댓글 선 삭제.
    for r_board in (select board_no
                    from tbl_board
                    where writer = p_member_id) loop
        -- 댓글여부 확인
        select count(1)
        into v_count
        from tbl_reply
        where board_no = r_board.board_no;
        
        if v_count > 0 then
            delete from tbl_reply
            where board_no = r_board.board_no;
        end if;
        delete from tbl_board
        where board_no = r_board.board_no;
           
    end loop;
    
    
    -- 회원테이블 삭제(회원 탈퇴)
    delete from tbl_member
    where member_id = p_member_id;
    
    p_ret_code := 'OK';
    p_ret_msg := '회원탈퇴 완료';

EXCEPTION
    when others then
        p_ret_code := 'NG';
        p_ret_msg := sqlerrm;
        
END sign_out_proc;