<%--
  Created by IntelliJ IDEA.
  User: KRKimwoo
  Date: 2022-05-21
  Time: 오전 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>

<%
    request.setCharacterEncoding("UTF-8");
    String title = java.net.URLDecoder.decode(request.getParameter("title"), "UTF-8");
    String info = java.net.URLDecoder.decode(request.getParameter("info"), "UTF-8");

%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
    window.onload = function () {
        swal({
            title: '<%=title%>',
            text: '<%=info%>',
            icon: 'error',
            closeOnClickOutside: false,
            buttons: {
                confirm: {
                    text: '확인',
                    value: true,
                    className: 'btn btn-outline-primary'
                }
            }
        }).then((result) => {
            if (result) {
                location.href = '<%=request.getParameter("location")%>';
            }
        });
    }
</script>
