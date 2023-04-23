<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>회원 정보 업데이트</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<% String username = (String)session.getAttribute("username");
    if(username == null) {
        ((HttpServletResponse) response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
    }else if(username.equals("admin")) {%>
<jsp:include page="alerthead.jsp" flush="false">
    <jsp:param name="title" value="탈퇴 불가"/>
    <jsp:param name="info" value="관리자 계정은 탈퇴할 수 없습니다!"/>
    <jsp:param name="location" value="index.jsp"/>
</jsp:include>
<%
}else{
%>
<script>
    window.onload = function () {
        swal({
            title: '경고',
            text: '회원 탈퇴를 하게 될 경우 데이터는 즉시 파기됩니다. \n정말 탈퇴하시겠습니까?',
            icon: 'warning',
            closeOnClickOutside: false,
            dangerMode : true,
            buttons : {
                cancle : {
                    text : '취소',
                    value : false,
                    className : 'btn btn-outline-primary' // 클래스 이름을 줄 수도 있다.
                },
                confirm : {
                    text : '탈퇴',
                    value : true,
                    className : 'btn btn-outline-primary'
                }
            }
        }).then((result) => {
            if(result){
                swal('탈퇴 진행', '지금까지 서비스를 이용해주셔서 감사합니다.', 'info', {
                    closeOnClickOutside: false,
                    closeOnEsc: false,
                    buttons : {
                        confirm : {
                            text : '확인',
                            value : true,
                            className : 'btn btn-outline-primary'
                        }
                    }
                }).then((result) => {
                    if(result){
                        location.href='userdeleteproc.jsp';
                    }
                });
            } else {
                location.href='index.jsp';
            }
        });
    }
</script>
<%}%>