<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.dg.board.Board" %>
<%@ page import="com.dg.board.BoardManager" %>
<%@ page import="java.util.List" %><%
    String idx = request.getParameter("idx");
    BoardManager bm = new BoardManager();
    Board board = bm.doselectrow(Integer.parseInt(idx));
%>
<!DOCTYPE html>
<html>
<head>
    <title>수정</title>
    <%@include file="../head.jsp"%>
</head>
<body>
<div class="container  mt-3">
    <form action="editproc.jsp">
        <h1 class="bg-black text-white bg-opacity-75">
            수정
        </h1>
        <div class="row">
            <div class="col">
                <input name="id" value="<%=board.getIdx()%>" hidden/>
                제목
                <input class="form-control"type="text" name="title" value="<%=board.getTitle()%>">
                내용
                <div class ='content'>
                    <jsp:include page="note.jsp"/>
                </div>
                작성자
                <input class="form-control"type="text" name="name" value="<%=board.getName()%>"\>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <input class="btn btn-primary" type="submit" value="저장">
            </div>
        </div>
    </form>
</div>

</body>
</html>