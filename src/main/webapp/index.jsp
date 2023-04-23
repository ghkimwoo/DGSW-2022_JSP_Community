<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.dg.board.BoardManager" %>
<%
    BoardManager bm = new BoardManager();

%>
<!DOCTYPE html>
<html>
<head>
    <title>메인페이지</title>
    <%@ include file="head.jsp"%>
    <script>
        $(document).ready( function(){
            $('#mybtn').on('click', function(){
                $('#mys').slideToggle();
            });
        } )
    </script>
</head>
<body>
<%@ include file="nav.jsp"%>
<div class="container mt-3">
    <h1 class="bg-black text-white text-center" id="myh1">
        메인페이지(내용 없음)
    </h1>
</div>
</body>
</html>