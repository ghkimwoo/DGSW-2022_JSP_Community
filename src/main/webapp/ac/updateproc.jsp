<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.encryption.MemberDB" %>
<%@ page import="java.net.URLEncoder" %>
<%
    String id = request.getParameter("id");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String Errortitle = URLEncoder.encode("수정 실패", "UTF-8");
    String Errorinfo = URLEncoder.encode("아이디가 중복됩니다!", "UTF-8");
    MemberDB md = new MemberDB();
        md.doupdate(username,password,gender,id);
        response.sendRedirect("userlist.jsp");

%>