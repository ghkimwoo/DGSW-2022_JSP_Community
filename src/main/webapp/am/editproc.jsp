<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.dg.board.Board"%>
<%@ page import="com.dg.board.BoardManager"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String content = request.getParameter("noticeDoc");
    String name = request.getParameter("name");

    BoardManager bm = new BoardManager();
    boolean success = bm.doupdate(id, title, content, name);
%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
    window.onload = function () {
        swal({
            title: '수정이 완료되었습니다.',
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
