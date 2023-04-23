<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="member.encryption.MemberDB"%>
<%@ page import="member.encryption.Member" %>
<%@ page import="java.net.http.HttpResponse" %>
<%
    MemberDB md = new MemberDB();
    List<Member> list = md.doselect();
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>관리자 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<% String username = (String)session.getAttribute("username");
    if( username != null && username.equals("admin")){%>
<div class="container">
<h1>회원 설정</h1>

<form action="delete.jsp">
    <table class="table table-striped">
        <tr>
            <th></th><th>순번</th><th>이름</th><th>비번</th><th>성별</th>
        </tr>
        <%
            for(int i =0; i< list.size(); i++){
                Member member = list.get(i);
        %>
        <tr>
            <td> <input type="checkbox" name="id" value="<%=member.getId()%>" /> </td>
            <td> <%=member.getId()%> </td>
            <td><a href="update.jsp?id=<%=member.getId()%>&username=<%=member.getUsername()%>"><%=member.getUsername()%></a></td>
            <td> <%=member.getPassword()%> </td>
            <td> <%=member.getGender()%> </td>
        </tr>
        <%
            }
        %>
    </table>
    <input type="submit" value="삭제" class="btn btn-default pull-right"/>
</form>
</div>
<% }else{
    ((HttpServletResponse) response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
}
%>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Noto Sans KR", sans-serif;
    }

</style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>