<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.encryption.MemberDB" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    MemberDB md = new MemberDB();
    md.doinfoupdate(username,password,gender);
    response.sendRedirect("../index.jsp");
%>
