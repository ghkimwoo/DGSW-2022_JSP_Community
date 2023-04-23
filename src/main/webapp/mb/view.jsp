<%@ page import="com.dg.mbboard.BoardManager" %>
<%@ page import="com.dg.mbboard.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  String idx = request.getParameter("idx");
  BoardManager bm = new BoardManager();
  Board board = bm.doselectrow(Integer.parseInt(idx));
  bm.click(board.getCount(), board.getIdx());
  String viewer = (String)session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Title</title>
  <%@include file="../head.jsp"%>
</head>
<body>
<%@include file="../nav.jsp"%>
<div class="container mt-3">
  <h3 class="bg-info text-white text-end">
    조회수 : <%=board.getCount()%> | 작성일 : <%=board.getWdate()%>
  </h3>
  <div class="row">
    <div class="col">
      제목
      <div class="border border-secondary p-3 rounded"><%=board.getTitle()%></div>
      내용
      <div class="border border-secondary p-3" style="height: auto; min-height: 200px;"><%out.println(board.getContent());%></div>
      작성자
      <div class="border border-secondary p-3 rounded"><%=board.getName()%></div>
    </div>
  </div>
  <% if(viewer.equals(board.getName()) || viewer.equals("admin")){%>
  <div class="row mt-3 mb-3">
    <div class="col">
      <a class="btn btn-primary" href="edit.jsp?idx=<%=board.getIdx()%>">글수정</a>
      <a class="btn btn-primary" href="delete.jsp?idx=<%=board.getIdx()%>">글삭제</a>
    </div>
  </div>
  <%}%>
</div>
</body>
</html>