<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.encryption.MemberDB" %>
<%@ page import="java.net.URLEncoder" %>
<%
  // request response
  String ids[] = request.getParameterValues("id");
  String username = (String) session.getAttribute("username");
  String Errortitle = URLEncoder.encode("수정 실패", "UTF-8");
  String Errorinfo = URLEncoder.encode("관리자 데이터는 수정할 수 없습니다!", "UTF-8");
//  out.println(ids[0]);
//  out.println(ids[1]);
//  out.println(ids[2]);
  try{
    if(ids.length < 1){
      ((HttpServletResponse) response).sendError(HttpServletResponse.SC_PRECONDITION_FAILED);
    }if(username == null || !username.equals("admin")){
      ((HttpServletResponse) response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
    }if(ids[0].equals("0")){%>
<jsp:include page="alerthead.jsp" flush="true">
  <jsp:param name="title" value="<%=Errortitle%>"/>
  <jsp:param name="info" value="<%=Errorinfo%>"/>
  <jsp:param name="location" value="index.jsp"/>
</jsp:include>
<%
    }
    MemberDB md = new MemberDB();
    md.dodelete(ids);

    response.sendRedirect("userlist.jsp");
  }catch(NullPointerException e){
    ((HttpServletResponse) response).sendError(HttpServletResponse.SC_PRECONDITION_FAILED);
  }



%>