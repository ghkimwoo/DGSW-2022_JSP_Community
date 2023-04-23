<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.dg.mbboard.Board" %>
<%@ page import="com.dg.mbboard.BoardManager" %>
<%@ page import="java.util.List" %><%
    BoardManager bm = new BoardManager();
    //out.println(list);
    String username = (String)session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <title>글 작성</title>
    <%@include file="../head.jsp"%>
</head>
<body>
<div class="container  mt-3">
    <form action="insertproc.jsp">
        <h1 class="bg-black text-white bg-opacity-75">
            작성
        </h1>
    <div class="row">
        <div class="col">
            제목
            <input class="form-control"type="text" name="title" id="title" placeholder="[필수]">
            내용
            <div class ='content'>
                <jsp:include page="note.jsp"/>
            </div>
            <input name="name" value="<%=username%>" hidden/>
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