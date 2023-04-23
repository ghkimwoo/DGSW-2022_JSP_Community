<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.encryption.MemberDB" %>
<%@ page import="java.net.URLEncoder" %>
<%
    String username = (String) session.getAttribute("username");
    String Errortitle = URLEncoder.encode("탈퇴 실패", "UTF-8");
    String Errorinfo = URLEncoder.encode("관리자 계정은 탈퇴할 수 없습니다!", "UTF-8");
    try{
        if(username == null){
            ((HttpServletResponse) response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
        }if(username.equals("admin")){%>
<jsp:include page="alerthead.jsp" flush="true">
    <jsp:param name="title" value="<%=Errortitle%>"/>
    <jsp:param name="info" value="<%=Errorinfo%>"/>
    <jsp:param name="location" value="../index.jsp"/>
</jsp:include>
<%
        }
        MemberDB md = new MemberDB();
        md.douserdelete(username);
        session.invalidate();
        response.sendRedirect("index.jsp");
    }catch(NullPointerException e){
        ((HttpServletResponse) response).sendError(HttpServletResponse.SC_LENGTH_REQUIRED);
    }



%>