<%--
  Created by IntelliJ IDEA.
  User: KRKimwoo
  Date: 2022-04-27
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.encryption.MemberDB" %>
<%@ page import="java.net.URLEncoder" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String Errortitle = URLEncoder.encode("회원가입 오류", "UTF-8");
    String Errorinfo = URLEncoder.encode("아이디가 중복됩니다!", "UTF-8");


    MemberDB md = new MemberDB();

    if(md.doIdCheck(username) == 0){
%>
<jsp:include page="alerthead.jsp" flush="true">
    <jsp:param name="title" value="<%=Errortitle%>"/>
    <jsp:param name="info" value="<%=Errorinfo%>"/>
    <jsp:param name="location" value="../insert.jsp"/>
</jsp:include>
<%
    }else{
        md.doinsert(username, password, gender);
        response.sendRedirect("../index.jsp");
    }
%>
