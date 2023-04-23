<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.dg.board.Board"%>
<%@ page import="com.dg.board.BoardManager"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%
    String title = request.getParameter("title");
    String name = request.getParameter("name");
    String content = request.getParameter("noticeDoc");

    Board board = new Board();
    board.setTitle(title);
    board.setContent(content);
    board.setName(name);
    if (title.length() == 0){
%>
<script>
    window.onload = function () {
        swal({
            title: '등록에 실패했습니다.',
            text: '제목이 없습니다.',
            icon: 'error',
            closeOnClickOutside: false,
            buttons: {
                confirm: {
                    text: '확인',
                    value: true,
                    className: 'btn btn-outline-primary'
                }
            }
        }).then((result) => {
            if (result) {
                location.href = 'insert.jsp';
            }
        });
    }
</script>
<%
    }else{
    BoardManager bm = new BoardManager();
    boolean success = bm.doinsert(board);
    if(success){
%>
<script>
    window.onload = function () {
        swal({
            title: '등록이 완료되었습니다.',
            text: '글 목록으로 돌아갑니다.',
            icon: 'info',
            closeOnClickOutside: false,
            buttons: {
                confirm: {
                    text: '확인',
                    value: true,
                    className: 'btn btn-outline-primary'
                }
            }
        }).then((result) => {
            if (result) {
                location.href = 'board.jsp?page=1';
            }
        });
    }
</script>
<%}}%>