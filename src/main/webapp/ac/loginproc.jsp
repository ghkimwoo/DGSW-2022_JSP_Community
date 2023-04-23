<%@ page import="member.encryption.MemberDB" %><%--
  Created by IntelliJ IDEA.
  User: KRKimwoo
  Date: 2022-05-11
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String Errortitle = URLEncoder.encode("로그인 실패", "UTF-8");
    String Errorinfo = URLEncoder.encode("아이디 또는 비밀번호가 없거나 틀렸습니다.", "UTF-8");

    MemberDB memberDB = new MemberDB();
    boolean loginck = memberDB.dologinchk(username, password);

    if(loginck){
        System.out.println("성공");
        session.setAttribute("username", username);
        response.sendRedirect("../index.jsp");
    }else{
%>
<jsp:include page="alerthead.jsp" flush="true">
    <jsp:param name="title" value="<%=Errortitle%>"/>
    <jsp:param name="info" value="<%=Errorinfo%>"/>
    <jsp:param name="location" value="login.jsp"/>
</jsp:include>
<%
    }
%>
