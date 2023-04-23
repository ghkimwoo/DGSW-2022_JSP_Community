<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.dg.board.Board" %>
<%@ page import="com.dg.board.BoardManager" %>
<%@ page import="java.util.List" %><%
    BoardManager bm = new BoardManager();
    int page1 = Integer.parseInt(request.getParameter("page"));
    List<Board> list = bm.doselect(page1);

    //캐시를 강제 삭제하여 메인 페이지의 데이터를 갱신시킴
    response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    response.setHeader("Pragma", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
    <title>글 목록</title>
    <%@include file="/head.jsp"%>
</head>
<body>
<%@include file="../nav.jsp"%>
<div class="container  mt-3">
    <h3 class="bg-black p-2 text-white bg-opacity-75">익명게시판  |  <small class="text-muted">기록이 남지 않습니다.</small> </h3>
    <div class="row">
        <div class="col">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">순번</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                </tr>
                </thead>
                <tbody>
                <% for(int i =0; i<list.size(); i++) {
                    Board board = list.get(i);
                %>
                <tr>
                    <th scope="row"><%=board.getIdx()%></th>
                    <td><a href="view.jsp?idx=<%=board.getIdx()%>"><%=board.getTitle()%></a></td>
                    <td><%=board.getName()%></td>
                    <td><%=board.getWdate()%></td>
                    <td><%=board.getCount()%></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <a class="btn btn-primary" href="insert.jsp">글쓰기</a>
        </div>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
    <%
        for(int i = 1; i <= (bm.next()/10) + 1; i++){%>
        <li class="page-item"><a class="page-link" href="board.jsp?page=<%=i%>"><%=i%></a></li>
    <%}%>
        </ul>
    </nav>
</div>
</body>
</html>
